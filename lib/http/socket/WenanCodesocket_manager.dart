import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:wenan/base/WenanCodeAppConfiguration.dart' as BaseAppConfig;
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/base/cache/WenanCodeAppCache.dart';
import 'package:wenan/data/AppConfig.dart';
import 'package:wenan/data/chat/WenanCodeChatListOtherEvent.dart';
import 'package:wenan/state/event/WenanCodeEvents.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';

import 'package:wenan/proto/we_ps_auth.pb.dart';
import 'package:wenan/proto/we_ps_bu_call.pb.dart';
import 'package:wenan/proto/we_ps_message.pb.dart';
import 'package:wenan/proto/we_ps_bu_message.pb.dart' as flash_message;
import 'package:wenan/http/socket/WenanCodechat_api.dart';
import 'package:wenan/http/socket/WenanCodecall_api.dart';
import 'package:wenan/http/socket/WenanCodesocket_api.dart';
import 'package:wenan/utils/WenanCodeAppCacheKeys.dart';
import 'package:wenan/ClientInfo.dart';
import 'package:wenan/utils/WenanCodeDelayQueue.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

import 'package:protobuf/protobuf.dart';

import 'WenanCodeflash_api.dart';
import 'WenanCodesocket_rsp.dart';
import 'WenanCodesocket_util.dart';

enum SocketStatus {
  disconnected,
  connected,
  authed,
  connecting,
}

class SocketStatusEvent {
  final SocketStatus status;

  SocketStatusEvent(this.status);
}

class SocketManager {
  static const int HEARTBEAT_INTERVAL = 10 * 1000; // milliseconds
  static const int REQ_TIMEOUT_INTERVAL = 10 * 1000; // milliseconds
  static const int CONNECT_RETRY_COUNT = 5;

  static final SocketManager _instance = SocketManager._internal();

  static SocketManager get instance => _instance;
  CommonApi commonApi = CommonApi(DioHelper.getInstance());

  Socket? _socket; //socket实例
  var _recList; // 数据接收组
  Timer? _heartbeatTimer;
  final Map<int, StreamController<SocketRsp>> _requestMap = {};
  final DelayQueue _delayQueue = DelayQueue();

  int _lastPingTime = 0;
  int _lastReceiveMessageTime = 0;
  int _retryCount = 0;
  SocketStatus _status = SocketStatus.disconnected;

  SocketManager._internal() {
    Application.eventBus.on<AuthRsp>().listen((event) {
      if (event.code == 0) {
        _onSocketAuthed();
      }
    });
  }

  bool get isDisconnected => _status == SocketStatus.disconnected;

  bool get isConnected =>
      _status == SocketStatus.connected || _status == SocketStatus.authed;

  bool get isAuthed => _status == SocketStatus.authed;

  bool get isConnecting => _status == SocketStatus.connecting;

  void _retryConnect() {
    Future.delayed(const Duration(seconds: 1), () => connect());
  }

  Future<void> connect() async {

    AuvChatLog.d('Socket - connect : ${Application.isForeground}, $_status,_retryCount:$_retryCount,Application.isLogin()=${Application.isLogin()}');
    //有时候网络状态判断不准确
    if ((!Application.isForeground) ||
        _retryCount > CONNECT_RETRY_COUNT ) {
      _retryCount = 0;
      return;
    }
    if(!Application.isUserStatusOk()){
      return;
    }
    if (!isDisconnected||isConnecting) return;


    ++_retryCount;
    _status = SocketStatus.connecting;

    _recList = <int>[]; // 初始化接收组

    final socketUrls = await _getSocketUrls();
    AuvChatLog.d("socketUrls:$socketUrls");
    if (socketUrls == null || socketUrls.isEmpty) {
      _status = SocketStatus.disconnected;
      _retryConnect();
      return;
    }

    for (final url in socketUrls) {
      try {
        AuvChatLog.d("Socket - connect to ${url.host}:${url.port}");
        // 建立链接
        _socket = await Socket.connect(url.host, Utils.parseInt(url.port)??0,timeout: const Duration(seconds: 20));
        _socket!.setOption(SocketOption.tcpNoDelay, true);
        // 添加数据监听
        _socket!.listen((data) {
          _readData(data);
        }, onError: (e) {
          AuvChatLog.d("Socket - onError: $e");
          _onSocketClosed(-1);
        }, onDone: () {
          AuvChatLog.d("Socket - onDone");
          _onSocketClosed(1);
        }, cancelOnError: true);
        _onSocketOpen();
        break;
      } catch (e) {
        AuvChatLog.printE(e);
        _socket = null;
        _status = SocketStatus.disconnected;
        _retryConnect();
      }
    }
  }

