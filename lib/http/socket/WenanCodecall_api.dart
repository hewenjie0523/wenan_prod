import 'package:fixnum/fixnum.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/proto/we_ps_bu_message.pbenum.dart' as Club9Message;
import 'package:wenan/http/socket/WenanCodesocket_api.dart';
import 'package:wenan/http/socket/WenanCodesocket_rsp.dart';
import 'package:wenan/http/socket/WenanCodesocket_util.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/view/call/WenanCodePhoneCallPage.dart';

import '../../base/WenanCodeApplication.dart';
import '../../state/call/WenanCodePhoneCallNotify.dart';
import '../../data/call/AppChatCall.dart';
import '../../data/call/WenanCodeAppCheckCallRsp.dart';
import '../../state/event/WenanCodeChatCallEvent.dart';
import '../../state/event/WenanCodeCheckCallingEvent.dart';
import '../../proto/we_ps_auth.pb.dart';
import '../../proto/we_ps_bu_call.pb.dart';
import '../../proto/we_ps_common.pb.dart';
import '../../proto/we_ps_message.pb.dart';
import 'WenanCodeflash_api.dart';

enum ChatCallOpt {
  ///0 主叫邀请
  invite,

  ///1 被叫响铃
  ring,

  ///2 被叫忙
  busy,

  ///3 被叫摘铃
  pickUp,

  ///4 主叫确认开始通话
  confirmed,

  ///5 主叫取消
  cancel,

  ///6 更改通话类型
  update,

  ///7 被叫拒绝
  reject,

  ///8 Bye Bye
  bye,

  ///9 同步最新通话信息
  sync,

  ///10 通话心跳
  options,

  ///11 通话响应
  respond,
}

extension ChatCallOptExtension on ChatCallOpt {
  ChatCallReq_Opt get protoValue {
    switch (this) {
      case ChatCallOpt.invite:
        return ChatCallReq_Opt.INVITE;
      case ChatCallOpt.ring:
        return ChatCallReq_Opt.RING;
      case ChatCallOpt.busy:
        return ChatCallReq_Opt.BUSY;
      case ChatCallOpt.pickUp:
        return ChatCallReq_Opt.PICK_UP;
      case ChatCallOpt.confirmed:
        return ChatCallReq_Opt.CONFIRMED;
      case ChatCallOpt.cancel:
        return ChatCallReq_Opt.CANCEL;
      case ChatCallOpt.update:
        return ChatCallReq_Opt.UPDATE;
      case ChatCallOpt.reject:
        return ChatCallReq_Opt.REJECT;
      case ChatCallOpt.bye:
        return ChatCallReq_Opt.BYE;
      case ChatCallOpt.sync:
        return ChatCallReq_Opt.SYNC;
      case ChatCallOpt.options:
        return ChatCallReq_Opt.OPTIONS;
      case ChatCallOpt.respond:
        return ChatCallReq_Opt.RESPOND;
    }
  }
}

enum ChatCallMedia {
  ///语音
  voice,

  ///视频
  video
}

enum ChatCallReqQuality {
  unknown,
  excellent,
  good,
  poor,
  bad,
  vBad,
  down,
  detecting,
}

extension ChatCallReqQualityExtension on ChatCallReqQuality {
  ChatCallReq_Quality get protoValue {
    switch (this) {
      case ChatCallReqQuality.unknown:
        return ChatCallReq_Quality.UNKNOWN;
      case ChatCallReqQuality.excellent:
        return ChatCallReq_Quality.EXCELLENT;
      case ChatCallReqQuality.good:
        return ChatCallReq_Quality.GOOD;
      case ChatCallReqQuality.poor:
        return ChatCallReq_Quality.POOR;
      case ChatCallReqQuality.bad:
        return ChatCallReq_Quality.BAD;
      case ChatCallReqQuality.vBad:
        return ChatCallReq_Quality.VBAD;
      case ChatCallReqQuality.down:
        return ChatCallReq_Quality.DOWN;
      case ChatCallReqQuality.detecting:
        return ChatCallReq_Quality.DETECTING;
    }
  }
}

