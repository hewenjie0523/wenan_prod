import 'dart:async';
import 'dart:ffi';

import 'package:fixnum/fixnum.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/proto/we_ps_auth.pb.dart';
import 'package:wenan/proto/we_ps_common.pb.dart';
import 'package:wenan/proto/we_ps_message.pb.dart';
import 'package:wenan/proto/we_ps_sync.pb.dart';
import 'package:wenan/proto/we_ps_im_message.pb.dart' as IM_MESSAGE;
import 'package:wenan/http/socket/WenanCodesocket_manager.dart';
import 'package:wenan/http/socket/WenanCodesocket_rsp.dart';
import 'package:wenan/ClientInfo.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

import 'package:protobuf/protobuf.dart';

import 'WenanCodesocket_util.dart';

class SocketApi {
  static int PVER = 1;

  static Future sendAuth() async {
    if(Utils.isEmpty(Application.session)){
      return Future.value(Void);
    }
    final clientInfo = ClientInfo();
    AuvChatLog.d("sendAuth,clientInfo:${clientInfo.toJson()}");
    String ts = DateTime.now().millisecondsSinceEpoch.toString();

    AuthReq authReq = AuthReq.create();
    authReq.sigu = buildSocketSig(clientInfo, ts);
    authReq.sess = Application.session;
    authReq.ver = clientInfo.version??"";
    authReq.dId = clientInfo.device_id??"";
    authReq.model = clientInfo.model??"";
    authReq.os = clientInfo.system??"";
    authReq.ts = ts;
    authReq.pVersion = PVER;
    authReq.lang = clientInfo.lang??"";
    authReq.pName = AppConfig.packageName;
    SocketManager.instance
        .sendMsg(SocketUtil.packMessage(
            Message_Category.BASE.value, Message_Type.AUTHREQ.value, authReq))
        .listen((socketRsp) {
      if (socketRsp.message != null) {
        AuthRsp? rsp = SocketUtil.unpackMessage(
            AuthRsp(), socketRsp.message?.messageObject);
        // UpgradeHandler.showUpgradeHandler(
        //     rsp.needUpdate, rsp.updateIntro, rsp.appUrl);
        if(rsp!=null){
          Application.eventBus.fire(rsp);
        }
        AuvChatLog.d(
            "socketRsp,rspStr:${rsp?.code},msg:${rsp?.msg},needUpdate:${rsp?.needUpgrade}");

      }
    }, onError: (e) {
      AuvChatLog.printE(e);
    });
  }

  static String buildSocketSig(ClientInfo clientInfo, String ts) {
    final _param = {
      'session': Application.session,
      "version": clientInfo.version,
      "device_id": clientInfo.device_id,
      "model": clientInfo.model,
      'os': clientInfo.system,
      "timestamp": ts,
      "p_ver": PVER,
      "lang": clientInfo.lang,
      "packageName": AppConfig.packageName,
    };

    return sessionParamsSig(_param);
  }

  static String sessionParamsSig(Map<String, dynamic> old) {
    List<String> keys = <String>[];
    keys.addAll(old.keys);
    keys.sort((a, b) => b.compareTo(a));
    String sig = buildSig(keys, old);
    return sig;
  }

  static String buildSig(List<String> keys, Map<String, dynamic> old) {
    var buffer = StringBuffer();
    for (final elem in keys) {
      buffer.write(old[elem].toString());
      buffer.write(":");
    }
    buffer.write(Application.secretKey);
    return Utils.generateMd5(buffer.toString());
  }

  /// 同步
  ///
  /// @param syncType
  /// @param last_key
  static void sendSync(SyncType syncType, Int64 lastKey) {
    Sync sync = Sync();
    sync.type = syncType;
    sync.lastKey = lastKey;
    AuvChatLog.d("sendSync:$syncType,last_key=$lastKey");

    SocketManager.instance
        .sendMsg(SocketUtil.packMessage(Message_Category.IM.value,
            IM_MESSAGE.Message_Type.SYNC.value, sync))
        .listen((socketRsp) {
      AuvChatLog.d("sync rsp type: $syncType");
    }, onError: (e) {
      AuvChatLog.d("sync rsp type: $syncType, error: $e");
    });
  }

  static Stream<T?>  sendCommonMsgWithRspInstance <T extends GeneratedMessage> (T rspInstance,
      int messageCate, int messageType, GeneratedMessage messageBody) {
    return sendCommonMsg(messageCate, messageType, messageBody).map((event) {
      if(event.isSuccess){
        return event.getRsp(rspInstance);
      } else {
        throw SocketRspError(event.code,errorMsg: event.msg);
      }
    });
  }


  static Stream<SocketRsp> sendCommonMsg(
      int messageCate, int messageType, GeneratedMessage messageBody) {
    AuvChatLog.d(
        "sendCommonMsg:$messageCate,$messageType,${messageBody.writeToJson()}");
    AuvChatLog.d("socketAuthed: ${SocketManager.instance.isAuthed}");
    if (!SocketManager.instance.isConnected) {
      SocketManager.instance.connect();

      StreamController<SocketRsp> controller = StreamController<SocketRsp>();
      controller.add(SocketRsp.noConnection);
      controller.close();
      return controller.stream;
    } else if (!SocketManager.instance.isAuthed && Application.isLogin()) {
      StreamController<SocketRsp> controller = StreamController<SocketRsp>();
      controller.add(SocketRsp.notAuth);
      controller.close();
      SocketApi.sendAuth();
      return controller.stream;
    }

    return SocketManager.instance
        .sendMsg(SocketUtil.packMessage(messageCate, messageType, messageBody));
  }

  static Stream<SocketRsp> sendCommonAck(Message originalMessage) {
    AuvChatLog.d("sendCommonAck:${originalMessage.writeToJson()}");
    CommonACK commonACK = CommonACK.create();
    commonACK.code = 0;
    commonACK.originalMsgCate = originalMessage.messageCate;
    commonACK.originalMsgType = originalMessage.messageType;
    Message message = SocketUtil.packMessage(
        Message_Category.BASE.value, Message_Type.COMMONACK.value, commonACK);
    message.seqno = originalMessage.seqno;
    return SocketManager.instance.sendMsg(message);
  }
}