  Future<List<AppSocket>?> _getSocketUrls() async {
    List<AppSocket>? cached = _getCachedAppConfig()?.data?.router?.sockets;
    if(!Utils.isEmpty(cached)){
      _getSocketUrlsFromCloud();
      return cached!;
    } else {
      return await _getSocketUrlsFromCloud();
    }
  }

  Future<List<AppSocket>?> _getSocketUrlsFromCloud() async {
    try {
      final configRsp = await commonApi.getConfig(json.encode(ClientInfo().toJson()));
      if(configRsp.getCodeInt()==0){
        AppCache.instance.putSharePref(AppCacheKeys.APP_CONFIG, configRsp);
        SpHelper.setCurrAppConfigJson(jsonEncode(configRsp.toJson()));
        return configRsp.data?.router?.sockets;
      }
    } catch (e) {
      AuvChatLog.printE(e);
    }
    return null;
  }

  AppConfigRsp? _getCachedAppConfig(){
    var cachedConfig = SpHelper.getCurrAppConfigJson();
    if(!Utils.isEmpty(cachedConfig)){
      return AppConfigRsp.fromJson(jsonDecode(cachedConfig!));
    }

    return null;
  }

  void _onSocketOpen() {
    AuvChatLog.d("Socket - onSocketOpen");
    _retryCount = 0;
    _status = SocketStatus.connected;
    Application.eventBus.fire(SocketStatusEvent(_status));
    _startTimer();
    if (Application.isLogin()) {
      SocketApi.sendAuth();
    }
  }

  void _onSocketAuthed() {
    AuvChatLog.d('Socket - _onSocketAuthed');
    _status = SocketStatus.authed;
    Application.eventBus.fire(SocketStatusEvent(_status));
  }

  void _onSocketClosed(int code) {
    AuvChatLog.d("Socket - onSocketClosed: $code");
    _status = SocketStatus.disconnected;
    Application.eventBus.fire(SocketStatusEvent(_status));
    _stopTimer();
    _socket = null;
    _lastPingTime = 0;
    _lastReceiveMessageTime = 0;
    _handleFailAllReqTask();
    _retryConnect();
  }

  void disconnect() {
    AuvChatLog.d("Socket - disconnect");
    _lastPingTime = 0;
    _lastReceiveMessageTime = 0;
    try {
      _socket?.close();
    } catch (e) {
      AuvChatLog.printE(e);
    }
    _socket = null;
    _handleFailAllReqTask();
  }

  Stream<SocketRsp> sendMsg(Message msg) {
    StreamController<SocketRsp> controller = StreamController<SocketRsp>();
    if (_socket == null) {
      controller.add(SocketRsp.noConnection);
      controller.close();
    } else {
      //不需要rsp的请求不用放入回调map
      bool needRsp = SocketUtil.requestQueueFilter(msg);
      if(needRsp){
        _requestMap[msg.seqno] = controller;
      } else {
        if(BaseAppConfig.AppConfig.printSocketLog) {
          AuvChatLog.d("emptyObserver:$msg....ignore it's rsp!");
        }
      }
      //给服务端回的ack有可能会跟本地发出的req seqno重复？
      if(!SocketUtil.isMsgTypeCommonAck(msg)){
        DelaySeqNo delaySeqNo = DelaySeqNo(msg.seqno);
        if (!_delayQueue.contains(delaySeqNo)) {
          _delayQueue.add(delaySeqNo);
        }
      }
    }
    if(BaseAppConfig.AppConfig.printSocketLog) {
      AuvChatLog.d("Socket - send socket msg: " + msg.toString());
    }
    _sendMsgInternal(_protoToDelimitedBuffer(msg));

    return controller.stream;
  }

  void _sendMsgInternal(List<int> msg) {
    _socket?.add(msg);
  }

  List<int> _protoToDelimitedBuffer(Message message) {
    var messageBuffer = CodedBufferWriter();
    message.writeToCodedBufferWriter(messageBuffer);

    var delimiterBuffer = CodedBufferWriter();
    delimiterBuffer.writeInt32NoTag(messageBuffer.lengthInBytes);

    var result =
    Uint8List(messageBuffer.lengthInBytes + delimiterBuffer.lengthInBytes);

    delimiterBuffer.writeTo(result);
    messageBuffer.writeTo(result, delimiterBuffer.lengthInBytes);

    return result;
  }