class CallApi {
  static const String TAG = "CallApi";
  static const int AIC_TIMEOUT = 15;
  static const int AIV_TIMEOUT = 45;
  static AppChatCall? _currentCall;

  static Future listenOn() async {
    Application.eventBus.on<AuthRsp>().listen((event) {
      AuvChatLog.d("listenOn AuthRsp", tag: TAG);
      syncCurrentChatCallStatus();
    });
  }

  static AppChatCall? getCurrentCall({int? chatId}) {
    final current = _currentCall;
    if (chatId == null) {
      return current;
    }
    if (current != null && chatId == current.id) {
      return current;
    }
    return null;
  }

  static void updateCurrentCall(AppChatCall newValue) {
    final current = _currentCall;
    if (current == null) {
      _currentCall = newValue;
    } else if (current.id == newValue.id) {
      _currentCall = newValue;
    }
    if (_currentCall?.isEnd() == true) {
      clearCurrentCall(newValue.id);
    }
    AuvChatLog.d(
        "updateCurrentCall newValue id:${newValue.id} status:${newValue.status} is_induce:${newValue.isInduce}",
        tag: TAG);
    AuvChatLog.d(
        "updateCurrentCall currentCall id:${_currentCall?.id} status:${_currentCall?.status} is_induce:${_currentCall?.isInduce}",
        tag: TAG);
  }

  static void clearCurrentCall(int callId) {
    AuvChatLog.d("clearCurrentCall callId:$callId", tag: TAG);
    PhoneCallPage.removeCallStatus(callId);
    if (_currentCall == null) return;
    if (_currentCall?.id == callId) {
      _currentCall = null;
    } else {
      AuvChatLog.e(
          "clearCurrentCall error callId:$callId chatCallId:${_currentCall?.id}",
          tag: TAG);
    }
  }

  /// chatId 来电id
  static bool _hasCallIn({int chatId = 0}) {
    final call = _currentCall;
    if (call == null) return false; // 无来电
    if (call.id == chatId) return false; // 相同来电
    return call.status.isDialing();
  }

  /// chatId 来电id
  static bool _hasCalling({int chatId = 0}) {
    final call = _currentCall;
    if (call == null) return false; // 无来电
    if (call.id == chatId) return false; // 相同来电
    return call.status.isCalling();
  }

  /// chatId 来电id
  static bool imBusy({int chatId = 0}) {
    AuvChatLog.d(
        "imBusy chatId:$chatId hasCallIn:${_hasCallIn(chatId: chatId)} hasCalling:${_hasCalling(chatId: chatId)} currentCall:${_currentCall?.toJson()}",
        tag: TAG);
    final call = _currentCall;
    if (call == null) return false; // 无来电
    if (call.id == chatId) return false; // 相同来电
    return _hasCallIn(chatId: chatId) || _hasCalling(chatId: chatId);
  }

  /// 检查数据状态 更新页面
  static _updatePageStatus() {
    AuvChatLog.d("updateActivityStatus", tag: TAG);
    //检查AI来电是否超时
    final currentCall = getCurrentCall();
    if (currentCall != null && currentCall.isInduce == true) {
      final notifyTimeMillis = PhoneCallNotify.notifyTimeMillis;
      final isNotifyShow = PhoneCallNotify.isNotifyShowing();
      if (notifyTimeMillis > 0) {
        final timeInterval =
            DateTime.now().millisecondsSinceEpoch - notifyTimeMillis;
        bool clearAICall = false;
        //AI通话 通知页面
        if (isNotifyShow) {
          if (currentCall.hasVideo()) {
            //AIV 是否超时
            clearAICall = timeInterval > AIV_TIMEOUT * 1000;
          } else if (currentCall.sourceType == ChatCallSourceType.aics.index) {
            //AIC 是否超时
            clearAICall = timeInterval > AIC_TIMEOUT * 1000;
          }
        }
        AuvChatLog.d(
            "updateActivityStatus isNotifyShow:$isNotifyShow clearAICall:$clearAICall",
            tag: TAG);
        if (clearAICall) clearCurrentCall(currentCall.id);
      }
    }
    if (!_hasCallIn()) {
      AuvChatLog.d("updateActivityStatus no call in", tag: TAG);
      PhoneCallNotify.dismissNotify();
    }
    if (!_hasCalling()) {
      AuvChatLog.d("updateActivityStatus no calling", tag: TAG);
      //没有通话中 通知页面检查数据
      Application.eventBus.fire(CheckCallingEvent());
    }
    syncCurrentChatCallStatus();
  }

