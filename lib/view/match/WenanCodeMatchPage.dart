import 'dart:async';
import 'dart:math';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pag/pag.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/view/match/WenanCodeMatchPageCard.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/view/match/WenanWaterRader.dart';
import '../../base/WenanCodeAppConfiguration.dart';
import '../../base/WenanCodeApplication.dart';
import '../../base/router/WenanCodePageRouter.dart';
import '../../data/MatchVideoFindItem.dart';
import '../../data/user/CommonUser.dart';
import '../../res/WenanCodecolors.dart';
import '../../state/WenanCodeBaseApiState.dart';
import '../../utils/WenanCodeimage_loader.dart';
import '../../utils/WenanCodelog.dart';
import '../../utils/WenanCodeutils.dart';
import '../../viewmodel/WenanCodeMatchVideoFindListNotifier.dart';
import 'WenanMatchVideoView.dart';
import 'WenanCodeMatchingPage.dart';
import 'discover/view/WenanCodeGradientText.dart';

final matchPageNotifier = StateNotifierProvider.autoDispose.family<MatchVideoFindListNotifier, BaseApiPageState<MatchVideoFindItem>, String>((ref, regionCode) {
  return MatchVideoFindListNotifier(BaseApiPageState<MatchVideoFindItem>(), regionCode);
});

class MatchPage extends ConsumerStatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends ConsumerState<MatchPage> with AutomaticKeepAliveClientMixin {
  List<MatchVideoFindItem>? users;
  String? regionCode;
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d("packname:${AppConfig.packageName}");
    bool isLoading = true;
    try {
      int now = DateTime.now().millisecondsSinceEpoch;
      AuvChatLog.d("MatchingPage now:$now");
      if (users == null || users!.isEmpty) {
        if (Utils.isEmptyString(regionCode)) {
          regionCode = Application.commonUser?.regionCode ?? "";
        }
        var listState = ref.watch(matchPageNotifier(regionCode!));
        users = listState.dataList;
        if (listState.status == ReqStatus.loading) {
          isLoading = true;
        } else {
          isLoading = false;
        }
        if (users != null) {
          for (MatchVideoFindItem item in users!) {
            AuvChatLog.d("MatchingPage listState user uid:${item.user!.uid ?? ""}");
          }
        }
      }
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
    }

    List<Widget> children = [
      ImageLoader.loadLocalImage("home/b30db58af199b49bd99ded3feba6e7c3",
          width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height, fit: BoxFit.fill),
    ];

    //Radar
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

    if (users != null && users!.length > 0) {
      //头像
      children.add(Positioned(top: MediaQuery.of(context).padding.top + 100, child: _wenanMatchingHead(users!)));

      // children.add(Positioned(
      //   top:  MediaQuery.of(context).padding.top + 20,
      //   left: 0,
      //   right: 0,
      //   child:  SizedBox(
      //     height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - 144,
      //     child: Padding(
      //       padding: const EdgeInsets.only(
      //         left: 25,
      //         right: 25,
      //         top: 50,
      //         bottom: 40,
      //       ),
      //       child: AppinioSwiper(
      //         loop: true,
      //         backgroundCardCount: 2,
      //         swipeOptions: const SwipeOptions.all(),
      //         allowUnlimitedUnSwipe: true,
      //         controller: controller,
      //         onUnSwipe: (_) => _unswipe(true),
      //         onSwipeEnd: (int previousIndex, int targetIndex, SwiperActivity activity) {
      //           debugPrint(activity.direction.toString());
      //           _swipe(targetIndex, activity.direction);
      //         },
      //         onEnd: _onEnd,
      //         cardCount: users != null ? users!.length : 0,
      //         cardBuilder: (BuildContext context, int index) {
      //           return MatchPageCard(item: users![index]);
      //         },
      //       ),
      //     ),
      //   ),));
    }

    children.add(
      Positioned(
          top: MediaQuery.of(context).padding.top,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 44,
            child: Center(
              child: NaneGradientText(
                  text: StringTranslate.e2z(Application.appLocalizations!.wenan_string_fast_match),
                  gradient:
                      const LinearGradient(colors: [Color(0xFF4FFFAF), Color(0xFFE9FF29)], begin: Alignment.topCenter, end: AlignmentGeometry.bottomRight),
                  style: AppTextStyle.style(color: const Color(0xFF635BFF), fontSize: 28, fontWeight: FontWeight.bold)),
            ),
          )),
    );
    //按钮
    children.add(Positioned(
      bottom: 120,
      child: GestureDetector(
        onTap: () {
          PageRouter.routePage(context, PageRouter.MatchingPage,
              transitionDuration: Duration(seconds: 0), routeSettings: const RouteSettings(arguments: MatchType.Video));
        },
        child: Container(
          width: 250,
          height: 56,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF4FFFAF), Color(0xFFE9FF29)], begin: Alignment.topCenter, end: AlignmentGeometry.bottomRight),
              borderRadius: BorderRadius.circular(20)),
          alignment: AlignmentGeometry.center,
          child: Text(
            StringTranslate.e2z(Application.appLocalizations!.wenan_string_start),
            style: AppTextStyle.black16_bold,
          ),
        ),
      ),
    ));
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: const Color(0xFF1D002A),
            resizeToAvoidBottomInset: false,
            body: Stack(
              alignment: Alignment.topCenter,
              children: children,
            ),
          ),
        ));
  }

  Widget _wennanUserAvatarView(String url, double size) {
    int animatedSeconds = Random().nextInt(4) + 1;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(size / 2), color: const Color(0xFF8BEC37)),
      alignment: Alignment.center,
      child: ImageLoader.loadOvalImage(url, width: size - 8, height: size - 8, type: ImageClipType.IMAGE_S),
    );
  }

  Widget _wenanMatchingHead(List<MatchVideoFindItem> userList) {
    double screenWidth = MediaQuery.of(context).size.width;
    List<Widget> children = [SizedBox(width: screenWidth, height: screenWidth)];
    for (int i = 0; i < userList.length; i++) {
      MatchVideoFindItem item = userList[i];
      switch (i) {
        case 0:
          children.add(Positioned(right: 62, top: 10, child: _wennanUserAvatarView(item.user?.avatar_url ?? '', 78)));
          break;
        case 1:
          children.add(Positioned(left: 40, top: screenWidth / 2 - 100, child: _wennanUserAvatarView(item.user?.avatar_url ?? '', 82)));
          break;
        case 2:
          children.add(Positioned(right: 47, top: screenWidth / 2 - 50, child: _wennanUserAvatarView(item.user?.avatar_url ?? '', 48)));
          break;
        case 3:
          children.add(Positioned(left: 32, bottom: 50, child: _wennanUserAvatarView(item.user?.avatar_url ?? '', 58)));
          break;
        case 4:
          children.add(Positioned(right: 28, bottom: 20, child: _wennanUserAvatarView(item.user?.avatar_url ?? '', 78)));
          break;
      }
    }
    return Stack(
      children: children,
    );
  }

  void _swipe(int index, AxisDirection direction) {
    // log("the card was swiped to the: " + direction.name);
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      // log("SUCCESS: card was unswiped");
    } else {
      // log("FAIL: no card left to unswipe");
    }
  }

  void _onEnd() {
    // log("end reached!");
  }
}
