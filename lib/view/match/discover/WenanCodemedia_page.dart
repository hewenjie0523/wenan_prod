import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pag/pag.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/data/user/CommonUserOnlineStatus.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/state/event/WenanChatPriceEvent.dart';
import 'package:wenan/state/event/WenanCodediscover_filter_event.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/WenanCodeSharedViewLogic.dart';
import 'package:wenan/view/match/discover/WenanCodeBannerView.dart';
import 'package:wenan/view/match/discover/WenanCodemedia_pager_view.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:wenan/viewmodel/WenanCodeBannerConfigViewModel.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/state/WenanCodeBaseApiState.dart';
import 'package:wenan/viewmodel/WenanCodeMatchViewModel.dart';
import 'package:wenan/viewmodel/WenanCodediscover_vm_provider.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';
import 'package:tapped/tapped.dart';
import 'package:wenan/StringTranslate.dart';

import '../../WenanCodeUserOSView.dart';

final discoverPageNotifier = StateNotifierProvider.autoDispose.family<DiscoverPageNotifier, BaseApiPageState<CommonUser>, DiscoverType>((ref, type) {
  return DiscoverPageNotifier(BaseApiPageState<CommonUser>(), type);
});

final listRegions = FutureProvider.autoDispose((ref) => ref.read(matchViewModel).getListRegions());

class MediaPage extends ConsumerStatefulWidget {
  DiscoverType type;

  MediaPage({this.type = DiscoverType.POPULAR, Key? key}) : super(key: key);

  @override
  createState() {
    return _MediaPageState();
  }
}

