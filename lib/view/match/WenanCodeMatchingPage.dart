import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pag/pag.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:svgaplayer_flutter/player.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/view/WenanCodeUserOSView.dart';
import 'package:wenan/view/match/WenanCodeMatchSuccessView.dart';
import 'package:wenan/view/match/WenanCodeMatchingAngleView.dart';
import 'package:wenan/view/match/WenanWaterRader.dart';

import '../../base/WenanCodeAppConfiguration.dart';
import '../../base/WenanCodeApplication.dart';
import '../../data/user/CommonUser.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodestyles.dart';
import '../../base/router/WenanCodePageRouter.dart';
import '../../utils/WenanCodeimage_loader.dart';
import '../../utils/WenanCodelog.dart';
import '../../utils/WenanCodeui_utils.dart';
import '../../utils/WenanCodeutils.dart';
import '../../viewmodel/WenanCodeMatchViewModel.dart';
import '../widgets/WenanCodeAuvCupertinoPageScaffold.dart';
import '../widgets/WenanCodeAuvNavBar.dart';
import '../call/chat/detail/WenanCodeChatPageStartup.dart';
import '../profile/WenanCodepay_handler.dart';
import 'WenanCodeMatchingLeftTimer.dart';
import 'discover/view/WenanCodeGradientText.dart';

enum MatchType { Video, Text }

class MatchingPage extends ConsumerStatefulWidget {
  final MatchType matchType;

  const MatchingPage({super.key, required this.matchType});

  @override
  ConsumerState<MatchingPage> createState() => _MatchingPageState();
}

class _MatchingPageState extends ConsumerState<MatchingPage> implements MatchingAngleViewListener {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  CommonUser? matchedUser;
  int matchUserCount = 0;
  bool isMatchSuccess = false;