  /// 与服务端同步当前通话状态
  static syncCurrentChatCallStatus() {
    final currentCall = getCurrentCall();
    if (currentCall != null && currentCall.id > 0) {
      //同步一下当前通话状态
      AuvChatLog.d("syncCurrentChatCallStatus id:${currentCall.id}", tag: TAG);
      sendChatCallReq(id: currentCall.id, chatboxId: currentCall.chatId, opt: ChatCallOpt.sync, subscriberId: currentCall.subscriberId);
    }
  }

  static void dispatchChatCallPush(Message message) {
    final protoObj =
        SocketUtil.unpackMessage(ChatCallPsh.create(), message.messageObject);
    if (protoObj == null) {
      AuvChatLog.e("dispatchChatCallPush protoObj == null", tag: TAG);
      SocketApi.sendCommonAck(message);
      return;
    }
    final chatCall = SocketUtil.convertChatCallProto(protoObj.call);
    AuvChatLog.d("dispatchChatCallPush chatCall:${chatCall.toJson()}",
        tag: TAG);
    //来电
    if (chatCall.status == ChatCallStatus.trying && !chatCall.isMeCalling()) {
      _updatePageStatus();
      final chatId = chatCall.id;
      if (chatId == 0) {
        AuvChatLog.e("dispatchChatCallPush chatId == 0", tag: TAG);
        SocketApi.sendCommonAck(message);
        return;
      }
      final imBusyNow = imBusy(chatId: chatId);
      final isNotifyShow = PhoneCallNotify.isNotifyShowing();
      final inCalling = PhoneCallPage.inCalling(TAG);
      final busy = imBusyNow || isNotifyShow || inCalling;
      if (busy) {
        AuvChatLog.d("dispatchChatCallPush  imBusyNow:$imBusyNow isNotifyShow:$isNotifyShow inCalling:$inCalling", tag: TAG);
        if (chatCall.isInduce != true) {
          sendChatCallReq(id: chatId, chatboxId: chatCall.chatId, opt: ChatCallOpt.busy, subscriberId: chatCall.subscriberId);
        }
        SocketApi.sendCommonAck(message);
        return;
      }
    }
    AuvChatLog.d("dispatchChatCallPush notify", tag: TAG);
    handleChatCallPush(chatCall);
    //主播端逻辑
    //if (chatCall.status == ChatCallStatus.trying.index && !chatCall.isMeCalling()) sendChatCallReq(id: chatId, chatboxId: chatCall.chatId, opt: ChatCallOpt.respond);
    SocketApi.sendCommonAck(message);
  }

  static void dispatchChatCallMatchPush(Message message) {
    final protoObj = SocketUtil.unpackMessage(
        ChatCallMatchPSH.create(), message.messageObject);
    if (protoObj == null) {
      AuvChatLog.e("dispatchChatCallMatchPush protoObj == null", tag: TAG);
      SocketApi.sendCommonAck(message);
      return;
    }
    //来电
    // if (chatCall.status == ChatCallStatus.trying && !chatCall.isMeCalling()) {
    //   _updatePageStatus();
    //   final chatId = chatCall.id;
    //   if (chatId == 0) {
    //     AuvChatLog.e("dispatchChatCallMatchPush chatId == 0", tag: TAG);
    //     SocketApi.sendCommonAck(message);
    //     return;
    //   }
    //   final imBusyNow = imBusy(chatId: chatId);
    //   final isNotifyShow = PhoneCallNotify.isNotifyShowing();
    //   //TODO final isCalling;
    //   final inCalling = false;
    //   final busy = imBusyNow || isNotifyShow || inCalling;
    //   if (busy) {
    //     AuvChatLog.d("dispatchChatCallMatchPush  imBusyNow:$imBusyNow isNotifyShow:$isNotifyShow inCalling:$inCalling", tag: TAG);
    //     if (chatCall.isInduce = false) sendChatCallReq(id: chatId, chatboxId: chatCall.chatId, opt: ChatCallOpt.busy);
    //     SocketApi.sendCommonAck(message);
    //     return;
    //   }
    // }
    AuvChatLog.d("dispatchChatCallMatchPush $protoObj", tag: TAG);
    Application.eventBus.fire(protoObj);
    SocketApi.sendCommonAck(message);
  }