  void _readData(List dataList) {
    if(BaseAppConfig.AppConfig.printSocketLog) {
      AuvChatLog.d(
          "Socket - readData, dataList: ${dataList.length}, $dataList");
    }
    if (dataList == null) return;
    //接收并暂存
    _recList = _recList + dataList;
    var reader = CodedBufferReader(_recList);
    var length = reader.readInt32();
    if(BaseAppConfig.AppConfig.printSocketLog) {
      AuvChatLog.d(
          "Socket - readData, length: $length, _recList.size: ${_recList
              .length}");
    }
    while (_recList.length > length) {
      Message message = Message.create();
      CodedBufferReader(_recList).readMessage(message, ExtensionRegistry());
      _recList = _recList.sublist(_protoToDelimitedBuffer(message).length);
      try {
        _parseMsg(message);
      } catch (e,stack) {
        AuvChatLog.printE('Socket - parseMsg error: $e',error: stack);
      }
      if (_recList.length > 0) {
        reader = CodedBufferReader(_recList);
        length = reader.readInt32();
      }
    }
  }

  //收到服务端响应的消息时延时心跳
  void _delayPingWhenReceiveRspMsg() {
    _lastReceiveMessageTime = DateTime.now().millisecondsSinceEpoch;
  }

  void _sendHeartbeat() {
    if(BaseAppConfig.AppConfig.printSocketLog) {
      AuvChatLog.d("Socket - _sendHeartBeat start");
    }
    int currTime = DateTime.now().millisecondsSinceEpoch;
    if ((currTime - _lastPingTime) >= HEARTBEAT_INTERVAL) {
      if(BaseAppConfig.AppConfig.printSocketLog) {
        AuvChatLog.d("Socket - _sendHeartBeat send");
      }
      _sendHeartbeatMessage();
      _lastPingTime = currTime;
    }
//    //5次ping未收到消息,断开重连
//    if (_lastReceiveMessageTime > 0 &&
//        ((_lastPingTime - _lastReceiveMessageTime) > HEARTBEAT_INTERVAL * 6)) {
//      AuvChatLog.d("5次ping未收到消息,断开重连");
//      disconnectSyncly();
//      connect();
//    }
  }

  void _sendHeartbeatMessage() {
    Message heartBeat = Message.create();
    heartBeat.messageCate = Message_Category.BASE.value;
    heartBeat.messageType = Message_Type.HEARTBEAT.value;

    sendMsg(heartBeat);
  }

  void _stopTimer() {
    if (_heartbeatTimer?.isActive??false) {
      _heartbeatTimer?.cancel();
    }
  }

  void _startTimer() {
    _stopTimer();
    _heartbeatTimer = Timer.periodic(const Duration(milliseconds: HEARTBEAT_INTERVAL),
            (Timer timer) {
              if(BaseAppConfig.AppConfig.printSocketLog) {
                AuvChatLog.d("Socket - socket timer");
              }
          _sendHeartbeat();
          _handleReqTimeoutTask();
        });
  }

  void _handleReqTimeoutTask() {
    if(BaseAppConfig.AppConfig.printSocketLog) {
      AuvChatLog.d(
          "Socket - handleReqTimeoutTask, delayQueue.size: ${_delayQueue
              .size()}");
    }
    Delayed? item;
    while ((item = _delayQueue.poll()) != null) {
      int seqNum = (item as DelaySeqNo).seqNo;
      StreamController<SocketRsp>? controller = _requestMap.remove(seqNum);
      if (controller != null) {
        controller.add(SocketRsp.timeout);
        controller.close();

        if(BaseAppConfig.AppConfig.printSocketLog) {
          AuvChatLog.d("Socket - handleReqTimeoutTask, seqNum:$seqNum");
        }
      }
    }
  }

  void _handleFailAllReqTask() {
    AuvChatLog.d(
        "Socket - _handleFailAllReqTask, delayQueue.size: ${_delayQueue.size()}");
    Delayed? item;
    while ((item = _delayQueue.pop()) != null) {
      int seqNum = (item as DelaySeqNo).seqNo;
      StreamController<SocketRsp>? controller = _requestMap.remove(seqNum);
      if (controller != null) {
        controller.add(SocketRsp.timeout);
        controller.close();

        AuvChatLog.d("Socket - _handleFailAllReqTask, seqNum:$seqNum");
      }
    }
  }

  static const int _SEQ_NUMBER_MAX = 0x7fffffff;
  static const int _SEQ_NUMBER_MIN = 1;

  static int _SEQ_NUMBER = 1;

  static int getRequestSeqNo() {
    if (_SEQ_NUMBER < _SEQ_NUMBER_MAX) {
      _SEQ_NUMBER++;
    } else {
      _SEQ_NUMBER = _SEQ_NUMBER_MIN;
    }
    return _SEQ_NUMBER;
  }

