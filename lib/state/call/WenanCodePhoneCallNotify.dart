import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/http/CouponApi.dart';
import 'package:wenan/utils/WenanCodeAuvAudioPlayerManager.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/view/call/WenanCodeCallCoupon.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../base/WenanCodeApplication.dart';
import '../../data/call/AppChatCall.dart';
import '../../data/call/Coupon.dart';
import '../../data/user/CommonUser.dart';
import '../../http/UserApi.dart';
import '../../http/WenanCodedio_helper.dart';
import '../../base/router/WenanCodePageRouter.dart';
import '../../http/socket/WenanCodecall_api.dart';
import '../../http/socket/WenanCodesocket_rsp.dart';
import '../../utils/WenanCodelog.dart';
import '../../view/WenanCodeSharedViewLogic.dart';
import '../../view/call/WenanCodeCallNotifyOverlay.dart';
import '../../view/call/WenanCodePhoneCallPage.dart';
import 'package:wenan/StringTranslate.dart';

class PhoneCallNotify {
  static const String TAG = "PhoneCallNotify";
  static int notifyTimeMillis = -1;
  static int chatCallId = -1;
  static OverlayEntry? _callNotifyOverlayEntry;
  static AudioPlayer? _player;
  static CouponApi? _couponApi;

  static CouponApi _couponApiInstance() {
    final cApi = _couponApi;
    if (cApi == null) {
      final api = CouponApi(DioHelper.getInstance());
      _couponApi = api;
      return api;
    } else {
      return cApi;
    }
  }

  static Future playRingSound() async {
    try {
      AuvChatLog.d("playRingSound start _player:$_player", tag: TAG);
      await stopRingSound();
      await AuvAudioPlayerManager.instance
          .startPlayAssertAudio("sounds/w2e9nkaong_yc9a1lLlT_5nIott2iPfryZ.mp3", loop: true);
      _player = AuvAudioPlayerManager.instance.audioPlayer;
      AuvChatLog.d("playRingSound _player:$_player", tag: TAG);
    } catch (e) {
      AuvChatLog.printE(e);
    }
  }

  static Future stopRingSound() async {
    try {
      AuvChatLog.d("stopRingSound _player:$_player", tag: TAG);
      await _player?.stop();
      await _player?.release();
      _player = null;
    } catch (e) {
      AuvChatLog.printE(e);
    }
  }

  static bool isNotifyShowing() {
    return _callNotifyOverlayEntry != null;
  }