  static void handleChatCallPush(AppChatCall chatCall) {
    AuvChatLog.d(
        "handleChatCallPush chatCallEvent id:${chatCall.id} status:${chatCall.status}",
        tag: TAG);
    if (chatCall.isEnd()) {
      final current = _currentCall;
      if (current == null || current.status != chatCall.status) {
        makeChatToast(chatCall);
      }
    }
    updateCurrentCall(chatCall);
    Application.eventBus.fire(ChatCallEvent(chatCall));
    PhoneCallNotify.handleCall(chatCall);
  }

  ///
  /// toast 通话状态提示
  ///
  /// @param chatCall 通话对象
  static void makeChatToast(AppChatCall chatCall) {
    switch (chatCall.status) {
      case ChatCallStatus.requestTimeout:
        if (chatCall.isMeCalling()) {
          showChatCallToast(StringTranslate.e2z(Application.appLocalizations?.wenan_string_oncall_timeout60));
        } else {
          showChatCallToast(StringTranslate.e2z(Application.appLocalizations?.wenan_string_connecting_timeout));
        }
        break;
      case ChatCallStatus.busyHere:
        if (chatCall.isMeCalling()) {
          showChatCallToast(StringTranslate.e2z(Application.appLocalizations?.wenan_string_the_user_is_busy));
        }
        break;
      case ChatCallStatus.rejected:
        if (chatCall.isMeCalling()) {
          showChatCallToast(StringTranslate.e2z(Application.appLocalizations?.wenan_string_the_girl_is_rejected));
        } else {
          //被叫自己点的拒接 不用提示
        }
        break;
      case ChatCallStatus.canceled:
        if (chatCall.isMeCalling()) {
          //主叫自己点的取消 不用提示
        } else {
          showChatCallToast(StringTranslate.e2z(Application.appLocalizations?.wenan_string_call_canceled));
        }
        break;
      case ChatCallStatus.bye:
        // 1:主叫第一帧超时 2:被叫第一帧超时 3:主叫心跳超时 4:被叫心跳超时 5:主叫挂断 6:被叫挂断 7:费用不够挂断 8:有一方开启新电话挂断
        switch (chatCall.byeReason) {
          case 1:
          case 2:
            if (chatCall.isMeCalling()) {
              showChatCallToast(
                  StringTranslate.e2z(Application.appLocalizations?.wenan_string_connecting_timeout));
            } else {
              //为了及时响应 放在 PhoneCallView closeForCallTimeOut
              showChatCallToast(
                  StringTranslate.e2z(Application.appLocalizations?.wenan_string_connecting_timeout));
            }
            break;
          case 5:
            if (chatCall.isMeCalling()) {
              //主叫自己点的挂断 不需要提示
            } else {
              //主叫挂断 我是被叫 提示 对方挂断
              showChatCallToast(
                  StringTranslate.e2z(Application.appLocalizations?.wenan_string_the_other_hang_up));
            }
            break;
          case 6:
            if (chatCall.isMeCalling()) {
              //被叫挂断 我是主叫 提示 对方挂断
              showChatCallToast(
                  StringTranslate.e2z(Application.appLocalizations?.wenan_string_the_other_hang_up));
            }
            break;
          case 7:
            //费用不够挂断
            showChatCallToast(
                StringTranslate.e2z(Application.appLocalizations?.wenan_string_your_yu_e_not_enough));
            break;
          default:
            if (!chatCall.isMeCalling()) {
              showChatCallToast(
                  StringTranslate.e2z(Application.appLocalizations?.wenan_string_the_other_hang_up));
            }
            break;
        }
        break;
      default:
        break;
    }
  }

