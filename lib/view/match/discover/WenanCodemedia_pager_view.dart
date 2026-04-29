import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pag/pag.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/state/event/WenanChatPriceEvent.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/view/call/chat/mediaViewer/WenanCodeProfileMediaPhotoViewerDataSource.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:wenan/view/widgets/WenanCodeAuvNavBar.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
import 'package:video_player/video_player.dart';
import '../../../base/WenanCodeApplication.dart';
import '../../../data/AppMedia.dart';
import '../../../data/Gift.dart';
import '../../../data/chat/ChatGiftSnap.dart';
import '../../../data/chat/ChatSnapJsonContent.dart';
import '../../../data/user/CommonUser.dart';
import '../../../state/event/WenanCodeEvents.dart';
import '../../../state/event/WenanCodediscover_event.dart';
import '../../../http/UserApi.dart';
import '../../../http/WenanCodedio_helper.dart';
import '../../../db/repository/im/WenanCodeChatSnapSender.dart';
import '../../../res/WenanCodegaps.dart';
import '../../../res/WenanCodestyles.dart';
import '../../../utils/WenanCodeimage_url_utils.dart';
import '../../../utils/WenanCodelog.dart';
import '../../../utils/WenanCodeui_utils.dart';
import '../../../utils/WenanCodeutils.dart';
import '../../WenanCodeSharedViewLogic.dart';
import '../../call/chat/detail/WenanCodeChatPageStartup.dart';
import '../../call/chat/mediaViewer/WenanCodeProfileMediaVideoViewerDataSource.dart';
import '../../profile/view/WenanCodeReportSheet.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/http/push/WenanCodePushHelper.dart';
import 'package:wenan/StringTranslate.dart';

enum MediaFromType { DISCOVER, PROFILE }

class MediaPagerView extends ConsumerStatefulWidget {
  final CommonUser user;
  final MediaFromType type;

  const MediaPagerView(this.user, {Key? key, this.type = MediaFromType.PROFILE}) : super(key: key);

  @override
  createState() {
    return _MediaPagerViewState();
  }
}