  static void resetRequestSeqNo() {
    _SEQ_NUMBER = _SEQ_NUMBER_MIN;
  }

  void _parseMsg(Message message) {
    if(BaseAppConfig.AppConfig.printSocketLog){
      AuvChatLog.d("Socket - parseMsg: message = ${message.writeToJson()}");
    }

    int seqNum = message.seqno;
    _delayQueue.remove(DelaySeqNo(seqNum));
    if (message.messageCate == Message_Category.BASE.value) {
      _parseBaseCateMsg(message);
    } else if (message.messageCate == Message_Category.IM.value) {
      _parseImCateMsg(message);
    } else if (message.messageCate == FlashApi.MessageCateFlash) {
      _parseFlashMessage(message);
    }

    String? messageTypeName = SocketUtil.getMsgTypeName(message);
    //无法获取到具体类型，试着在req队列里找找，看能不能找到对应的rsp
    //目前只有rsp才需要处理req
    if(BaseAppConfig.AppConfig.printSocketLog) {
      AuvChatLog.d("messageTypeName:$messageTypeName");
    }
    if (Utils.isEmpty(messageTypeName) || messageTypeName!.toUpperCase().endsWith("RSP")) {
      StreamController<SocketRsp>? controller = _requestMap.remove(seqNum);
      if (controller != null) {
        controller.add(SocketRsp(message: message));
        controller.close();
      }
    }

  }

  void _parseBaseCateMsg(Message message) {
    int messageType = message.messageType;
    if (messageType == Message_Type.HEARTBEAT.value) {
      _parsePing();
    } else if (messageType == Message_Type.SESSIONINVALIDNOTIFY.value) {
      _parseSessionInvalidNotify(message);
    } else if (messageType == Message_Type.AUTHRSP.value) {
      AuthRsp? rsp = SocketUtil.unpackMessage(AuthRsp(), message.messageObject);
      AuvChatLog.d(
          "Socket - AuthRsp, code: ${rsp?.code}, msg: ${rsp?.msg}, needUpdate: ${rsp?.needUpgrade}");
    }
  }

  void _parseImCateMsg(Message message) {
    ChatApi.dispatchSyncNotify(message);
  }

  void _parseFlashMessage(Message message) {
    var msgType = flash_message.Message_Type.valueOf(message.messageType);

    if (flash_message.Message_Type.CHATCALLPSH == msgType) {
      CallApi.dispatchChatCallPush(message);
    } else if (flash_message.Message_Type.CHATCALLMATCHPSH == msgType) {
      CallApi.dispatchChatCallMatchPush(message);
    } else if (flash_message.Message_Type.SYSNOTIFICATIONNOTIFY == msgType) {
      Application.eventBus.fire(ChatListOtherEvent(ChatListOtherEventType.notifyMessageChanged));
    } else if (flash_message.Message_Type.BEGGIFTPSH == msgType) {
      Utils.nullSafe<BegGiftPSH>(SocketUtil.unpackMessage(BegGiftPSH.create(), message.messageObject),notNullBlock: (begGiftPush)=>{Application.eventBus.fire(begGiftPush)});
    }

  }

  void _parsePing() {
    _lastReceiveMessageTime = DateTime.now().millisecondsSinceEpoch;
    if(BaseAppConfig.AppConfig.printSocketLog) {
      AuvChatLog.d("Socket - receive ping: $_lastReceiveMessageTime");
    }
  }

  void _parseSessionInvalidNotify(Message message) {
    AuvChatLog.d("Socket - parseSessionInvalidNotify");
    SessionInvalidNotify? notify;
    try {
      notify = message.messageObject.unpackInto(SessionInvalidNotify());
    } catch (e) {
      AuvChatLog.d(e.toString());
    } finally {
      Application.quit();
      Application.eventBus.fire(OverdueSession(notify?.msg));
    }
  }
}

class DelaySeqNo implements Delayed {
  int seqNo = 0;
  int expireTime = 0;

  DelaySeqNo(this.seqNo) {
    expireTime = DateTime.now().millisecondsSinceEpoch +
        SocketManager.REQ_TIMEOUT_INTERVAL;
  }

  @override
  bool equals(Delayed? o) {
    if (o == null) {
      return false;
    }

    if (o == this) {
      return true;
    }

    if (o is DelaySeqNo) {
      return seqNo == o.seqNo;
    }

    return false;
  }

  @override
  int getDelay() {
    return expireTime - DateTime.now().millisecondsSinceEpoch;
  }
}