  static void showChatCallToast(String? toast) {
    if (toast == null) return;
    Fluttertoast.showToast(msg: toast);
  }

  /// * 通话请求
  ///
  /// id : 呼叫id主叫方发起呼叫时可不传
  ///
  /// chatboxId : 无chatboxId时传 subscriberId
  ///
  /// subscriberId : 被叫用户uid
  ///
  /// opt : 操作请求
  ///
  /// media : 通话类型
  ///
  /// sourceType : 电话来源
  ///
  /// sourceId : 来源id
  ///
  /// quality : 通话质量
  static Stream<AppChatCall> sendChatCallReq({
    int id = 0,
    int? chatboxId,
    int? subscriberId,
    ChatCallOpt opt = ChatCallOpt.sync,
    ChatCallMedia media = ChatCallMedia.video,
    ChatCallSourceType sourceType = ChatCallSourceType.normal,
    int sourceId = 0,
    ChatCallReqQuality quality = ChatCallReqQuality.unknown,
  }) {
    AuvChatLog.d(
        "sendChatCallReq id:$id chatboxId:$chatboxId subscriberId:$subscriberId opt:$opt sourceType:$sourceType sourceId:$sourceId quality:$quality",
        tag: TAG);
    final req = ChatCallReq.create();
    req.id = Int64(id);
    if (chatboxId != null) req.chatId = Int64(chatboxId);
    if (subscriberId != null) req.subscriberId = Int64(subscriberId);
    req.opt = opt.protoValue;
    req.media = media.index;
    req.sourceType = sourceType.index;
    req.sourceId = Int64(sourceId);
    req.quality = quality.protoValue;
    AuvChatLog.d(
        "sendChatCallReq id:${req.id} chatboxId:${req.chatId} subscriberId:${req.subscriberId} opt:${req.opt}",
        tag: TAG);
    return SocketApi.sendCommonMsgWithRspInstance(
      ChatCallRsp.create(),
      FlashApi.MessageCateFlash,
      Club9Message.Message_Type.CHATCALLREQ.value,
      req,
    ).map((realRsp) {
      if (realRsp != null) {
        if (realRsp.code == 0) {
          return SocketUtil.convertChatCallProto(realRsp.call);
        } else {
          throw SocketRspError(realRsp.code, errorMsg: realRsp.msg);
        }
      } else {
        throw SocketRspError.unknownError();
      }
    });
  }