class _MediaPagerViewState extends ConsumerState<MediaPagerView> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final PageController _pageController = PageController();
  int currIndex = -1;
  final _videoSet = HashMap<int, VideoPlayerController>();
  ValueNotifier<int> index = ValueNotifier(0);
  final int preloadCount = 3;
  List<AppMedia>? medias;
  List<AppImage> albumPics = [];
  VoidCallback? videoListener;
  final UserApi userApi = UserApi(DioHelper.getInstance());

  late CommonUser currUser;
  List<Gift>? gifts;
  late bool isAr;
  StreamSubscription? _chatPriceEventSubscription;
  StreamSubscription? _followEventSubscription;

  List tabs = [
    StringTranslate.e2z(AppLocalizations.of(Application.appContext!)!.wenan_string_ablum),
    StringTranslate.e2z(AppLocalizations.of(Application.appContext!)!.wenan_string_gift)
  ];
  int _currentIndex = 0;
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
    WidgetsBinding.instance.addObserver(this);
    currUser = widget.user;
    getUserInfo();
    isAr = Application.isARLanguage();
    _chatPriceEventSubscription = Application.eventBus.on<ChatPriceEvent>().listen((event) {
      Utils.callSetStateSafely(this, () {});
    });
    _followEventSubscription = Application.eventBus.on<FollowEvent>().listen((event) {
      if (event.uid == currUser.uid) {
        getUserInfo();
      }
    });
  }

  @override
  void didUpdateWidget(covariant MediaPagerView oldWidget) {
    super.didUpdateWidget(oldWidget);
    AuvChatLog.d("MediaPagerView didUpdateWidget ${widget.user.uid} -- oldWidget ${oldWidget.user.uid}");
    if (oldWidget.user.uid != widget.user.uid) {
      Utils.callSetStateSafely(this, () {
        currUser = widget.user;
        medias?.clear();
        Application.eventBus.fire(DiscoverEvent(DiscoverEventType.changed, currUser));
      });
    }
  }

  Future<void> getUserInfo() async {
    UserInfoRsp rsp = await userApi.userInfo(currUser.uid!);
    if (rsp.code == 0) {
      CommonUser user = rsp.getData()!;
      Utils.callSetStateSafely(this, () {
        currUser = user;
      });
      Application.chatContext.dbService.chatBoxDao.updateChatBoxUserInfo(user.uid!, user.avatar_url!, user.nick_name!);
    }
  }

  List<AppMedia> getMedias() {
    List<AppMedia> medias = [];
    var userMedias = currUser.getUserMedias();
    if (!Utils.isEmptyList(userMedias)) {
      medias.clear();
      medias.addAll(userMedias);
    }
    for (AppMedia e in medias) {
      var appMediaUrl = e.getAppMediaUrl();
      if (!Utils.isEmpty(appMediaUrl)) {
        if (e.isImage()) {
          precacheImage(CachedNetworkImageProvider(ImageURLUtils.imageLargeURL(appMediaUrl!)), context);
          if (!e.isVip()) {
            albumPics.add(e.image!);
          } else if (e.isVip() && Application.commonUser?.isVip() == true) {
            albumPics.add(e.image!);
          }
        }
        if (e.isVideo()) {
          precacheImage(CachedNetworkImageProvider(ImageURLUtils.imageLargeURL(appMediaUrl!)), context);
        }
      }
    }
    return medias;
  }

  @override
  void dispose() {
    AuvChatLog.d(' MediaPagerView dispose');
    WidgetsBinding.instance.removeObserver(this);
    _chatPriceEventSubscription?.cancel();
    _followEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d(' MediaPagerView build(BuildContext context)build(BuildContext context):${currUser.nick_name}');
    if (Utils.isEmptyList(medias)) {
      medias = getMedias();
    }
    if (Utils.isEmptyList(gifts)) {
      gifts = currUser.getUserGifts();
      AuvChatLog.d('UserGifts:${gifts.toString()}');
    }
    return Scaffold(
      backgroundColor: const Color(0xFF1D002A),
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AuvCupertinoNavigationBar(
        backgroundColor: AppColor.transparent,
        border: null,
        padding: const EdgeInsetsDirectional.only(
          top: 10,
        ),
        leading: UIUtils.navigationCommonBackButton(
          () => FluroRouter.appRouter.pop(context),
        ),
        trailing: CupertinoButton(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 6),
          onPressed: () => showMorePanel(),
          child: widget.user.uid == Application.commonUser?.uid
              ? Container()
              : ImageLoader.loadLocalImage("discover/wIesnvamnK_OrAeYsm_kd3irsOcXo9vMe7rI_wmboPr5e8", width: 24, height: 24, fit: BoxFit.contain),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 76),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      _avatarHeadLayout(),
                      AppGap.vGap16,
                      _mediaTab(),
                      Visibility(
                        visible: _currentIndex == 0,
                        child: _photoView(),
                      ),
                      Visibility(
                        visible: _currentIndex == 1,
                        child: _giftsGridView(),
                      ),
                      const SizedBox(
                        height: 76,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              decoration: BoxDecoration(gradient: UIUtils.bottomGradient()),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: _goFollowButton(),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _goCallBtn(),
          ),
        ],
      ),
    );
  }

  Widget _avatarHeadLayout() {
    double width = MediaQuery.of(context).size.width - 32;
    return Container(
      width: width,
      height: width * 1.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          ImageLoader.loadRoundCornerImage(
            currUser.avatar_url ?? "",
            width: width,
            height: width * 1.3,
            BorderRadius.circular(24),
            type: ImageClipType.IMAGE_L,
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: _userInfoView(),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: UIUtils.onlineStatusWidget(context, currUser.uid ?? 0),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: _goChatBtn(),
          ),
        ],
      ),
    );
  }

  Widget _userInfoView() {
    double width = MediaQuery.of(context).size.width - 128;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIUtils.maxWidthText(
                Text(
                  "${currUser.nick_name}",
                  style: AppTextStyle.style(
                    fontSize: 24,
                    color: AppColor.white,
                    height: 1.1,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                width,
              ),
              AppGap.vGap6,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppConfig.showUserChatPrice(currUser.chatPrice())
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${currUser.chatPrice()}',
                              style: AppTextStyle.style(fontSize: 16, color: AppColor.white),
                            ),
                            AppGap.hGap2,
                            ImageLoader.loadLocalImage(
                              "discover/wgernvaQn6_wrWeVsw_fdhihsMcSo7vyevrH_acZo7iYnB_qshmEaQlglM",
                              width: 16,
                              height: 16,
                            ),
                            AppGap.hGap2,
                            Text(
                              '/${StringTranslate.e2z(Application.appLocalizations!.wenan_string_min)}',
                              style: AppTextStyle.style(fontSize: 16, color: AppColor.white),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  AppGap.hGap8,
                  UIUtils.userCountryWidget(currUser),
                ],
              ),
              Utils.isEmpty(currUser.signature)
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.only(top: 4),
                      child: UIUtils.maxWidthText(
                        Text(
                          currUser.signature ?? "",
                          style: AppTextStyle.white14,
                        ),
                        width,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _goChatBtn() {
    return GestureDetector(
      onTap: () {
        AuvChatLog.d("MediaPage onChat");
        ChatPageStartup.open(context, uid: currUser.uid);
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.white,
        ),
        alignment: Alignment.center,
        child: ImageLoader.loadLocalImage(
          "profile/wWefnEaon9_arSehsg_DcKh8aPt0_yiocUoyn2",
          width: 20,
          height: 20,
        ),
      ),
    );
  }

  Widget _goCallBtn() {
    bool isID = Application.getLanguageCode() == 'id';
    return GestureDetector(
      onTap: () {
        PageRouter.startChatCall(context, currUser, PayFromType.FROM_PROFILE_VIDEO_CALL);
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16, bottom: 16),
        width: (MediaQuery.of(context).size.width - 56) / 2,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: UIUtils.mainGradient(),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 48,
              height: 48,
              child: SVGASimpleImage(assetsName: "assets/animes/w6eMnFafnG_dcDaIlqlR_VbmuvtLtRo9nP.svga"),
            ),
            Expanded(
              child: Text(
                StringTranslate.e2z(Application.appLocalizations!.wenan_string_call_me),
                style: AppTextStyle.style(color: AppColor.white, fontSize: isID ? 14 : 16, fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _goFollowButton() {
    return GestureDetector(
      onTap: () {
        Utils.callSetStateSafely(this, () {
          currUser.setFollowed = !currUser.isFollowed;
          currUser.setFollowedCount(currUser.isFollowed ? 1 : -1);
          handFollow(currUser);
        });
      },
      onDoubleTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 16, bottom: 16),
        width: (MediaQuery.of(context).size.width - 56) / 2,
        height: 56,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColor.white),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: !currUser.isFollowed,
                  child: ImageLoader.loadLocalImage(
                    "profile/wIeZnaa9nm_drbeEsq_xflonlvlqojw8_RcXo7uunktf_sibcTo8nW",
                    width: 20,
                    height: 18,
                  ),
                ),
                AppGap.hGap4,
                currUser.isFollowed
                    ? Text(
                        StringTranslate.e2z(Application.appLocalizations!.wenan_string_unFollow),
                        style: AppTextStyle.style(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.b1,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      )
                    : Text(
                        StringTranslate.e2z(Application.appLocalizations!.wenan_string_follow),
                        style: AppTextStyle.style(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.b1,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
              ],
            ),
            Text(
              currUser.getFollowedCount().toString(),
              style: AppTextStyle.TextB1_16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _photoView() {
    double itemWidth = (MediaQuery.of(context).size.width - 52) / 3;
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: itemWidth, //每行三列
          childAspectRatio: itemWidth / itemWidth, //显示区域宽高相等
          crossAxisSpacing: 10,
          mainAxisSpacing: 16,
        ),
        itemCount: medias!.length,
        itemBuilder: (context, index) {
          var media = medias![index];
          return _mediaCard(media, itemWidth);
        },
      ),
    );
  }

  Widget _mediaTab() {
    return SizedBox(
      width: 220,
      height: 40,
      child: TabBar(
        controller: _controller,
        indicatorColor: const Color(0xFF635BFF),
        indicatorWeight: 3,
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: const EdgeInsets.all(0),
        labelColor: const Color(0xFF635BFF),
        unselectedLabelColor: AppColor.white_40p,
        labelStyle: AppTextStyle.style(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: AppTextStyle.style(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.all(0),
        onTap: (index) => Utils.callSetStateSafely(this, () {
          _currentIndex = index;
        }),
        tabs: tabs.map((e) {
          return Tab(
            text: e,
          );
        }).toList(),
      ),
    );
  }

  Widget _mediaCard(AppMedia media, double width) {
    return GestureDetector(
      onTap: () {
        if (media.isVip() && !(Application.commonUser?.isVip() == true)) {
          DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_PROFILE_BECOME_VIP, 1);
          SharedViewLogic.showVipDlg(
            context,
            PayFromType.FROM_PROFILE_ALBUM,
          );
        } else if (media.isImage()) {
          FeedMediaPhotoViewerDataSource.showViewer(
            context,
            list: albumPics,
            selectItem: media.image,
          );
        } else if (media.isVideo()) {
          FeedMediaVideoViewerDataSource.showViewer(context, [media.video!]);
        }
      },
      child: Container(
        width: width,
        height: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            ImageLoader.loadRoundCornerImage(
              media.getAppMediaUrl() ?? "",
              BorderRadius.circular(12),
              type: ImageClipType.IMAGE_S,
            ),
            Visibility(
              visible: media.isVideo(),
              child: Center(
                child: ImageLoader.loadLocalImage(
                  "wIeTnWavny_jrLexsG_BvuiydWenoL_5pwlza4yG_fi7c6oenC",
                  width: 44,
                  height: 44,
                ),
              ),
            ),
            // vip only
            Visibility(
              visible: media.isVip() && !(Application.commonUser?.isVip() == true),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                      child: Container(
                        color: AppColor.black_40p,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: ImageLoader.loadLocalImage(
                        "profile/wNernEaNnM_8rAeKst_uphraobfSialOek_Evhi1pN_qlzodcwkJ",
                        width: 16,
                        height: 16,
                      ),
                    ),
                    Center(
                      child: ImageLoader.loadLocalImage("me/wRejnHa8nA_Lrceksg_lmled_lvKifpK_GipcxoMno", width: 44, height: 44, fit: BoxFit.contain),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _giftsGridView() {
    double itemWidth = (MediaQuery.of(context).size.width - 52) / 3;
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: itemWidth, //每行三列
          childAspectRatio: itemWidth / itemWidth, //显示区域宽高相等
          crossAxisSpacing: 10,
          mainAxisSpacing: 16,
        ),
        itemCount: gifts!.length,
        itemBuilder: (context, index) {
          var gift = gifts![index];
          return _giftItemCard(gift, itemWidth);
        },
      ),
    );
  }

  Widget _giftItemCard(Gift gift, double width) {
    return Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColor.white_20p),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ImageLoader.loadDefault(gift.icon ?? "", width: 72, height: 72, fit: BoxFit.cover, type: ImageClipType.IMAGE_S),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 56,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFCA87FF), Color(0xFF7641D3)],
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "x${gift.total_count}",
                style: AppTextStyle.white12Bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendGift(int? uid, Gift gift) async {
    if (uid == null || uid == 0) return;
    var chatbox = await ChatPageStartup.chatBoxByUser(uid);
    if (chatbox == null) return;
    //ChatGiftSnap(8, gift.id, user.uid, 1, gift.min_duration, gift.max_duration, gift.name, gift.icon, gift.animation_type,
    // gift.animation_url, gift.price, gift.value)
    var giftSnap = ChatGiftSnap()
      ..id = gift.id
      ..category = ChatSnapJsonContentCategory.imGiftCate.value
      ..to_uid = uid
      ..quantity = 1
      ..min_duration = gift.min_duration
      ..max_duration = gift.max_duration
      ..name = gift.name
      ..icon = gift.icon
      ..animation_type = gift.animation_type
      ..animation_url = gift.animation_url
      ..price = gift.price
      ..value = gift.value
      ..gift_type = 0;
    ChatSnapSender.sendJsonSnap(chatbox.id ?? 0, jsonEncode(giftSnap.toJson()), sendCallback: (send) {
      if (send) {
        PageRouter.startSvgaPlayer(context, gift.animation_url ?? "", svgaIcon: gift.icon);
      }
    });
  }

  preload(int target) async {
    // 播放当前的，暂停其他的
    var oldIndex = index.value;
    var newIndex = target;
    if (Utils.isEmptyList(medias)) return;
    // 暂停之前的视频
    if (medias![oldIndex].isVideo()) {
      VideoPlayerController? ve = getVideoEntryByMedia(oldIndex);
      ve?.seekTo(Duration.zero);
      await ve?.pause();
      if (videoListener != null) {
        ve?.removeListener(videoListener!);
      }
    }
    if (medias![newIndex].isVideo()) {
      var videoEntry = getVideoEntryByMedia(newIndex);
      await videoEntry?.play();
      videoListener = _playChangedListener(videoEntry);
      videoEntry?.addListener(videoListener!);
      index.value = target;
    }
  }

  VideoPlayerController? _getCurrentVideoController() {
    int indexPage = currIndex;
    if (indexPage < 0 || Utils.isEmptyList(medias)) return null;
    return getVideoEntryByMedia(indexPage);
  }

  VideoPlayerController? getVideoEntryByMedia(int index) {
    if (Utils.isEmptyList(medias)) return null;
    var media = medias![index];
    var mid = media.video?.id ?? -1;
    VideoPlayerController? controller = _videoSet[mid];
    return controller;
  }

  AppMedia? getCurrentMedia() {
    int indexPage = currIndex;
    if (indexPage < 0 || Utils.isEmptyList(medias)) return null;
    return medias![indexPage];
  }

  void _currentVideoResumed() {
    var currentMedia = getCurrentMedia();
    var isVideo = currentMedia?.isVideo() ?? false;
    if (isVideo) {
      _getCurrentVideoController()?.play();
    }
  }

  void _currentVideoPause() {
    var currentMedia = getCurrentMedia();
    var isVideo = currentMedia?.isVideo() ?? false;
    var currentVideoController = _getCurrentVideoController();
    if (isVideo && currentVideoController?.value.isPlaying == true) {
      currentVideoController?.pause();
    }
  }

  VoidCallback _playChangedListener(VideoPlayerController? ve) {
    return () {
      Utils.callSetStateSafely(this, () {});
    };
  }

  showMorePanel() {
    SharedViewLogic.showDiscoverPopWindow(context, () => report(), () => block());
  }

  handFollow(CommonUser user) async {
    try {
      var future = user.isFollowed ? userApi.follow(user.uid!) : userApi.unFollow(user.uid!);
      var result = await future;
      if (result.code == 0) {
        if (result.data is Map<String, dynamic>) {
          var follow = Utils.parseInt((result.data as Map<String, dynamic>)["follow"]);
          if (follow != null) {
            user.follow = follow;
            if (user.isFollowed) {
              Future.delayed(Duration.zero, () => PushHelper.showNotifyPermissionDialog(context, "follow"));
            }
          }
        }
      }
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
    }
  }

  block() {
    Navigator.of(context).pop();
    SharedViewLogic.showBlockConfirmDlg(context, okCallBack: () async {
      try {
        var result = await UserApi(DioHelper.getInstance()).block(widget.user.uid ?? -1);
        if (result.code == 0) {
          Fluttertoast.showToast(msg: StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_block_success));
        } else {
          Fluttertoast.showToast(msg: "${result.msg}");
        }
      } catch (e, stack) {
        AuvChatLog.printE(e, error: stack);
        Fluttertoast.showToast(msg: e.toString());
      }
      Application.eventBus.fire(DiscoverEvent(DiscoverEventType.remove, widget.user));
      FluroRouter.appRouter.pop(context);
    });
  }

  report() {
    Navigator.of(context).pop();
    ReportSheet.show(context, widget.user.uid);
  }
}