class _MediaPageState extends ConsumerState<MediaPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final EasyRefreshController _refreshController = EasyRefreshController(controlFinishLoad: true);

  bool _displayVipBtn = false;
  StreamSubscription? streamSubscription, _chatPriceEventSubscription;

  @override
  void initState() {
    super.initState();
    _displayVipBtn = widget.type == DiscoverType.POPULAR && SpHelper.getDiscoverFilterRegionVipOnly() && Application.commonUser?.isVip() == false;

    streamSubscription = Application.eventBus.on<DiscoverFilterEvent>().listen((event) {
      Utils.callSetStateSafely(this, () {
        _displayVipBtn = widget.type == DiscoverType.POPULAR && SpHelper.getDiscoverFilterRegionVipOnly() && Application.commonUser?.isVip() == false;
      });
    });
    _chatPriceEventSubscription = Application.eventBus.on<ChatPriceEvent>().listen((event) {
      Utils.callSetStateSafely(this, () {});
    });
  }

  bool _isLoadMore() {
    return _refreshController.footerState?.mode != IndicatorMode.done && _refreshController.footerState?.mode != IndicatorMode.inactive;
  }

  @override
  void dispose() {
    _pageController.dispose();
    streamSubscription?.cancel();
    _chatPriceEventSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(discoverPageNotifier(widget.type));
    AuvChatLog.d("discover loadMore,footerState=${_refreshController.footerState?.mode},_isLoadMore=${_isLoadMore()}");
    if (state.status != ReqStatus.loading && _isLoadMore()) {
      _refreshController.finishLoad();
    }
    return Scaffold(
      backgroundColor: AppColor.transparent,
      body: Stack(
        children: [
          _setUpView(context, ref, state),
        ],
      ),
    );
  }

  Widget _setUpView(BuildContext context, WidgetRef ref, BaseApiPageState<CommonUser> state) {
    if (Utils.isEmptyList(state.dataList)) {
      if (state.status == ReqStatus.loading) {
        return const Center(
            child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(AppColor.black),
          ),
        ));
      } else {
        Widget nodataWidget = Center(
          child: Text(StringTranslate.e2z(Application.appLocalizations!.wenan_string_no_data),
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.b3,
              )),
        );
        return widget.type == DiscoverType.POPULAR
            ? Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 16),
                child: Column(
                  children: [
                    const BannerView(),
                    _peopleListWidgets(context),
                    const SizedBox(
                      height: 150,
                    ),
                    nodataWidget
                  ],
                ))
            : nodataWidget;
      }
    }
    double paddingEdge = 8;
    double itemWidth = (MediaQuery.of(context).size.width - paddingEdge * 3) / 2.0;

    return Padding(
      padding: EdgeInsets.fromLTRB(paddingEdge, 0, paddingEdge, 0),
      child: EasyRefresh(
          controller: _refreshController,
          header: const MaterialHeader(),
          footer: const CupertinoFooter(),
          onRefresh: () async {
            ref.read(discoverPageNotifier(widget.type).notifier).refresh();
            ref.read(bannerConfigNotifier.notifier).refresh();
          },
          onLoad: state.hasMore
              ? () async {
                  ref.read(discoverPageNotifier(widget.type).notifier).loadMore();
                }
              : null,
          child: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.only(top: 12),
            crossAxisCount: 2,
            itemBuilder: (context, index) {
              return index == 0 && widget.type == DiscoverType.POPULAR
                  ? _peopleListWidgets(context)
                  : Padding(
                      padding: EdgeInsets.only(bottom: (index > state.dataList!.length - 1) ? 74 : 8),
                      child: _OpenNaneContainerWrapper(
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedBuilder: (BuildContext _, VoidCallback openContainer) {
                          return _gePeopleItem(state.dataList![widget.type == DiscoverType.POPULAR ? index - 1 : index], itemWidth);
                        },
                        onClosed: (result) {},
                        tappable: !_displayVipBtn,
                        user: state.dataList![widget.type == DiscoverType.POPULAR ? index - 1 : index],
                      ));
            },
            staggeredTileBuilder: (int index) => StaggeredTile.fit(index == 0 && widget.type == DiscoverType.POPULAR ? 2 : 1),
            // mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            itemCount: widget.type == DiscoverType.POPULAR ? state.dataList!.length + 1 : state.dataList!.length,
          )),
    );
  }

  Widget _peopleListWidgets(BuildContext context) {
    var regionList = ref.watch(listRegions).whenOrNull(data: (regionsData) {
          return regionsData;
        }) ??
        [];
    var regionCode = SpHelper.getDiscoverFilterCode() ?? "";
    var selectedIndex = regionList.indexWhere((element) => element.region_code == regionCode);

    if (regionList.isNotEmpty && (Utils.isEmpty(regionCode) || (selectedIndex < 0 || regionList.length <= selectedIndex))) {
      AuvChatLog.d('_beforeListWidgets regionList.isNotEmpty');
      var selectRegion = regionList.first;
      regionCode = selectRegion.region_code!;
      Future.delayed(const Duration(milliseconds: 500), () {
        AuvChatLog.d('_beforeListWidgets Application.eventBus.fire(DiscoverFilterEvent(regionCode))');
        SpHelper.setDiscoverFilterRegionCode(selectRegion.region_code ?? "");
        SpHelper.setDiscoverFilterRegionName(selectRegion.name ?? "");
        SpHelper.setDiscoverFilterRegionVipOnly(selectRegion.isVipOnly);
        Application.eventBus.fire(DiscoverFilterEvent(selectRegion.region_code ?? ""));
      });
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BannerView(),
        Container(
          height: 40,
          margin: const EdgeInsets.only(
            bottom: 12,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const VerticalDivider(
              width: 8,
              color: AppColor.transparent,
            ),
            itemCount: regionList.length,
            itemBuilder: (context, index) {
              var region = regionList[index];
              bool selected = region.region_code == regionCode;
              return GestureDetector(
                onTap: () {
                  AuvChatLog.d('DiscoverFilterPage onRegionChanged: ${region.region_code ?? ""}');
                  SpHelper.setDiscoverFilterRegionCode(region.region_code ?? "");
                  SpHelper.setDiscoverFilterRegionName(region.name ?? "");
                  SpHelper.setDiscoverFilterRegionVipOnly(region.isVipOnly);
                  Application.eventBus.fire(DiscoverFilterEvent(region.region_code ?? ""));
                },
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(18)),
                    color: selected ? null : AppColor.white_20p,
                    gradient: selected ? UIUtils.mainGradient() : null,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: region.isVipOnly,
                        child: ImageLoader.loadLocalImage(
                          "discover/wkeHnlaknD_mriejsC_odsiYsZcTouvBeirz_dvSiypD_6iic2obnZ",
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Visibility(
                        visible: region.isVipOnly,
                        child: AppGap.hGap4,
                      ),
                      Text(
                        region.name ?? '',
                        style: selected ? AppTextStyle.white16 : AppTextStyle.TextB3_16,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _peopleItemCountry(CommonUser user) {
    return Container(
      width: 53,
      height: 48,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ImageLoader.assetImage("discover/wbeVnUawnE_creehsd_7d5iOsBcHoXv6eBrY_NcroDuVnDt0rCy1_ncAogrrnIeZr3"),
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        width: 24,
        height: 24,
        margin: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: AppColor.white)),
        child: ImageLoader.loadOvalImage(
          user.getCountry()?.icon ?? "",
          width: 20,
          height: 20,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _gePeopleItem(CommonUser user, double itemWidth) {
    // AuvChatLog.d("_getAnchorItem,user= ${user.toJson()}");
    double height = itemWidth * 1.5;
    return Container(
      width: itemWidth,
      height: height,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          ImageLoader.loadRoundCornerImage(
            user.avatar_url ?? "",
            BorderRadius.circular(12),
            width: itemWidth,
            height: height,
            type: ImageClipType.IMAGE_M,
          ),
          Positioned(
            top: 8,
            left: 8,
            child:  UIUtils.onlineStatusWidget(context, user.uid ?? 0),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: _displayVipBtn ? _needVipBtn(user, itemWidth) : _callPeopleBtn(user, itemWidth),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _peopleItemCountry(user),
          ),
        ],
      ),
    );
  }

  Widget _callPeopleBtn(CommonUser user, double width) {
    return Tapped(
      onTap: () => PageRouter.startChatCall(context, user, PayFromType.FROM_HOME_VIDEO_CALL),
      child: Container(
        width: width - 42,
        height: 48,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ImageLoader.assetImage("discover/wReYnza3nV_lrRemsl_pdPiAsEcMoDvMeyrx_lcuavlAlv_CcKoNrBnKeUrY"),
            fit: BoxFit.fill,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          children: [
            const SizedBox(
              width: 40,
              height: 40,
              child: SVGASimpleImage(assetsName: "assets/animes/w6eMnFafnG_dcDaIlqlR_VbmuvtLtRo9nP.svga"),
            ),
            AppGap.hGap2,
            SizedBox(
              width: width - 94,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.nick_name ?? "",
                    style: AppTextStyle.style(fontSize: 14, color: AppColor.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AppGap.vGap2,
                  AppConfig.showUserChatPrice(user.chatPrice())
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${user.chatPrice()}',
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
          ],
        ),
      ),
    );
  }

  Widget _needVipBtn(CommonUser user, double width) {
    return Tapped(
      onTap: () => SharedViewLogic.showVipDlg(context, PayFromType.FROM_REGION),
      child: Container(
        width: width - 42,
        height: 48,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ImageLoader.assetImage("discover/wlebntaqnx_erjeisg_odDipsvc2ouvYeerO_BvSiZpj_TcxozrFnue6rR"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class _OpenNaneContainerWrapper extends StatelessWidget {
  const _OpenNaneContainerWrapper({
    required this.closedBuilder,
    required this.transitionType,
    required this.onClosed,
    required this.user,
    this.tappable = true,
  });

  final CloseContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool?> onClosed;
  final CommonUser user;
  final bool tappable;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return MediaPagerView(user);
      },
      onClosed: onClosed,
      tappable: tappable,
      closedBuilder: closedBuilder,
      closedColor: AppColor.transparent,
      openColor: AppColor.transparent,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(22.0)),
      ),
    );
  }
}