  /// AI通话请求
  ///
  /// id 通话id
  ///
  /// chatboxId chatBox id
  ///
  /// type 0:aics 1:aiv
  ///
  /// opt 操作请求
  /// - INVITE = 0; 主叫邀请
  /// - RING = 1; 被叫响铃
  /// - BUSY = 2; 被叫忙
  /// - PICK_UP = 3; 被叫摘铃
  /// - CONFIRMED = 4; 主叫确认开始通话
  /// - CANCEL = 5; 主叫取消
  /// - UPDATE = 6; 更改通话类型
  /// - REJECT = 7; 被叫拒绝
  /// - BYE = 8; Bye Bye
  /// - SYNC = 9; 同步最新通话信息
  ///
  /// reject_reason 拒绝类型 0:默认值 1:主动拒绝 2:超时拒绝
  ///
  /// duration 虚拟通话时长
  static Stream<bool> sendAiCallReq(
    int id,
    int? chatboxId,
    int type,
    ChatCallOpt opt, {
    int rejectReason = 0,
    int duration = 0,
  }) {
    final req = AiCallReq.create();
    req.id = Int64(id);
    if (chatboxId != null) req.chatId = Int64(chatboxId);
    req.type = type;
    req.opt = opt.protoValue;
    req.rejectReason = rejectReason;
    req.duration = duration;
    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      FlashApi.MessageCateFlash,
      Club9Message.Message_Type.AICALLREQ.value,
      req,
    ).map((realRsp) => SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  /// 发送视频聊天礼物请求
  ///
  /// callId 通话id
  ///
  /// giftId 礼物id
  ///
  /// toUid 目标用户uid
  ///
  /// quantity 数量 默认1
  ///
  /// begId 来自索要礼物的请求id
  static Stream<bool> sendChatCallGiftReq(
    int callId,
    int giftId,
    int toUid, {
    int quantity = 1,
    int begId = 0,
  }) {
    final req = SendChatCallGiftReq.create();
    req.callId = Int64(callId);
    req.giftId = Int64(giftId);
    req.toUid = Int64(toUid);
    req.quantity = quantity;
    req.begId = Int64(begId);
    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      FlashApi.MessageCateFlash,
      Club9Message.Message_Type.SENDCHATCALLGIFTREQ.value,
      req,
    ).map((realRsp) => SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  /// 发送评价聊天请求
  ///
  /// callId 通话id
  ///
  /// snapId 评价snap消息id
  ///
  /// rating 评分(1,2,3,4,5)
  ///
  /// tagIds 评价标签id列表
  ///
  static Stream<bool> sendRateChatCallReq(
    int callId,
    int snapId,
    int rating,
    List<int> tagIds,
  ) {
    final req = RateChatCallReq.create();
    req.callId = Int64(callId);
    req.snapId = Int64(snapId);
    req.rating = rating;
    req.tagIds.addAll(tagIds);
    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      FlashApi.MessageCateFlash,
      Club9Message.Message_Type.RATECHATCALLREQ.value,
      req,
    ).map((realRsp) => SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  /// 视频聊天余额检查
  ///
  /// toUid 目标用户uid
  ///
  static Stream<AppCheckCallRsp> sendCheckVideoCallReq(int toUid) {
    final req = CheckCallReq.create();
    req.toUid = Int64(toUid);
    return SocketApi.sendCommonMsgWithRspInstance(
      CheckCallRsp.create(),
      FlashApi.MessageCateFlash,
      Club9Message.Message_Type.CHECKCALLREQ.value,
      req,
    ).map((realRsp) {
      if (realRsp != null) {
        if (realRsp.code == 0) {
          return SocketUtil.convertCheckCallRsp(realRsp);
        } else {
          throw SocketRspError(realRsp.code, errorMsg: realRsp.msg);
        }
      } else {
        throw SocketRspError.unknownError();
      }
    });
  }

  /// /// 希望匹配的性别:默认 0 为异性
  //   uint32 gender = 1;
  //   /// 匹配类型 0:和主播匹配 1:用户间匹配
  //   uint32 type = 2;
  //   /// 过滤区域
  //   string region = 3;
  ///// 匹配类型 0:video 1:txt
  static Stream<ChatCallMatchRsp?> sendChatCallMatchReq(
    int gender,
    int matchType,
    String? region, {
    int type = 2,
  }) {
    final req = ChatCallMatchReq.create();
    // req.gender = gender;
    req.type = type;
    // req.matchType = matchType;
    AuvChatLog.d("sendChatCallMatchReq:gender=$gender,type=$type,matchType=$matchType,region=$region");
    if (!Utils.isEmpty(region)) {
      req.region = region!;
    }

    return SocketApi.sendCommonMsgWithRspInstance(
      ChatCallMatchRsp(),
      FlashApi.MessageCateFlash,
      Club9Message.Message_Type.CHATCALLMATCHREQ.value,
      req,
    );
  }

  static Stream<bool> sendCancelChatCallMatchReq(int matchType,
      {int? matchId}) {
    final req = CancelChatCallMatchReq.create();
    if (matchId != null) {
      req.matchId = Int64(matchId);
    }
    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      FlashApi.MessageCateFlash,
      Club9Message.Message_Type.CANCELCHATCALLMATCHREQ.value,
      req,
    ).map((realRsp) => SocketUtil.convertCommonRsp2Bool(realRsp));
  }

  static Stream<bool> sendConfirmChatCallMatchReq({int? matchId}) {
    final req = ConfirmChatCallMatchReq.create();
    if (matchId != null) {
      req.matchId = Int64(matchId);
    }
    return SocketApi.sendCommonMsgWithRspInstance(
      CommonRsp.create(),
      FlashApi.MessageCateFlash,
      Club9Message.Message_Type.CONFIRMCHATCALLMATCHREQ.value,
      req,
    ).map((realRsp) => SocketUtil.convertCommonRsp2Bool(realRsp));
  }
}