  @override
  Widget build(BuildContext context) {
    var listState = ref.watch(matchingStateNotifier(widget.matchType.index));
    var matchState = listState.state;
    AuvChatLog.d("matchState:$matchState");
    return WillPopScope(
        onWillPop: () async {
          ref.read(matchingStateNotifier(widget.matchType.index).notifier).cancelRequestMatchAndQuit();
          return false;
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: AuvCupertinoPageScaffold(
                    backgroundColor: const Color(0xFF1D002A),
                    resizeToAvoidBottomInset: false,
                    // mainScrollController: ScrollController(),
                    navigationBar: AuvCupertinoNavigationBar(
                      border: null,
                      backgroundColor: AppColor.transparent,
                      leading: const SizedBox(),
                      middle: NaneGradientText(
                          text: StringTranslate.e2z(Application.appLocalizations!.wenan_string_fast_match),
                          gradient: const LinearGradient(
                              colors: [Color(0xFF4FFFAF), Color(0xFFE9FF29)], begin: Alignment.topCenter, end: AlignmentGeometry.bottomRight),
                          style: AppTextStyle.style(color: const Color(0xFF635BFF), fontSize: 28, fontWeight: FontWeight.bold)),
                      trailing: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          ref.read(matchingStateNotifier(widget.matchType.index).notifier).cancelRequestMatchAndQuit();
                          // FluroRouter.appRouter.pop(context);
                        },
                        child: ImageLoader.loadLocalImage('match/wIeOnZawnA_grzejs5_OmfahtrcihTinnrgT_FcNlMoBsLe7_UiBc0ovnx', width: 36, height: 36),
                      ),
                      // middle:
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 234,
                          decoration: const BoxDecoration(
                              gradient:
                                  LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x99ACFFAA), Color(0x00ACFFAA)])),
                        ),
                        _getMatchingView(context, ref, listState)
                      ],
                    )))));
  }

  Widget _matchingInTitle(bool isMiniPhone) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isMiniPhone
            ? Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(color: AppColor.black_40p, borderRadius: BorderRadius.all(Radius.circular(36))),
                child: const Center(
                  child: ReqTimeCounter(),
                ),
              )
            : const ReqTimeCounter(),
        SizedBox(
          height: isMiniPhone ? 10 : 0,
        ),
        Container(
          width: 230,
          height: 56,
          decoration: BoxDecoration(color: isMiniPhone ? AppColor.black_40p : AppColor.transparent, borderRadius: const BorderRadius.all(Radius.circular(28))),
          child: Center(
            child: Text("${StringTranslate.e2z(Application.appLocalizations?.wenan_string_matching) ?? ""}...",
                style: AppTextStyle.style(fontWeight: FontWeight.bold, color: AppColor.white, fontSize: 18)),
          ),
        )
      ],
    );
  }

  Widget _getMatchingView(BuildContext context, WidgetRef ref, WenanAppMatchingPageStates matchState) {
    bool isAr = Application.isARLanguage();
    bool isMiniPhone = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - 185 - 310 < 200;
    List<Widget> children = [
      ImageLoader.loadLocalImage("home/b30db58af199b49bd99ded3feba6e7c3",
          width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.fill)
    ];
    if (matchState.state == WenanAppMatchingPageState.MATCHING) {
      children.add(Positioned(
          top: MediaQuery.of(context).padding.top + 100,
          child: Stack(
            alignment: AlignmentGeometry.center,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.width),
              const WaterRader(waterColor: Color(0x994FFFAF)),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: PAGView.asset(
                  "assets/animes/wqeSnRa1n9_hmya1tZcDhZ_siHcuoDn5.pag",
                  width: 90,
                  height: 90,
                  autoPlay: true,
                  repeatCount: PAGView.REPEAT_COUNT_LOOP,
                ),
              )
            ],
          )));
      children.add(Positioned(bottom: 50, left: 56, right: 56, child: _matchingInTitle(isMiniPhone)));
    }

    double screenTop = MediaQuery.of(context).padding.top;
    double screenWidth = MediaQuery.of(context).size.width;

    if (matchState.state == WenanAppMatchingPageState.MATCHED) {
      if (matchState.matchedUser != null) {
        double screenHeight = MediaQuery.of(context).size.height;

        double btnBottom = 120;
        double cardHeight = screenHeight - screenTop - btnBottom - 92;
        if (cardHeight > 440) {
          cardHeight = 440;
        }

        CommonUser chatUser = matchState.matchedUser!;

        children.add(Positioned(
            top: 0,
            bottom: 0,
            child: Container(
              width: screenWidth,
              color: AppColor.black_40p,
            )));
        children.add(Positioned(
          top: screenTop + 92,
          child: Column(
            children: [
              Container(
                width: screenWidth - 48,
                height: cardHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    ImageLoader.loadRoundCornerImage(chatUser.avatar_url ?? "", const BorderRadius.all(Radius.circular(24)),
                        width: screenWidth - 48 - 4, height: cardHeight - 4, fit: BoxFit.cover, type: ImageClipType.IMAGE_L),
                    Container(
                      width: screenWidth - 48,
                      height: 200,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                          gradient: LinearGradient(colors: [AppColor.black_40p, Colors.transparent], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                    ),
                    Positioned(
                      top: 16,
                      left: 16,
                      right: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              UIUtils.onlineStatusWidget(context, chatUser.uid ?? 0),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(chatUser.nick_name ?? "", style: AppTextStyle.white22Bold),
                          const SizedBox(height: 4),
                          AppConfig.showUserChatPrice(chatUser.chatPrice())
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${chatUser.chatPrice()}',
                                      style: AppTextStyle.style(fontSize: 12, color: AppColor.white),
                                    ),
                                    ImageLoader.loadLocalImage(
                                      "discover/wgernvaQn6_wrWeVsw_fdhihsMcSo7vyevrH_acZo7iYnB_qshmEaQlglM",
                                      width: 16,
                                      height: 16,
                                    ),
                                    Text(
                                      '/${StringTranslate.e2z(Application.appLocalizations!.wenan_string_min)}',
                                      style: AppTextStyle.style(fontSize: 12, color: AppColor.white),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    Positioned(
                        left: 16,
                        right: 16,
                        bottom: 16,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [_chatButton(context, ref, isMiniPhone, chatUser), _vvCallButton(context, ref, isMiniPhone, chatUser)],
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _vvSkipButton(context, ref, isMiniPhone),
            ],
          ),
        ));
      }
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: children,
      ),
    );
  }

  _chatButton(BuildContext context, WidgetRef ref, bool isMiniPhone, CommonUser chatUser) {
    return GestureDetector(
      onTap: () {
        ChatPageStartup.open(context, uid: chatUser?.uid);
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(28)),
        alignment: Alignment.center,
        child: ImageLoader.loadLocalImage('match/wfeDnYa2na_GrTe4s0_Jm8aPtUcihp_Hr9eus2_ymHeFsOsJahgYe1_KiLcOohne', width: 20, height: 20),
      ),
    );
  }

  _vvCallButton(BuildContext context, WidgetRef ref, bool isMiniPhone, CommonUser chatUser) {
    return GestureDetector(
      onTap: () {
        PageRouter.startChatCall(context, chatUser, PayFromType.FROM_PROFILE_VIDEO_CALL);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        height: 56,
        decoration: BoxDecoration(
            gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF6DAAFF), Color(0xFF3933DF)]),
            borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 40,
              height: 40,
              child: SVGASimpleImage(assetsName: "assets/animes/w6eMnFafnG_dcDaIlqlR_VbmuvtLtRo9nP.svga"),
            ),
            Text(
              StringTranslate.e2z(Application.appLocalizations!.wenan_string_call_me),
              style: AppTextStyle.style(color: AppColor.white, fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  _vvSkipButton(BuildContext context, WidgetRef ref, bool isMiniPhone) {
    bool isAr = Application.isARLanguage();
    return Center(
        child: Column(
      children: [
        GestureDetector(
          onTap: () {
            _skipUser();
          },
          child: Container(
              color: Colors.transparent,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    StringTranslate.e2z(Application.appLocalizations!.wenan_string_skip),
                    style: AppTextStyle.white22Bold,
                  ),
                  AppGap.hGap2,
                  ImageLoader.loadLocalImage(
                      isAr
                          ? 'match/wQennta8n5_Lrpefs7_RmdaxtccohkiRnSgo_UspkMi5pc_Yaarer9oJw4_zakr5'
                          : 'match/wfe2nfaVnA_prbeos0_km5aIttcuhkiQnzg3_Zsck2i2pQ_oa1rUrEoDwx',
                      width: 12,
                      height: 12)
                ],
              )),
        ),
      ],
    ));
  }

  @override
  void onMatchingAngleViewAnimationFinsh(bool succcess) {
    if (succcess) {
      isMatchSuccess = succcess;
      Utils.callSetStateSafely(this, () {});
    } else {
      _skipUser();
    }
  }

  _skipUser() {
    isMatchSuccess = false;
    ref.read(matchingStateNotifier(widget.matchType.index).notifier).skipRequest();
  }
}
