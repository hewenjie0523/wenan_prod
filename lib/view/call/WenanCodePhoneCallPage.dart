import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:video_player/video_player.dart';
import 'package:volume_controller/volume_controller.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/data/call/WenanCodeAppChatCallGift.dart';
import 'package:wenan/proto/we_ps_bu_call.pb.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/state/call/WenanCodePhoneCallNotify.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:wenan/view/widgets/animations/WenanCodeNaneAnimation.dart';

import '../../base/WenanCodeApplication.dart';
import '../../base/router/WenanCodePageRouter.dart';
import '../../data/Gift.dart';
import '../../data/call/AppChatCall.dart';
import '../../data/user/CommonUser.dart';
import '../../http/socket/WenanCodecall_api.dart';
import '../../http/socket/WenanCodesocket_rsp.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodegaps.dart';
import '../../state/event/WenanCodeChatCallEvent.dart';
import '../../state/event/WenanCodeCheckCallingEvent.dart';
import '../../utils/WenanCodeAuvAudioPlayerManager.dart';
import '../../utils/WenanCodeimage_loader.dart';
import '../../utils/WenanCodelog.dart';
import '../../utils/WenanCodestring_format.dart';
import '../../utils/WenanCodeui_utils.dart';
import '../../utils/WenanCodeutils.dart';
import '../WenanCodeSharedViewLogic.dart';
import '../WenanCodemark_view.dart';
import '../match/discover/gift/WenanCodeGiftPage.dart';
import '../widgets/WenanCodeAuvCupertinoPageScaffold.dart';
import 'WenanCodeCallDurationTimer.dart';
import 'WenanCodeChatCallGiftView.dart';

const String logTag = "wenanAppPhoneCallPage";

/// true:TextureView , false:SurfaceView
const bool rtcTextureView = false;

const connectingTimeout = 22;

class PhoneCallPage extends ConsumerStatefulWidget {
  //通话状态缓存 dispose 方法里面移除状态 有状态算通话中
  static final Map<int, ChatCallStatus> _callStatusMap = HashMap<int, ChatCallStatus>();

  ///有状态算通话中
  static removeCallStatus(int id) {
    PhoneCallPage._callStatusMap.removeWhere((key, value) => key == id);
  }

  ///有状态算通话中
  static bool inCalling(String tag) {
    final inCallingBool = PhoneCallPage._callStatusMap.isNotEmpty;
    AuvChatLog.w("PhoneCallPage inCalling:$inCallingBool callStatusMap:$_callStatusMap", tag: tag);
    return inCallingBool;
  }

  final Map<String, dynamic> _params;

  const PhoneCallPage(this._params, {Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PhoneCallPageConsumerState();
  }
}

class _PhoneCallPageConsumerState extends ConsumerState<PhoneCallPage> with WidgetsBindingObserver {
  late CommonUser _user;
  AppChatCall _chatCall = AppChatCall();
  StreamSubscription? _chatCallEventSubscription;
  StreamSubscription? _checkCallingEventSubscription;
  StreamSubscription? _begGiftPushSubscription;
  VideoPlayerController? _controller;

  RtcEngine? _engine;

  final GlobalKey<CallDurationTimerState> _timerKey = GlobalKey();
  final GlobalKey<ChatCallGiftViewState> _giftKey = GlobalKey();

  int callDuration = 0; //单位秒

  ///本地全屏
  bool localFullScreen = true;

  bool _isReadyPreview = false;
  bool _isEngineInited = false;
  BegGiftPSH? _begGiftPsh;

  bool get _showAskGiftView => _begGiftPsh != null;
  Timer? _showAskGiftViewTimer;
  int lastBegId = 0;

  static bool playingSound = false;

  void playHungUpSound() async {
    if (playingSound) return;
    playingSound = true;
    _enableAudio();
    await AuvAudioPlayerManager.instance.startPlayAssertAudio("sounds/wTefnLaanA_0hMaDnig4_muZpD.mp3");
  }

  void logD(String d) {
    AuvChatLog.d(d, tag: logTag);
  }

  void logW(String w) {
    AuvChatLog.w(w, tag: logTag);
  }

  void logE(String e, {Object? error}) {
    AuvChatLog.e(e, tag: logTag, error: error);
  }

  @override
  void dispose() {
    try {
      logD("dispose");
      _stopCallDurationTimer();
      _stopCancelTimer();
      _stopCallConnectingTimer();
      _unregisterEvent();
      stopPreview();
      shouldJoinChannelAfterInit = false;
      _engine?.release();
      if (currentChatCall().hasVideo()) {
        _controller?.dispose();
        _controller = null;
      }
      _showAskGiftViewTimer?.cancel();

      WidgetsBinding.instance.removeObserver(this);
      // To let the screen turn off again:
      WakelockPlus.disable();
      // Application.callPlatformMethod(
      //     "${Application.channelName}.switchScreenShotStatus", <String, dynamic>{
      //   '${Application.channelName}.status': 1,
      // });
      super.dispose();
    } catch (e) {
      logE("dispose error", error: e);
    } finally {
      PhoneCallPage._callStatusMap.removeWhere((key, value) => key == currentChatCall().id);
    }
  }

  @override
  void initState() {
    _initEngine();
    _registerEvent();
    final data = widget._params;
    _user = data["user"];
    final chatCall = data["chatCall"];
    updateChatCall(chatCall);
    logD("initState _user:${_user.toJson()} chatCall:${chatCall.toJson()} _chatCall:${_chatCall.toJson()}");
    WidgetsBinding.instance.addObserver(this);
    // To keep the screen on:
    WakelockPlus.enable();
    Application.callPlatformMethod("${Application.channelName}.switchScreenShotStatus", <String, dynamic>{
      '${Application.channelName}.status': 0,
    });
    super.initState();
  }

