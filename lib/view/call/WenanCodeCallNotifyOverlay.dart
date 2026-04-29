import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/state/call/WenanCodePhoneCallNotify.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/http/socket/WenanCodecall_api.dart';
import 'package:wenan/utils/WenanCodeimage_url_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';

import '../../data/call/AppChatCall.dart';
import '../../data/user/CommonUser.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodegaps.dart';
import '../../utils/WenanCodeimage_loader.dart';
import '../../utils/WenanCodelog.dart';
import '../../utils/WenanCodeui_utils.dart';

const int aicTimeout = 15;

const int aivTimeout = 45;

class CallNotifyOverlay extends ConsumerStatefulWidget {
  final AppChatCall _chatCall;
  final CommonUser _user;

  const CallNotifyOverlay(this._chatCall, this._user, {Key? key})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CallNotifyOverlayConsumerState();
  }
}

class _CallNotifyOverlayConsumerState extends ConsumerState<CallNotifyOverlay>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  bool _close = false;

  Timer? _cancelTimer;

  //动画控制器
  final List<AnimationController> _animationControllers = [];
  //动画控件集合
  final List<Widget> _animationChildren = [];
  //添加蓝牙检索动画计时器
  Timer? _animationTimer;

  void _stopCancelTimer() {
    if (_cancelTimer?.isActive ?? false) {
      _cancelTimer?.cancel();
    }
  }

  ///等待接听计时
  void _startCancelTimer(int seconds) {
    if (_cancelTimer != null) return;
    _cancelTimer = Timer(Duration(seconds: seconds), () {
      if (_close) return;
      PhoneCallNotify.rejectCall(widget._chatCall, rejectReason: 2);
      onClose();
    });
  }


  @override
  void initState() {
    _startPickupAnimation();
    if (widget._chatCall.isInduce == true) {
      if (widget._chatCall.aicsCall()) {
        _startCancelTimer(aicTimeout);
      } else if (widget._chatCall.aivCall() || widget._chatCall.aicfCall()) {
        _startCancelTimer(aivTimeout);
      }
    }
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    onClose();
    _disposePickupAnimation();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void onClose() {
    if (_close) return;
    final chatCall = widget._chatCall;
    AuvChatLog.d("onClose chatCall:${chatCall.toJson()}",
        tag: "CallNotifyOverlay");
    if (chatCall.isInduce == true) CallApi.clearCurrentCall(chatCall.id);
    _stopCancelTimer();
    _close = true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: fullScreenContainer(),
    );
  }


  Widget userInfoView(){
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 150),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                padding: const EdgeInsets.all(2),
                color: AppColor.white,
                child: ImageLoader.loadOvalImage(
                    widget._user.avatar_url ?? "",
                    width: 140,
                    height: 140,
                    type: ImageClipType.IMAGE_M),
              ),
            ),
            AppGap.vGap16,
            Text(
              widget._user.nick_name ?? "",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColor.white,
              ),
            ),
            AppGap.vGap6,
            UIUtils.userInfoWidgetWRow(widget._user),
            AppGap.vGap6,
            Visibility(
              visible: widget._chatCall.showChatPrice() && AppConfig.showUserChatPrice(widget._chatCall.chatPrice),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget._chatCall.chatPrice}',
                    style: AppTextStyle.style(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),
                  AppGap.hGap2,
                  ImageLoader.loadLocalImage("discover/wgernvaQn6_wrWeVsw_fdhihsMcSo7vyevrH_acZo7iYnB_qshmEaQlglM",
                      width: 12, height: 12, fit: BoxFit.contain),
                  AppGap.hGap2,
                  Text(
                    '/${StringTranslate.e2z(Application.appLocalizations!.wenan_string_min)}',
                    style: AppTextStyle.style(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget bgHeadView(){
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ImageLoader.loadDefault(
            ImageURLUtils.imageLargeURL(widget._user.avatar_url ?? ""),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              color: AppColor.transparent,
            ),
          ),
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: AppColor.black_40p,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget notifyRejectView(){
    return Positioned(
      left: 40,
      right: 40,
      bottom: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: _button(
                  () {
                PhoneCallNotify.rejectCall(widget._chatCall);
                onClose();
              },
              ImageLoader.loadLocalImage(
                'call/waeKnwaAnd_qrqeas5_cidcG_BnKoIt4i5f6y9_brgeZjqeGcTta',
                width: 76,
                height: 76,
              ),
            ),
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ..._animationChildren,
                _button(
                      () {
                    PhoneCallNotify.pickUpCall(
                        widget._chatCall, widget._user);
                    onClose();
                  },
                  Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xFF18AB31),
                              Color(0xFF22BD3D),
                              Color(0xFF2BD04A)
                            ])),
                    alignment: Alignment.center,
                    child: const SizedBox(
                      width: 32,
                      height: 32,
                      child: SVGASimpleImage(
                        assetsName:
                        "assets/animes/w6esnfa9nW_QcWa3lylM_hpBi1cIkF_yu0pV.svga",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack fullScreenContainer() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        bgHeadView(),
        userInfoView(),
        notifyRejectView(),
        // aiv has video show yellow free
        Visibility(
          visible: widget._chatCall.aivCall() && widget._chatCall.hasVideo(),
          child: Positioned(
            bottom: 82,
            left: Application.isARLanguage() ? 70 : null,
            right: Application.isARLanguage() ? null : 70,
            child: Container(
              width: 56,
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: AppColor.colorFFF616,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: _freeText1(),
            ),
          ),
        ),
        // has coupon show colorful free
        Visibility(
          visible: PhoneCallNotify.couponRspCache?.data?.hasCoupon() == true && !widget._chatCall.aivCall(),
          child: Positioned(
            bottom: 148,
            left: Application.isARLanguage() ? 36 : null,
            right: Application.isARLanguage() ? null : 36,
            child: Container(
              width: 56,
              height: 28,
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFFFFCA32), Color(0xFFFF4464), Color(0xFFCB32FF)]),
              ),
              alignment: Alignment.center,
              child: _freeText(),
            ),
          ),
        ),
      ],
    );
  }

  _freeText(){
    return Text(
      StringTranslate.e2z(
          Application.appLocalizations?.wenan_string_free),
      textAlign: TextAlign.center,
      style: AppTextStyle.style(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          height: 0.9,
          color: AppColor.white
      ),
    );
  }

  _freeText1(){
    return Text(
      StringTranslate.e2z(
          Application.appLocalizations?.wenan_string_free),
      textAlign: TextAlign.center,
      style: AppTextStyle.style(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          height: 0.9,
          color: AppColor.b1
      ),
    );
  }


  Stack topModalContainer() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 20,
          right: 10,
          left: 10,
          height: 100,
          child: Container(
            padding: const EdgeInsets.all(0),
            color: AppColor.color1E294F,
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Positioned(
                  left: 12,
                  right: 10,
                  top: 0,
                  bottom: 0,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      ImageLoader.loadOvalImage(widget._user.avatar_url ?? "",
                          width: 56, height: 56, type: ImageClipType.IMAGE_S),
                      AppGap.hGap12,
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              widthFactor: 1.0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          maxWidth: 150,
                                        ),
                                        child: Text(
                                          widget._user.nick_name ?? "",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppGap.vGap10,
                                  Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      UIUtils.userInfoWidgetWRow(widget._user),
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
                      _button(
                        () {
                          PhoneCallNotify.rejectCall(widget._chatCall);
                          onClose();
                        },
                        ImageLoader.loadLocalImage(
                          'call/waeKnwaAnd_qrqeas5_cidcG_BnKoIt4i5f6y9_brgeZjqeGcTta',
                          width: 48,
                          height: 48,
                        ),
                      ),
                      AppGap.hGap16,
                      _button(() {
                        PhoneCallNotify.pickUpCall(
                            widget._chatCall, widget._user);
                        onClose();
                        },
                        ImageLoader.loadLocalImage(
                          'call/wseNnaaSn0_KrJeWst_BiQcG_dnGoEtRiVfny4_op8i7cskl_9ucp8',
                          width: 48,
                          height: 48,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _button(VoidCallback onPressed, Widget icon) {
    return CupertinoButton(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      onPressed: onPressed,
      child: icon
    );
  }

  ///初始化动画，依次添加5个缩放动画，形成水波纹动画效果
  void _startPickupAnimation() {
    //动画启动前确保_children控件总数为0
    _animationChildren.clear();
    int count = 0;
    //添加第一个圆形缩放动画
    _addPickupAnimation(true);
    //以后每隔1秒，再次添加一个缩放动画，总共添加4个
    _animationTimer =
        Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      _addPickupAnimation(true);
      count++;
      if (count >= 4) {
        timer.cancel();
      }
    });
  }

  ///添加动画控件
  ///init: 首次添加5个基本控件时，=true，
  void _addPickupAnimation(bool init) {
    var controller = _createAnimationController();
    _animationControllers.add(controller);
    print("tag——children length : ${_animationChildren.length}");
    var animation = Tween(begin: 60.0, end: 120.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
    if (!init) {
      //5个基本动画控件初始化完成的情况下，每次添加新的动画控件时，移除第一个，确保动画控件始终保持5个
      _animationChildren.removeAt(0);
      //添加新的动画控件
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        //动画页面没有执行退出情况下，继续添加动画
        _animationChildren.add(AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity: 1 - ((animation.value - 60.0) / 60),
                child: ClipOval(
                  child: Container(
                    width: animation.value,
                    height: animation.value,
                    color: const Color(0x667BFF99),
                  ),
                ),
              );
            }));
        try {
          //动画页退出时，捕获可能发生的异常
          controller.forward();
          Utils.callSetStateSafely(this, () {});
        } catch (e) {
          return;
        }
      });
    } else {
      _animationChildren.add(AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: 1 - ((animation.value - 60.0) / 60),
              child: ClipOval(
                child: Container(
                  width: animation.value,
                  height: animation.value,
                  color: const Color(0x667BFF99),
                ),
              ),
            );
          }));
      controller.forward();
      Utils.callSetStateSafely(this, () {});
    }
  }


  ///销毁动画
  void _disposePickupAnimation() {
    //释放动画所有controller
    for (var element in _animationControllers) {
      element.dispose();
    }
    _animationControllers.clear();
    _animationTimer?.cancel();
    _animationChildren.clear();
  }

  ///创建动画控制器
  AnimationController _createAnimationController() {
    var controller = AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
        if (_animationControllers.contains(controller)) {
          _animationChildren.remove(controller);
        }
        //每次动画控件结束时，添加新的控件，保持动画的持续性
        if (mounted) _addPickupAnimation(false);
      }
    });
    return controller;
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
        PhoneCallNotify.rejectCall(widget._chatCall);
        onClose();
        _disposePickupAnimation();
        break;
      case AppLifecycleState.paused:
        PhoneCallNotify.rejectCall(widget._chatCall);
        onClose();
        _disposePickupAnimation();
        Application.onAppForegroundChange(false);
        break;
      case AppLifecycleState.hidden:
        PhoneCallNotify.rejectCall(widget._chatCall);
        onClose();
        _disposePickupAnimation();
        Application.onAppForegroundChange(false);
        break;
    }
  }
}