  ///拒接
  ///
  /// rejectReason 1 手动挂断 2超时自动挂断
  static void rejectCall(AppChatCall chatCall, {int rejectReason = 1}) {
    AuvChatLog.d("rejectCall id:${chatCall.id}", tag: TAG);
    dismissNotify();
    if (chatCall.isInduce == true) {
      CallApi.sendAiCallReq(chatCall.id, chatCall.chatId, 0, ChatCallOpt.reject, rejectReason: rejectReason);
      if (chatCall.aivCall()) {
        checkAvailableCoupon();
      }
      DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_AIV_REFUSE, 1);
    } else {
      CallApi.sendChatCallReq(
          id: chatCall.id,
          chatboxId: chatCall.chatId,
          opt: ChatCallOpt.reject,
          subscriberId: chatCall.subscriberId);
    }
    DataReporter.sendTrackCountEvent("call_in_notify_cancel", 1);
  }

  ///接听通话
  static void pickUpCall(AppChatCall chatCall, CommonUser user) async {
    AuvChatLog.d("pickUpCall id:${chatCall.id}", tag: TAG);
    dismissNotify();
    //判断权限
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();
    if (statuses[Permission.camera] == PermissionStatus.granted &&
        statuses[Permission.microphone] == PermissionStatus.granted) {
      if (chatCall.aicsCall()) {
        AuvChatLog.d("pickUpCall aicsCall", tag: TAG);
        pickUpAICSCall(user, chatCall.id);
      } else if (chatCall.aivCall() || chatCall.aicfCall()) {
        AuvChatLog.d(
            "pickUpCall sourceType:${chatCall.sourceType} induceVideo:${chatCall.induceVideo}",
            tag: TAG);
        if (chatCall.hasVideo()) {
          //aiv aicf
          pickUpPlayVideoCall(chatCall, user);
          DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_AIV_ANSWER, 1);
        } else {
          //没有视频的aiv
          final currentContext = PageRouter.navigatorKey.currentContext;
          if (currentContext != null) {
            final future = SharedViewLogic.showFirstRechargeModal(
                currentContext, PayFromType.FROM_PICK_UP_CALL);
            future.whenComplete(() => {checkAvailableCoupon()});
          }
          CallApi.clearCurrentCall(chatCall.id);
        }
      } else {
        pickNormalCall(chatCall, user);
      }
    } else {
      //缺少必要权限 点接听算拒接
      if (chatCall.sourceType == ChatCallSourceType.normal.index)
        PhoneCallNotify.rejectCall(chatCall);
      showToast(StringTranslate.e2z(Application.appLocalizations?.wenan_string_the_other_hang_up));
    }
  }

  static CouponRsp? couponRspCache;

  ///可用体验卡总金额
  static int couponTotalValue() {
    return couponRspCache?.data?.couponTotalValue() ?? 0;
  }

  static Future<CouponRsp> coupons(bool useCache) async {
    AuvChatLog.d("coupons useCache:$useCache", tag: TAG);
    final cache = couponRspCache;
    if (useCache && cache != null) {
      //缓存
      return cache;
    } else {
      final rsp = await _couponApiInstance().coupons(1);
      if (rsp.data != null && rsp.data?.coupons != null) couponRspCache = rsp;
      return rsp;
    }
  }

  static checkAvailableCoupon() async {
    AuvChatLog.d("checkAvailableCoupon", tag: TAG);
    final couponRsp = await coupons(true);
    DataReporter.sendTrackEvent(DataReporter.COUPON_RESP, {"coupons": json.encode(couponRsp.data)});
    final coupon = couponRsp.data?.availableCoupon();
    if (coupon != null) showCoupon(coupon);
  }

  static showCoupon(Coupon coupon) async {
    AuvChatLog.d("showCoupon", tag: TAG);
    final currentContext = PageRouter.navigatorKey.currentContext;
    if (currentContext != null) {
      CallCoupon.show(currentContext, coupon);
      await _couponApiInstance().receiveCoupon(coupon.id);
      await coupons(false);
    }
  }

  ///接听aics
  static void pickUpAICSCall(CommonUser user, int sourceId) {
    //aic的来电 接听等于拨打电话 只传user 拨号通话
    final currentContext = PageRouter.navigatorKey.currentContext;
    if (currentContext != null) {
      AppChatCall chatCall = AppChatCall.callInvite(user.uid!,
          sourceType: ChatCallSourceType.aics.index, sourceId: sourceId);
      PageRouter.startChatCall(
          currentContext, user, PayFromType.FROM_PICK_UP_CALL,
          chatCall: chatCall);
    }
  }

  ///接听播放视频通话
  static void pickUpPlayVideoCall(AppChatCall chatCall, CommonUser user) {
    chatCall.status = ChatCallStatus.pickup;
    CallApi.updateCurrentCall(chatCall);
    Map<String, dynamic> data = {};
    data["user"] = user;
    data["chatCall"] = chatCall;
    final currentContext = PageRouter.navigatorKey.currentContext;
    if (currentContext != null) {
      PageRouter.routePage(currentContext, PageRouter.PhoneCallPage,
          routeSettings: RouteSettings(arguments: data));
    }
  }

  ///接听普通通话
  static void pickNormalCall(AppChatCall chatCall, CommonUser user) async {
    if (!chatCall.balanceMoreThanOneMinute() &&
        couponRspCache?.data?.hasCoupon() != true) {
      AuvChatLog.d(
          "pickNormalCall no more coins rejectCall hasCoupon:${couponRspCache?.data?.hasCoupon()}",
          tag: TAG);
      //没钱 没可用体验卡 跳首冲
      PhoneCallNotify.rejectCall(chatCall);
      final currentContext = PageRouter.navigatorKey.currentContext;
      if (currentContext != null)
        SharedViewLogic.showFirstRechargeModal(
            currentContext, PayFromType.FROM_PICK_UP_CALL);
      return;
    }
    try {
      final rspChatCall = await CallApi.sendChatCallReq(
              id: chatCall.id,
              chatboxId: chatCall.chatId,
              opt: ChatCallOpt.pickUp,
              subscriberId: chatCall.subscriberId)
          .first;
      Map<String, dynamic> data = {};
      data["user"] = user;
      data["chatCall"] = rspChatCall;
      final currentContext = PageRouter.navigatorKey.currentContext;
      if (currentContext != null) {
        AuvChatLog.d("pickNormalCall routePage", tag: TAG);
        PageRouter.routePage(currentContext, PageRouter.PhoneCallPage,
            routeSettings: RouteSettings(arguments: data));
      }
    } catch (e) {
      if (e is SocketRspError) {
        Fluttertoast.showToast(
            msg: e.errorMsg ??
                StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
      }
    }
  }

  ///关闭来电
  static void dismissNotify() {
    AuvChatLog.d("dismissNotify", tag: TAG);
    stopRingSound();
    _callNotifyOverlayEntry?.remove();
    _callNotifyOverlayEntry = null;
  }

  ///显示来电
  static void showNotify(AppChatCall chatCall, CommonUser user) {
    if (chatCall.isInduce == true) {
      final rejectReason = busyReason();
      AuvChatLog.d("rejectReason=$rejectReason", tag: TAG);
      if (rejectReason > 0) {
        final type =
            chatCall.sourceType == ChatCallSourceType.aics.index ? 0 : 1;
        CallApi.sendAiCallReq(
            chatCall.id, chatCall.chatId, type, ChatCallOpt.busy,
            rejectReason: rejectReason);
        CallApi.clearCurrentCall(chatCall.id);
        return;
      }
    } else {
      //普通通话需要响应响铃
      CallApi.sendChatCallReq(
          id: chatCall.id,
          chatboxId: chatCall.chatId,
          opt: ChatCallOpt.ring,
          subscriberId: chatCall.subscriberId);
    }
    chatCallId = chatCall.id;
    notifyTimeMillis = DateTime.now().millisecondsSinceEpoch;
    _callNotifyOverlayEntry?.remove();
    final entry = OverlayEntry(builder: (context) {
      return CallNotifyOverlay(chatCall, user);
    });
    _callNotifyOverlayEntry = entry;
    AuvChatLog.d("showNotify", tag: TAG);
    PageRouter.navigatorKey.currentState?.overlay?.insert(entry);
    playRingSound();
    if (chatCall.isInduce == false) {
      CallApi.sendChatCallReq(
          id: chatCall.id,
          chatboxId: chatCall.chatId,
          opt: ChatCallOpt.ring,
          subscriberId: chatCall.subscriberId);
    }
    DataReporter.sendTrackCountEvent("call_in_notify", 1);
  }

  ///显示来电
  static int busyReason() {
    final currentContext = PageRouter.navigatorKey.currentContext;
    if (isNotifyShowing()) return 101; // 已经弹出aic 或 aiv 页面
    if (CallCoupon.active) return 102; // 弹出体验卡弹窗
    var topPage = PageRouter.instance.topPage;
    AuvChatLog.d("busyReason topPage=$topPage", tag: TAG);
    if (MediaQuery.of(currentContext!).viewInsets.bottom > 0) {
      return 103; //软键盘弹出 正在编辑
    }
    if (PageRouter.MatchingPage == topPage) return 104; // 正在匹配聊天页
    if (PhoneCallPage.inCalling(TAG)) return 105; // 正在聊天页
    if (topPage == PageRouter.FirstChargePopupPage) return 106; // 首冲页
    if (topPage == PageRouter.PayHandlerPage) return 107; // 充值选择页面
    if (topPage == PageRouter.VipPage) return 108; // 购买vip页
    if (topPage == PageRouter.VipChargePopupPage) return 109; // 购买vip弹窗
    if (topPage == PageRouter.BalancePage) return 110; // 充值页
    if (topPage == PageRouter.WebviewPage) return 111; // h5页 目前h5都是充值使用的
    if (Application.registerActive) return 112; //Edit Info 个人信息编辑
    if (topPage == PageRouter.AvatarCameraPage) return 113; //拍照
    // if (context is MultiImageSelectorActivity) return 114 //相册
    //拍照相册暂时用EditUserInfoPage代替
    if (topPage == PageRouter.EditUserInfoBtmDlg) return 113;
    if (topPage == PageRouter.EditUserInfoPage) return 115; //用户名 签名
    // if (context is SummaMainActivity && context.isLotteryShowing()) return 116 // 大转盘
    return 0;
  }

  ///处理通话消息
  static void handleCall(AppChatCall chatCall) async {
    AuvChatLog.d(
        "handleCall chatCallId:$chatCallId chatCall:${chatCall.toJson()}",
        tag: TAG);
    final notFromMe = chatCall.from != Application.currUserId();
    if (notFromMe) {
      //有人打给我
      if (chatCall.status == ChatCallStatus.trying) {
        AuvChatLog.d("handleCall STATUS_TRYING", tag: TAG);

        ///过滤通话中的AI call
        final inCalling = PhoneCallPage.inCalling(TAG);
        final busy = inCalling || isNotifyShowing();
        if (chatCall.isInduce == true && busy) {
          AuvChatLog.w("handleCall isInduce busy", tag: TAG);
        } else {
          try {
            final resp =
                await UserApi(DioHelper.getInstance()).userInfo(chatCall.from!);
            if (resp.code == 0 &&
                CallApi.getCurrentCall(chatId: chatCall.id)?.status ==
                    ChatCallStatus.trying) {
              final user = resp.data?.user;
              PhoneCallNotify.showNotify(chatCall, user!);
            }
          } catch (e) {
            AuvChatLog.printE(e);
          }
        }
      } else if (chatCall.isEnd()) {
        AuvChatLog.d("handleCall STATUS_CANCELED", tag: TAG);
        if (chatCallId == chatCall.id) {
          dismissNotify();
          chatCallId = 0;
        }
      }
    }
  }

  ///toast
  static void showToast(String? toast) {
    if (toast == null) return;
    Fluttertoast.showToast(msg: toast);
  }
}