  void _initEngine() async {
    // 创建 RTC 客户端实例
    _engine = createAgoraRtcEngine();
    await _engine!.initialize(RtcEngineContext(appId: AppConfig.agoraAppId));
    // 定义事件处理逻辑
    _addListeners();
    // 配置参数
    await _engine!.setVideoEncoderConfiguration(VideoEncoderConfiguration(
      dimensions: const VideoDimensions(width: 640, height: 480),
      frameRate: 15,
      bitrate: 0,
      minBitrate: 1,
      orientationMode: OrientationMode.orientationModeFixedPortrait,
      degradationPreference: DegradationPreference.maintainBalanced,
    ));

    await _engine!.setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);
    await _engine!.setClientRole(role: ClientRoleType.clientRoleBroadcaster);

    await _engine!.enableVideo();
    await _engine!.enableAudio();
    await _engine!.enableLocalVideo(true);

    await _engine!.setBeautyEffectOptions(
        enabled: true,
        options: const BeautyOptions(
            lighteningContrastLevel: LighteningContrastLevel.lighteningContrastNormal,
            lighteningLevel: 0.7,
            smoothnessLevel: 0.5,
            rednessLevel: 0.1));
    Utils.callSetStateSafely(this, () {
      _isEngineInited = true;
    });
    startPreview();
    if (shouldJoinChannelAfterInit) {
      _joinChannel();
    }
  }

  void _doHangupCall() {
    logD("_doHangupCall");
    ChatCallOpt opt = ChatCallOpt.bye;
    ChatCallStatus status = ChatCallStatus.bye;
    final currentCC = currentChatCall();
    if (currentCC.isMeCalling() && currentCC.status.index < ChatCallStatus.confirmed.index) {
      opt = ChatCallOpt.cancel;
      status = ChatCallStatus.canceled;
      PhoneCallNotify.stopRingSound();
    }
    if (currentCC.hasVideo()) {
      //上报看过了本视频
      CallApi.sendAiCallReq(currentCC.id, currentCC.chatId, 1, opt, duration: callDuration);
    } else if (!currentCC.isEnd()) {
      //未结束的通话 结束掉
      CallApi.sendChatCallReq(
          id: currentCC.id,
          chatboxId: currentCC.chatId,
          opt: opt,
          subscriberId: currentCC.subscriberId,
          sourceType: ChatCallSourceType.values[currentCC.sourceType ?? 0],
          sourceId: currentCC.sourceId ?? 0);
    }
    playHungUpSound();
    currentCC.status = status;
    CallApi.updateCurrentCall(currentCC);
    _closePage();
  }

  _addListeners() {
    _engine?.registerEventHandler(RtcEngineEventHandler(
      onError: (err, msg) {
        onError(err);
      },
      onUserJoined: (connection, uid, elapsed) {
        onUserJoined(uid, elapsed);
      },
      onLeaveChannel: (connection, stats) {
        onLeaveChannel(stats);
      },
      onLastmileQuality: (quality) {
        onLastmileQuality(quality);
      },
      onNetworkQuality: (connection, uid, txQuality, rxQuality) {
        onNetworkQuality(uid, txQuality, rxQuality);
      },
      onLastmileProbeResult: (result) {
        onLastmileProbeResult(result);
      },
      onRemoteVideoStateChanged: (connection, uid, state, reason, elapsed) {
        logD("onRemoteVideoStateChanged state:$state reason:$reason uid:$uid");
        onRemoteVideoStateChanged(uid, state, reason, elapsed);
      },
      onLocalVideoStateChanged: (source, state, reason) {
        onLocalVideoStateChanged(state, reason);
      },
      onRemoteAudioStateChanged: (connection, uid, state, reason, elapsed) {
        onRemoteAudioStateChanged(uid, state, reason, elapsed);
      },
      onLocalAudioStateChanged: (connection, state, reason) {
        onLocalAudioStateChanged(state, reason);
      },
    ));
  }

  bool closePage = false;

  void _closePage() {
    if (closePage) return;
    closePage = true;
    final currentCC = currentChatCall();
    logD("closePage _user:${_user.toJson()} currentCC:${currentCC.toJson()}");
    CallApi.clearCurrentCall(currentCC.id);
    _leaveChannel();
    //有弹窗先关弹窗 https://www.jianshu.com/p/9d858596a30a
    Navigator.of(context).popUntil((route) => (route.settings.name == PageRouter.PhoneCallPage));
    firstRechargeDlgShowing = false;
    FluroRouter.appRouter.pop(context);
    _stopCallDurationTimer();
    _stopCancelTimer();
    _stopCallConnectingTimer();

    final balance = currentCC.balance;
    final chatPrice = currentCC.chatPrice;
    if (balance != null && chatPrice != null) {
      final availableMinutes = balance / chatPrice;
      final billingCallEndShowRecharge = currentCC.billingStart() && availableMinutes < 1.0;
      if (billingCallEndShowRecharge || currentCC.hasVideo())
        _showFirstRechargeDlg(
            true, currentCC.hasVideo() ? PayFromType.FROM_INDUCE_VIDEO : PayFromType.FROM_CHAT_CALL_END);
    }

    //当成功通话结束，通话不为 AIV 和 AICF时，展示评分 view
    if (currentCC.isInduce != true && currentCC.billingStart()) MarkView.show(callDuration);
  }

  Timer? _cancelTimer;

  void _stopCancelTimer() {
    if (_cancelTimer?.isActive ?? false) {
      _cancelTimer?.cancel();
    }
  }

  ///等待接听计时
  void _startCancelTimer(int seconds) {
    if (_cancelTimer != null) return;
    logD("startCancelTimer");
    _cancelTimer = Timer(Duration(seconds: seconds), () {
      final currentCC = currentChatCall();
      if (currentCC.hasVideo() && currentCC.status == ChatCallStatus.confirmed) return; //假电话
      if (currentCC.status.index >= ChatCallStatus.pickup.index) return; //已接听
      Fluttertoast.showToast(
          msg: "${StringTranslate.e2z(Application.appLocalizations?.wenan_string_call_start_failed)}(cancel)");
      _doHangupCall();
      _stopCancelTimer();
    });
  }

  Timer? _callConnectingTimer;

  void _stopCallConnectingTimer() {
    if (_callConnectingTimer?.isActive ?? false) {
      _callConnectingTimer?.cancel();
    }
  }

  ///连线计时
  void _startCallConnectingTimer() {
    if (_callConnectingTimer != null) return;
    logD("startCallConnectingTimer");
    _callConnectingTimer = Timer(const Duration(seconds: connectingTimeout), () {
      final currentCC = currentChatCall();
      if (currentCC.hasVideo() && currentCC.status == ChatCallStatus.confirmed) return; //假电话
      if (currentCC.billingStart()) return;
      Fluttertoast.showToast(
          msg: "${StringTranslate.e2z(Application.appLocalizations?.wenan_string_call_start_failed)}(Connecting)");
      _doHangupCall();
      _stopCallConnectingTimer();
    });
  }

  Timer? _callDurationTimer;

  void _stopCallDurationTimer() {
    if (_callDurationTimer?.isActive ?? false) {
      _callDurationTimer?.cancel();
    }
    _callDurationTimer = null;
  }

  /// 通话时长计时
  void _startCallDurationTimer() {
    if (_callDurationTimer != null) return;
    logD("startCallDurationTimer");
    final currentCC = currentChatCall();
    int aivDuration = 0;
    if (currentCC.hasVideo()) aivDuration = _controller?.value.duration.inSeconds ?? 0;
    AuvChatLog.d("AIV duration: $aivDuration");
    _callDurationTimer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      callDuration += 1;
      // aiv播放过程中卡顿导致超时，强制结束
      if (currentCC.hasVideo() &&
          aivDuration > 0 &&
          callDuration > aivDuration &&
          currentCC.status != ChatCallStatus.bye) {
        AuvChatLog.d("AIV Timer Controller End");
        _doHangupCall();
      }
      //todo 净网提示
      if (callDuration % 10 == 0) sendOptions();
      if (callDuration % 60 == 40) _checkBalanceToRemind();
      _checkOptionSuccess();
      _timerKey.currentState?.updateTimeString(StringUtils.getFormatTimer(callDuration));
    });
  }

  bool enableAudio = true;

  void _enableAudio() async {
    if (enableAudio) return;
    await _engine?.enableAudio();
    enableAudio = true;
  }

  void _disableAudio() async {
    await _engine?.disableAudio();
    enableAudio = false;
  }

  int lastTimeBalanceValue = -1;

  /// 余额检查
  void _checkBalanceToRemind() {
    final currentCC = currentChatCall();
    final balance = currentCC.balance;
    final chatPrice = currentCC.chatPrice;
    logD("checkBalanceToRemind balance:$balance chatPrice:$chatPrice lastTimeBalanceValue$lastTimeBalanceValue");
    if (balance == null || chatPrice == null) return;
    if (currentCC.aivCall() || chatPrice == 0) return; //不花钱
    if (lastTimeBalanceValue == balance) return; //余额暂无变化
    final availableMinutes = balance / chatPrice;
    if (availableMinutes < 1) {
      _showFirstRechargeDlg(false, PayFromType.FROM_CHAT_CALL_40);
    }
    lastTimeBalanceValue = balance;
  }

  /// 已经发送第一条options
  bool theFirstOptionsHasBeenSent = false;

  int ltscd = -1; // last time option success call duration

  /// 聊天心跳
  void sendOptions() async {
    if (theFirstOptionsHasBeenSent = false) {
      theFirstOptionsHasBeenSent = true;
    }
    final currentCC = currentChatCall();
    // 假视频 不处理
    if (currentCC.hasVideo()) return;
    try {
      await CallApi.sendChatCallReq(
              id: currentCC.id,
              chatboxId: currentCC.chatId,
              opt: ChatCallOpt.options,
              subscriberId: currentCC.subscriberId,
              sourceType: ChatCallSourceType.values[currentCC.sourceType ?? 0],
              sourceId: currentCC.sourceId ?? 0)
          .first;
      ltscd = callDuration;
    } catch (e) {
      //     //因为超时导致的失败
      //     TCPConnectionManager.getInstance().connectForce()
    }
  }

  ///检查options超时
  void _checkOptionSuccess() {
    final currentCC = currentChatCall();
    if (currentCC.hasVideo()) return; // 假视频 不处理
    if (callDuration - ltscd >= 40) {
      // 断网后 最多40秒 最少约30秒 终止通话
      logW("sendOptions timeout");
      final failText = Application.appLocalizations?.wenan_string_call_start_failed ?? "Call start failed";
      Fluttertoast.showToast(msg: "${StringTranslate.e2z(failText)}");
      // CommonMethods.showToast(context.getString(R.string.summa_string_call_start_failed) + "(${-3})")
      _doHangupCall();
    }
  }

  void stopPreview() async {
    _engine?.stopPreview();
  }

  void startPreview() async {
    // await PhoneCallManager.frontCamera();
    await _engine?.startPreview();

    Utils.callSetStateSafely(this, () {
      _isReadyPreview = true;
    });
  }

  bool joinChannelBool = false;
  bool shouldJoinChannelAfterInit = false;

  void _joinChannel() async {
    final currentCC = currentChatCall();
    logD("joinChannel token:${currentCC.channelKey} channelName:${currentCC.chatId},_engine:$_engine");
    if (!_isEngineInited) {
      shouldJoinChannelAfterInit = true;
      return;
    }
    if (!joinChannelBool) {
      joinChannelBool = true;
      await _engine!.joinChannel(
          token: currentCC.channelKey ?? "",
          channelId: currentCC.chatId.toString(),
          uid: Application.currUserCode(),
          options: const ChannelMediaOptions(
            channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
            clientRoleType: ClientRoleType.clientRoleBroadcaster,
          ));
    }
  }

  void _switchCamera() async {
    logD("switchCamera");
    _engine?.switchCamera();
  }

  void _leaveChannel() async {
    final currentCC = currentChatCall();
    logD("leaveChannel callId:${currentCC.id} joinChannelBool:$joinChannelBool");
    if (!joinChannelBool) return;
    joinChannelBool = false;
    _engine?.leaveChannel();
  }

  bool volumeControllerInit = false;
  bool firstRechargeDlgShowing = false;
  bool giftPanelShowing = false;

  _whenFirstRechargeDlgComplete(bool checkCoupon) {
    firstRechargeDlgShowing = false;
    logD("showFirstRechargeDlg showFirstRechargeDlg whenComplete firstRechargeDlgShowing:$firstRechargeDlgShowing");
    if (checkCoupon) PhoneCallNotify.checkAvailableCoupon();
  }

  _showFirstRechargeDlg(bool checkCoupon, int fromType) {
    if (firstRechargeDlgShowing == true) return;
    firstRechargeDlgShowing = true;
    SharedViewLogic.showFirstRechargeModal(context, fromType)
        .whenComplete(() => _whenFirstRechargeDlgComplete(checkCoupon));
  }

  _showGiftPanel() {
    // if (giftPanelShowing == true) return;
    giftPanelShowing = true;

    // 把视频小窗推上去
    oldDy = rtcOffset.dy;
    logD("RtcOffset dy:$oldDy");
    if (oldDy >= MediaQuery.of(context).size.height - 400) {
      Utils.callSetStateSafely(this, () {
        rtcOffset = Offset(rtcOffset.dx, MediaQuery.of(context).size.height - 400);
      });
    }

    final future = GiftPage.show(context);
    future.whenComplete(() => _whenGiftPanelComplete);
    future.then((gift) => _sendGift(gift));
    // soggyAppGiftPage.show(context).then((gift) => _sendGift(gift)).whenComplete(() => _whenGiftPanelComplete);
  }

  int _getCurrBlanceFromChatCall() {
    return currentChatCall().balance ?? (lastTimeBalanceValue >= 0 ? lastTimeBalanceValue : 0);
  }

  _whenGiftPanelComplete() {
    giftPanelShowing = false;
    logD("showGiftPanel whenComplete giftPanelShowing:$giftPanelShowing");
  }

  _sendGift(Gift? gift, {int? begId}) async {
    if (begId == null) {
      // 视频小窗还原位置
      Utils.callSetStateSafely(this, () {
        rtcOffset = Offset(rtcOffset.dx, oldDy);
      });
      giftPanelShowing = false;
    }

    if (gift == null) return;

    if (begId != null && _getCurrBlanceFromChatCall() < (gift.price ?? 0)) {
      //需要做余额判断
      SharedViewLogic.showBalanceReminderDlg(context,
          message: StringTranslate.e2z(Application.appLocalizations!.wenan_string_balance_reminder_desc_gift)
              .replaceFirst("s%", _getCurrBlanceFromChatCall().toString()), okCallBack: () {
        //充值弹窗
        _showFirstRechargeDlg(false, PayFromType.FROM_IM_SEND_GIFT);
      });
    }

    final currentCC = currentChatCall();
    final callId = currentCC.id;
    final giftId = gift.id;
    final toUid = _user.uid;
    if (giftId == null || toUid == null) {
      logE("sendGift error callId:$callId giftId:$giftId toUid:$toUid");
      return;
    }
    final result = await CallApi.sendChatCallGiftReq(callId, giftId, toUid, begId: begId ?? 0).first;
    final animationUrl = gift.animation_url;
    try {
      if (result) {
        AppChatCallGift callGift = AppChatCallGift();
        callGift.from = Application.commonUser;
        callGift.to = _user;
        callGift.gift = gift;
        _giftKey.currentState?.addChatCallGift(callGift);
        if (!Utils.isEmpty(animationUrl)) {
          PageRouter.startSvgaPlayer(context, animationUrl!, svgaIcon: callGift.gift.icon);
        }
      } else {
        logE("sendGift sendChatCallGiftReq result:$result animationUrl:$animationUrl");
      }
    } catch (e) {
      if (e is SocketRspError) {
        Fluttertoast.showToast(
            msg: e.errorMsg ?? StringTranslate.e2z(Application.appLocalizations!.wenan_string_opt_failed));
      }
    }
  }

  _unregisterEvent() {
    logD("unregisterEvent");
    VolumeController().removeListener();
    _chatCallEventSubscription?.cancel();
    _checkCallingEventSubscription?.cancel();
    _begGiftPushSubscription?.cancel();
  }

  _registerEvent() {
    logD("registerEvent");

    VolumeController().listener((volume) {
      logD("registerEvent VolumeController listener volume:$volume");
      //aic aicf监听到调节音量 弹出充值
      if (volumeControllerInit) {
        if (currentChatCall().hasVideo()) {
          _showFirstRechargeDlg(false, PayFromType.FROM_INDUCE_VIDEO);
        }
      } else {
        //首次调用不处理
        volumeControllerInit = true;
      }
    });
    _chatCallEventSubscription = Application.eventBus.on<ChatCallEvent>().listen((event) {
      logD("event ChatCall");
      //被叫回应忙的时候 服务端会向双方下发忙 被叫这里过滤一下 不处理
      if (!event.chatCall.isMeCalling() && event.chatCall.status == ChatCallStatus.busyHere) return;
      // ai通话 不处理
      if (event.chatCall.isInduce == true) return;
      if (updateChatCall(event.chatCall)) {
        logD("onEventMainThread ChatCall:${event.chatCall.toJson()}");
        Utils.callSetStateSafely(this, () {});
      }
    });
    _checkCallingEventSubscription = Application.eventBus.on<CheckCallingEvent>().listen((event) {
      final currentCC = currentChatCall();
      if (currentCC.status.isCalling()) {
        Fluttertoast.showToast(msg: "error chat call status");
        _closePage();
      }
    });
    _begGiftPushSubscription = Application.eventBus.on<BegGiftPSH>().listen((event) {
      if (lastBegId == event.begId.toInt()) {
        return;
      }
      lastBegId = event.begId.toInt();
      AuvChatLog.d("BegGiftPSH:${event.begId},${event.fromUid},${event.sceneId},${event.sceneType},${event.gift.name}");
      Utils.callSetStateSafely(this, () {
        _begGiftPsh = event;
        _showAskGiftViewTimer?.cancel();
        _showAskGiftViewTimer = Timer(const Duration(milliseconds: 6600), () {
          _showAskGiftViewTimer = null;
          Utils.callSetStateSafely(this, () {
            _begGiftPsh = null;
          });
        });
      });
    });
  }

  /// 更新chatCall对象
  bool updateChatCall(AppChatCall chatCall) {
    final firstValue = _chatCall.id == 0 && !chatCall.isEnd();
    if (firstValue || _chatCall.id == chatCall.id) {
      logD("updateChatCall chatCall:${chatCall.toJson()}");
      if (_chatCall.id == 0 && chatCall.id != 0) {
        //拨号成功拿到id后 移除原有 id = 0, status = trying
        PhoneCallPage._callStatusMap.removeWhere((key, value) => key == 0);
      }
      //有效值
      _chatCall = chatCall;
      PhoneCallPage._callStatusMap[chatCall.id] = chatCall.status;

      //非假电话 没加入channel
      if (!chatCall.hasVideo() && !joinChannelBool) {
        final hasChannelInfo = !Utils.isEmptyString(chatCall.channelKey) && chatCall.chatId != null;
        final statusCanJoin = chatCall.status.index >= ChatCallStatus.ringing.index &&
            chatCall.status.index <= ChatCallStatus.confirmed.index;
        if (hasChannelInfo && statusCanJoin) {
          _joinChannel();
          _disableAudio();
        }
      }

      switch (chatCall.status) {
        case ChatCallStatus.trying:
          if (chatCall.isMeCalling() && chatCall.id == 0) {
            //拨号发 invite
            CallApi.sendChatCallReq(
                id: chatCall.id,
                chatboxId: chatCall.chatId,
                opt: ChatCallOpt.invite,
                subscriberId: chatCall.subscriberId,
                sourceType: ChatCallSourceType.values[chatCall.sourceType ?? 0],
                sourceId: chatCall.sourceId ?? 0);
            final seconds = chatCall.sourceType == ChatCallSourceType.normal.index ? 47 : 17;
            _startCancelTimer(seconds);
          }
          break;
        case ChatCallStatus.ringing:
          if (chatCall.isMeCalling()) {
            //我拨打的 被叫振铃 主叫也响铃
            if (chatCall.sourceType != ChatCallSourceType.match.index) {
              PhoneCallNotify.playRingSound();
            }
          }
          break;
        case ChatCallStatus.pickup:
          if (chatCall.isMeCalling()) {
            //我拨打的 被叫就绪 主叫确认
            CallApi.sendChatCallReq(
                id: chatCall.id,
                chatboxId: chatCall.chatId,
                opt: ChatCallOpt.confirmed,
                subscriberId: chatCall.subscriberId,
                sourceType: ChatCallSourceType.values[chatCall.sourceType ?? 0],
                sourceId: chatCall.sourceId ?? 0);
          }
          if (chatCall.hasVideo()) {
            logD("pickup hasVideo");
            _controller = VideoPlayerController.networkUrl(Uri.parse(chatCall.induceVideo));
            _controller?.addListener(_videoListener);
            _controller?.initialize().then((_) {
              // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
              setState(() {
                onRemoteVideoStateStarting = true;
                localFullScreen = false;
                final currentCC = currentChatCall();
                currentCC.status = ChatCallStatus.confirmed;
                currentCC.deductionTime = DateTime.now().millisecondsSinceEpoch;
                CallApi.updateCurrentCall(currentCC);
                updateChatCall(currentCC);
                CallApi.sendAiCallReq(
                    currentCC.id, currentCC.chatId, 1, ChatCallOpt.pickUp);
                DataReporter.sendTrackCountEvent(
                    DataReporter.AIV_PLAY_SUCCESS, 1);
                _controller?.play();
              });
            });
          }
          _startCallConnectingTimer();
          PhoneCallNotify.stopRingSound();
          break;
        case ChatCallStatus.confirmed:
          if (onRemoteVideoStateStarting && !theFirstOptionsHasBeenSent) sendOptions();
          if (chatCall.billingStart()) {
            // aiv视频静音
            if (currentChatCall().aivCall()) {
              _disableAudio();
            } else {
              _enableAudio();
            }
            _startCallDurationTimer();
            //有可使用的体验卡 更新体验卡状态
            if (PhoneCallNotify.couponRspCache?.data?.hasCoupon() == true) PhoneCallNotify.coupons(false);
          }
          PhoneCallNotify.stopRingSound();
          break;
        default:
          logD("ChatCallStatus:${chatCall.status}");
          PhoneCallNotify.stopRingSound();
          break;
      }
      if (chatCall.isEnd()) {
        _doHangupCall();
        return false;
      } else {
        //更新chatCall对象
        Utils.callSetStateSafely(this, () {});
      }
      return true;
    } else {
      //无效值
      logW("updateChatCall chatCall:${chatCall.toJson()}");
      return false;
    }
  }


  /// 当前通话
  AppChatCall currentChatCall() {
    final currentCall = CallApi.getCurrentCall(chatId: _chatCall.id);
    if (currentCall != null &&
        currentCall.id == _chatCall.id &&
        _chatCall.status.index < currentCall.status.index) {
      // 页面ChatCall状态 落后于 CurrentCall 以后者为准
      logW("currentChatCall chatCall:${currentCall.toJson()}");
      // 更新
      updateChatCall(currentCall);
      // _chatCall = currentCall;
    }
    return _chatCall;
  }

  void _videoListener() async {
    final controller = _controller;
    if (controller == null) return;
    if (controller.value.hasError) {
      logE(
          "controller hasError errorDescription:${controller.value.errorDescription}");
      DataReporter.sendTrackEvent(
          DataReporter.AIV_PLAY_FAIL, {"url": _chatCall.induceVideo});
      //播放出错
      if (_chatting()) {
        logE("controller hasError _chatting");
        _doHangupCall();
      } else {
        _closePage();
      }
    } else {
      Duration? duration = await controller.position;
      if (duration != null &&
          duration >= controller.value.duration &&
          currentChatCall().status != ChatCallStatus.bye) {
        logE("AIV Listener Controller End");
        _doHangupCall();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: buildPage(context));
  }

  AnnotatedRegion<SystemUiOverlayStyle> buildPage(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: AuvCupertinoPageScaffold(
          backgroundColor: AppColor.color_1E294F,
          resizeToAvoidBottomInset: true,
          child: Container(
            color: AppColor.color_1E294F,
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                    //全屏
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: GestureDetector(
                      child: buildFullScreenRtcView(),
                      onTap: () {
                        currentChatCall().aivCall() ? _showFirstRechargeDlg(true, PayFromType.FROM_INDUCE_VIDEO) : null;
                      },
                    )),
                Positioned(
                    //小窗
                    bottom: MediaQuery.of(context).size.height - rtcOffset.dy + 30,
                    left: rtcOffset.dx,
                    child: SizedBox(
                      width: 100,
                      height: 150,
                      child: GestureDetector(
                        onTap: () {
                          logW("SmallRtcView onTap localFullScreen:$localFullScreen");
                          currentChatCall().aivCall()
                              ? _showFirstRechargeDlg(true, PayFromType.FROM_INDUCE_VIDEO)
                              : Utils.callSetStateSafely(this, () {
                                  localFullScreen = !localFullScreen;
                                });
                        },
                        // 小窗拖拽
                        onPanUpdate: (detail) {
                          Utils.callSetStateSafely(this, () {
                            rtcOffset = _calRtcOffset(MediaQuery.of(context).size, rtcOffset, detail.delta);
                          });
                        },
                        child: Visibility(
                            visible: _chatting(),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: AppColor.white,
                              ),
                              padding: const EdgeInsets.all(2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: buildSmallRtcView(),
                              ),
                            )),
                      ),
                    )),
                Positioned(
                  //black_40p 遮罩
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Visibility(
                    visible: !_chatting(),
                    child: Container(
                      color: AppColor.black_40p,
                    ),
                  ),
                ),
                Positioned(
                  //充值提示语
                  top: 120,
                  left: 40,
                  right: 40,
                  child: Visibility(
                    visible: currentChatCall().aivCall() && _chatting(),
                    child: GestureDetector(
                      onTap: () => _showFirstRechargeDlg(true, PayFromType.FROM_INDUCE_VIDEO),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: AppColor.black_60p,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Text(
                          StringTranslate.e2z(Application.appLocalizations!.wenan_string_aiv_recharge_tip),
                          style: AppTextStyle.TextWhite_14_Medium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                ChatCallGiftView(key: _giftKey),
                Positioned(
                    //头像 计时 挂断
                    top: MediaQuery.of(context).padding.top,
                    right: 12,
                    left: 12,
                    height: 100,
                    child: _buildTop()),
                Positioned(
                  // 中部头像
                  top: 150.0,
                  child: Visibility(
                    visible: !_chatting(),
                    child: Column(
                      children: [
                        ClipOval(
                          child: Container(
                            padding: const EdgeInsets.all(2.0),
                            color: AppColor.white,
                            child: ImageLoader.loadOvalImage(_user.avatar_url ?? "",
                                width: 140, height: 140, type: ImageClipType.IMAGE_M),
                          ),
                        ),
                        AppGap.vGap16,
                        Text(
                          _user.nick_name ?? "",
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                          ),
                        ),
                        AppGap.vGap6,
                        UIUtils.userInfoWidgetWRow(_user),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  // 底部挂断
                  bottom: 53,
                  child: Visibility(
                    visible: !_chatting(),
                    child: _buildHangupWidget(),
                  ),
                ),
                Positioned(
                  // 礼物btn
                  right: 16,
                  bottom: 24,
                  child: Visibility(
                    visible: _chatting(),
                    child: CupertinoButton(
                      padding: const EdgeInsets.all(0),
                      child: ImageLoader.loadLocalImage('call/w1e7nyalni_7rVeOsw_ki3cL_kcLaOlal2_jgei5f1t2',
                          width: 44, height: 44),
                      onPressed: () {
                        _showGiftPanel();
                      },
                    ),
                  ),
                ),
                Positioned(
                  // 左下操作按钮
                  left: 16,
                  bottom: 24,
                  child: Container(
                    height: 36,
                    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                    decoration: const BoxDecoration(
                      color: AppColor.black_60p,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: ImageLoader.loadLocalImage('call/wFeLnBa0nA_SrLeFsZ_wincC_QcEaKmieerWaH_3svwqi4tAcbhH',
                              width: 24, height: 24),
                          onTap: () => _switchCamera(),
                        ),
                        Visibility(
                          visible: currentChatCall().aivCall(),
                          child: Container(
                            width: 1,
                            height: 24,
                            margin: const EdgeInsets.symmetric(horizontal: 12.5),
                            decoration: const BoxDecoration(
                              color: AppColor.white_60p,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: currentChatCall().aivCall(),
                          child: GestureDetector(
                            child: ImageLoader.loadLocalImage('call/wXevnUaOnb_DrLeFs1_Hi3cG_Immuit4eJ_piMcsoSnA',
                                width: 24, height: 24),
                            onTap: () => _showFirstRechargeDlg(true, PayFromType.FROM_INDUCE_VIDEO),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  bottom: 80,
                  child: Visibility(
                    visible: _showAskGiftView,
                    child: EasyAnimationBuilder.animate(
                      Container(
                        alignment: Alignment.centerLeft,
                        constraints: const BoxConstraints(minWidth: 200, minHeight: 64, maxHeight: 64),
                        decoration: const BoxDecoration(
                            color: AppColor.black_60p, borderRadius: BorderRadius.all(Radius.circular(32))),
                        child: Row(
                          children: [
                            ImageLoader.loadDefault(_begGiftPsh?.gift.icon ?? "",
                                width: 64,
                                height: 64,
                                placeholder: (context, url) => Container(
                                      color: AppColor.transparent,
                                    )),
                            const SizedBox(
                              width: 6,
                            ),
                            UIUtils.maxWidthText(
                                Text(
                                  StringTranslate.e2z(Application.appLocalizations!.wenan_string_beg_gift)
                                      .replaceFirst("s%", _begGiftPsh?.gift.name ?? ""),
                                  style: AppTextStyle.white14,
                                ),
                                160,
                                minWidth: 110),
                            const SizedBox(
                              width: 6,
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_begGiftPsh?.gift != null) {
                                  _sendGift(Gift.fromProto(_begGiftPsh!.gift), begId: _begGiftPsh!.begId.toInt());
                                }
                                Utils.callSetStateSafely(this, () => _begGiftPsh = null);
                              },
                              child: Container(
                                height: 48,
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [AppColor.color_ff4d4d, AppColor.color_ff4dfb],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(28))),
                                child: Text(StringTranslate.e2z(Application.appLocalizations!.wenan_string_send),
                                    style: AppTextStyle.white14),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                    ).translate(const [Offset(-1, 0), Offset(0, 0)],
                        duration: const Duration(milliseconds: 600)).build(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///小屏视窗
  Widget buildSmallRtcView() {
    final currentCC = currentChatCall();
    logW(
        "buildSmallRtcView localFullScreen:$localFullScreen onRemoteVideoStateStarting:$onRemoteVideoStateStarting uCode:${_user.uCodeInt()} chatId:${currentCC.chatId.toString()}");
    if (!localFullScreen) {
      //本地小屏
      return AgoraVideoView(
        controller: VideoViewController(
          rtcEngine: _engine!,
          canvas: const VideoCanvas(uid: 0),
          useFlutterTexture: rtcTextureView,
          useAndroidSurfaceView: !rtcTextureView,
        ),
      );
    } else {
      //对方小屏
      if (onRemoteVideoStateStarting) {
        if (currentCC.hasVideo()) {
          final controller = _controller;
          return controller == null
              ? Container()
              : FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller.value.aspectRatio,
                    height: 1,
                    child: VideoPlayer(controller),
                  ),
                );
        } else {
          return Visibility(
              visible: _isEngineInited,
              child: AgoraVideoView(
                controller: VideoViewController.remote(
                  rtcEngine: _engine!,
                  canvas: VideoCanvas(uid: _user.uCodeInt()),
                  connection: RtcConnection(channelId: currentCC.chatId.toString()),
                  useFlutterTexture: rtcTextureView,
                  useAndroidSurfaceView: !rtcTextureView,
                ),
              ));
        }
      } else {
        return ImageLoader.loadDefault(_user.avatar_url ?? "", width: 100, height: 150, fit: BoxFit.cover);
      }
    }
  }

  Offset rtcOffset = Offset(16, MediaQueryData.fromWindow(window).size.height - 62);
  double oldDy = 0;

  /// 小屏拖拽计算位置
  Offset _calRtcOffset(Size size, Offset offset, Offset nextOffset) {
    double dx = 0;
    if (offset.dx + nextOffset.dx <= 0) {
      dx = 0;
    } else if (offset.dx + nextOffset.dx >= (size.width - 100)) {
      dx = size.width - 100;
    } else {
      dx = offset.dx + nextOffset.dx;
    }
    double dy = 0;
    if (offset.dy + nextOffset.dy >= (size.height)) {
      dy = size.height;
    } else if (offset.dy + nextOffset.dy <= 174) {
      dy = 174; // 150 小窗口自身高度 + 24 statusbar高度
    } else {
      dy = offset.dy + nextOffset.dy;
    }
    return Offset(
      dx,
      dy,
    );
  }

  ///全屏视窗
  Widget buildFullScreenRtcView() {
    final currentCC = currentChatCall();
    logW(
        "buildFullScreenRtcView localFullScreen:$localFullScreen onRemoteVideoStateStarting:$onRemoteVideoStateStarting uCode:${_user.uCodeInt()} chatId:${currentCC.chatId.toString()}");
    if (localFullScreen) {
      //本地大屏
      return Visibility(
          visible: _isReadyPreview,
          child: AgoraVideoView(
            controller: VideoViewController(
              rtcEngine: _engine!,
              canvas: const VideoCanvas(uid: 0),
              useFlutterTexture: rtcTextureView,
              useAndroidSurfaceView: !rtcTextureView,
            ),
          ));
    } else {
      //对方大屏
      if (onRemoteVideoStateStarting) {
        if (currentCC.hasVideo()) {
          final controller = _controller;
          return controller == null
              ? Container()
              : FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller.value.aspectRatio,
                    height: 1,
                    child: VideoPlayer(controller),
                  ),
                );
        } else {
          return AgoraVideoView(
            controller: VideoViewController.remote(
              rtcEngine: _engine!,
              canvas: VideoCanvas(uid: _user.uCodeInt()),
              connection: RtcConnection(channelId: currentCC.chatId.toString()),
              useFlutterTexture: rtcTextureView,
              useAndroidSurfaceView: !rtcTextureView,
            ),
          );
        }
      } else {
        return ImageLoader.loadDefault(_user.avatar_url ?? "",
            width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.cover);
      }
    }
  }

  /// pickup之前 挂断按钮
  ///
  /// pickup之后 text：connecting
  Widget _buildHangupWidget() {
    final currentCC = currentChatCall();
    if (currentCC.status.index < ChatCallStatus.pickup.index) {
      return Column(
        children: [
          CupertinoButton(
            padding: const EdgeInsets.all(0),
            child: ImageLoader.loadLocalImage('call/waeKnwaAnd_qrqeas5_cidcG_BnKoIt4i5f6y9_brgeZjqeGcTta',
                width: 72, height: 72),
            onPressed: () => {
              //
              _doHangupCall()
            },
          ),
          AppGap.vGap10,
          GestureDetector(
            onTap: () => {
              //
              _doHangupCall()
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                StringTranslate.e2z(Application.appLocalizations?.wenan_string_cancel),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, color: AppColor.white),
              ),
            ),
          ),
        ],
      );
    } else {
      return Text(
        StringTranslate.e2z(Application.appLocalizations?.wenan_string_connecting),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: AppColor.white),
      );
    }
  }

  Widget _buildTop() {
    return Visibility(
        visible: _chatting(),
        child: Flex(direction: Axis.horizontal, children: [
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(2.0),
              color: AppColor.white,
              child:
                  ImageLoader.loadOvalImage(_user.avatar_url ?? "", width: 40, height: 40, type: ImageClipType.IMAGE_S),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 12),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            _user.nick_name ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.white,
                            ),
                          ),
                        ],
                      ),
                      AppGap.vGap10,
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          UIUtils.userInfoWidgetWRow(_user),
                          const Expanded(
                            flex: 1,
                            child: AppGap.hGap4,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
          Container(
            padding: const EdgeInsets.all(0),
            width: 100.0,
            height: 36.0,
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      width: 96.0,
                      height: 36.0,
                      decoration: const BoxDecoration(
                        color: AppColor.white_20p,
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.0),
                        ),
                      ),
                    )),
                Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Visibility(
                    visible: _chatting(),
                    child: CallDurationTimer(() {
                      if (currentChatCall().aivCall()) {
                        _doHangupCall();
                      } else {
                        SharedViewLogic.showCallHangUp(context, () {
                          Navigator.of(context).pop();
                          _doHangupCall();
                        });
                      }
                    }, key: _timerKey),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }

  bool _chatting() {
    final currentCC = currentChatCall();
    if (currentCC.isEnd() && onRemoteVideoStateStarting) return true; //接通后的 结束过程也算在通话中
    if (currentCC.status == ChatCallStatus.confirmed && currentCC.billingStart()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onError(ErrorCodeType err) {
    logW("onError err:$err");
    switch (err) {
      case ErrorCodeType.errAdmGeneralError: // 音频设备模块通用错误。
      case ErrorCodeType.errAdmInitPlayout: // 初始化播放设备错误。
      case ErrorCodeType.errAdmStartPlayout: // 启动播放设备错误。
      case ErrorCodeType.errLoadMediaEngine: // 加载媒体引擎失败。
      case ErrorCodeType.errNotInitialized: // SDK 尚未初始化。
      case ErrorCodeType.errNotReady: // SDK 未就绪。
      case ErrorCodeType.errFailed: // 启动通话失败等通用失败。
        _doHangupCall();
        final localized = Application.appLocalizations?.wenan_string_call_start_failed ?? "Call start failed";
        Fluttertoast.showToast(msg: "${StringTranslate.e2z(localized)}($err)");
        break;
      default:
        break;
    }
  }

  @override
  void onLastmileProbeResult(LastmileProbeResult result) {}

  @override
  void onLastmileQuality(QualityType quality) {}

  @override
  void onLeaveChannel(RtcStats stats) {}

  @override
  void onLocalAudioStateChanged(LocalAudioStreamState state, LocalAudioStreamReason reason) {}

  @override
  void onLocalVideoStateChanged(LocalVideoStreamState localVideoState, LocalVideoStreamReason reason) {
    if (reason == LocalVideoStreamReason.localVideoStreamReasonOk) return; // 正常
    if (localVideoState == LocalVideoStreamState.localVideoStreamStateFailed &&
        reason == LocalVideoStreamReason.localVideoStreamReasonCaptureFailure) {
      logE("onLocalVideoStateChanged STATE_FAILED ERROR_CAPTURE_FAILURE");
      // TODO 视频采集异常 结束通话
    }
  }

  @override
  void onNetworkQuality(int uid, QualityType txQuality, QualityType rxQuality) {
    // TODO 记录通话质量
  }

  @override
  void onRemoteAudioStateChanged(int uid, RemoteAudioState state, RemoteAudioStateReason reason, int elapsed) {}

  @override
  void onUserJoined(int uid, int elapsed) {
    final currentCC = currentChatCall();
    logD("onUserJoined uid:$uid currentCC:${currentCC.toJson()}");
  }

  /// 本地用户已接收远端视频首包
  bool onRemoteVideoStateStarting = false;

  @override
  void onRemoteVideoStateChanged(int uid, RemoteVideoState state, RemoteVideoStateReason reason, int elapsed) {
    final currentCC = currentChatCall();
    if (uid != _user.uCodeInt()) {
      logW("onRemoteVideoStateChanged state:$state reason:$reason uid:$uid _user.uCodeInt:${_user.uCodeInt()}");
      return;
    } else {
      logD("onRemoteVideoStateChanged state:$state reason:$reason uid:$uid");
    }
    if (state == RemoteVideoState.remoteVideoStateStarting) {
      if (onRemoteVideoStateStarting == false) {
        Utils.callSetStateSafely(this, () {
          logD("setState onRemoteVideoStateStarting = true");
          onRemoteVideoStateStarting = true;
          localFullScreen = false;
        });
      }
      logD("onRemoteVideoStateChanged currentCC.status:${currentCC.status}");
      if (currentCC.status == ChatCallStatus.confirmed) sendOptions();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        Application.onAppForegroundChange(true);
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.paused:
        if (currentChatCall().aivCall()) {
          _doHangupCall();
        }
        Application.onAppForegroundChange(false);
        break;
      case AppLifecycleState.hidden:
        if (currentChatCall().aivCall()) {
          _doHangupCall();
        }
        Application.onAppForegroundChange(false);
        break;
    }
  }
}
