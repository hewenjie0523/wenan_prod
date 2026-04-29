import 'dart:math';

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/Gift.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/view/WenanCodeSharedViewLogic.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:wenan/viewmodel/WenanCodeGiftViewModel.dart';
import 'package:wenan/view/widgets/WenanCodeAuvCupertinoPageScaffold.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wenan/StringTranslate.dart';

var listGift =
    FutureProvider.autoDispose((ref) => ref.read(giftViewModel).getGift());
var currUserCoins = FutureProvider.autoDispose<String>(
    (ref) => ref.read(giftViewModel).getAccountCoins());
var userCoins = FutureProvider.autoDispose<String>(
        (ref) => ref.read(giftViewModel).getRealAccountCoins());

class GiftPage extends ConsumerStatefulWidget {
  const GiftPage({Key? key}) : super(key: key);

  @override
  ConsumerState<GiftPage> createState() => _GiftPageState();

  static Future<Gift?> show(BuildContext context) {
    var height = 400 / MediaQuery.of(context).size.height;
    return showFlexibleBottomSheet<Gift?>(
      minHeight: height - 0.0001,
      initHeight: height,
      maxHeight: height,
      context: context,
      isSafeArea: false,
      isCollapsible: false,
      bottomSheetColor: AppColor.transparent,
      builder: (context, controller, offset) {
        return const GiftPage();
      },
      // anchors: [0, 0.5, 1],
    );
    // PageRouter.routePage(context, PageRouter.soggyAppGiftPage);
  }
}

class _GiftPageState extends ConsumerState<GiftPage> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    AuvChatLog.d("GiftPage initState ");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.refresh(userCoins);
    });
  }

  @override
  void dispose() {
    AuvChatLog.d("GiftPage Disposed");
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var coins = ref.watch(userCoins).value;
    var giftList = ref.watch(listGift);
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF635BFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: AuvCupertinoPageScaffold(
                  backgroundColor: AppColor.transparent,
                  resizeToAvoidBottomInset: true,
                  child: Stack(
                    children: [
                      Align(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _cancelWidget(),
                            Text(
                              StringTranslate.e2z(Application.appLocalizations!.wenan_string_send_gifts),
                              style: AppTextStyle.style(
                                color: AppColor.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            giftList.whenOrNull(data: (gifts) {
                                  AuvChatLog.d("whenOrNull:${gifts}");
                                  return _getNaneAppGiftPageView(gifts);
                                }) ??
                                const SizedBox(),
                          ],
                        ),
                      ),
                      Positioned(
                          right: 16,
                          top: 316,
                          bottom: 16,
                          left: 24,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              _iconWidget(),
                              _coinsTextWidget(coins??""),
                              Align(
                                alignment: Alignment.centerRight,
                                child: _getCoinsButton(),
                              )
                            ],
                          ))
                    ],
                  )))),
    );
  }



  _iconWidget() {
    return Positioned(
      left: 0,
      child: ImageLoader.loadLocalImage('discover/wgernvaQn6_wrWeVsw_fdhihsMcSo7vyevrH_acZo7iYnB_qshmEaQlglM',
          width: 18, height: 18),
    );
  }


  _cancelWidget(){
    return CupertinoButton(
        padding: const EdgeInsetsDirectional.only(
            top: 12, bottom: 8, start: 10, end: 10),
        child: ImageLoader.loadLocalImage(
            "match/wge0nOaGn0_mrTe2s5_VpjaLlwa7_QdRrLaKwsaybqlleu_Ei0cj_wmtajtLclhg_NfeoYlrdV",
            width: 36,
            height: 9.5),
        onPressed: () {
          FluroRouter.appRouter.pop(context);
        });
  }

  _getCoinsButton(){
    return CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20),
        child: Text(
          StringTranslate.e2z(Application.appLocalizations!.wenan_string_get_coins),
          style: AppTextStyle.TextB1_14_Middle,
        ),
        onPressed: () {
          SharedViewLogic.showFirstRechargeModal(
              context,
              PayFromType.FROM_IM_SEND_GIFT)
              .then((value) =>
          {ref.refresh(userCoins)});
        });
  }


  _coinsTextWidget(String coins){
    return  Positioned(
        left: 20,
        child: Text(
          coins,
          style: AppTextStyle.TextWhite_14_Medium,
        ));
  }


  Widget _getNaneAppGiftPageView(List<Gift>? gifts) {
    if (gifts == null) {
      return const SizedBox();
    } else {
      var pageCount = gifts.length / 8 + (gifts.length % 8 > 0 ? 1 : 0);
      AuvChatLog.d("pageCount:$pageCount");
      List<Widget> childs = [];
      for (int i = 0; i < pageCount; i++) {
        var end = min((i + 1) * 8, gifts.length);
        // soggyAppGiftPageItem(items: gifts.sublist(i*8,end))
        childs.add(WenanAppGiftPageItem(items: gifts.sublist(i * 8, end)));
      }

      return Expanded(
          child: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: childs,
          ),
          Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 44,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: childs.length,
                  effect: const ExpandingDotsEffect(
                    spacing: 4,
                    dotWidth: 6,
                    dotHeight: 6,
                    dotColor: AppColor.white_50p,
                    activeDotColor: AppColor.white,
                  ), // your preferred effect
                  onDotClicked: (index) {},
                ),
              ))
        ],
      ));
    }
  }
}

class WenanAppGiftPageItem extends ConsumerWidget {
  final List<Gift> items;
  WenanAppGiftPageItem({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedId = ref.watch(selectedGiftIdProvider);
    var selectedIndex = items.indexWhere((element) => element.id == selectedId);
    var itemWidth = 72.0;
    var itemHeight = 104.0;
    var paddingEdge = 20.0;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: itemWidth, //每行三列
              childAspectRatio: itemWidth / itemHeight, //显示区域宽高相等
              crossAxisSpacing: (MediaQuery.of(context).size.width -
                      paddingEdge * 2 -
                      itemWidth * 4) /
                  3,
              mainAxisSpacing: 16),
          itemBuilder: (context, index) {
            return _getGiftItem(
                context, selectedIndex == index, items[index], ref);
          },
          itemCount: items.length,
        ));
  }

  Widget _getGiftItem(
      BuildContext context, bool selected, Gift gift, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          ref.read(giftViewModel).updateSelectGiftId(gift.id ?? 0, ref);
        }
      },
      child: Container(
        // width: 60,
        // height: 60,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF4FFFAF) : AppColor.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        // padding: const EdgeInsets.only(left: 12,right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColor.white_20p,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12))),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: ImageLoader.loadDefault(gift.icon ?? "",
                      width: 56, height: 56),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            selected
                ? _gestureDetectorWidget(context, selected, gift, ref)
                : _rowWidget(gift),
          ],
        ),
      ),
    );
  }

  _gestureDetectorWidget(BuildContext context, bool selected, Gift gift, WidgetRef ref){
    return GestureDetector(
      onTap: () {
        if (ref.read(giftViewModel).preSendGift(context, gift)) {
          FluroRouter.appRouter.pop(context, gift);
        } else {
          //充值引导
          SharedViewLogic.showBalanceReminderDlg(context,
              message: StringTranslate.e2z(Application.appLocalizations!.wenan_string_balance_reminder_desc_gift).replaceFirst("s%",
                  ref.read(userCoins).value ?? ""),
              okCallBack: () {
                //充值弹窗
                SharedViewLogic.showFirstRechargeModal(
                    context, PayFromType.FROM_IM_SEND_GIFT)
                    .then((value) => {ref.refresh(userCoins)});
              });
        }
      },
      child: Text(
        StringTranslate.e2z(Application.appLocalizations!.wenan_string_send),
        style: AppTextStyle.TextB1_14_Middle,
      ),
    );
  }

  _rowWidget( Gift gift){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          gift.price?.toString() ?? "",
          style: AppTextStyle.TextWhite_12,
        ),
        const SizedBox(
          width: 2,
        ),
        ImageLoader.loadLocalImage(
            'discover/wgernvaQn6_wrWeVsw_fdhihsMcSo7vyevrH_acZo7iYnB_qshmEaQlglM',
            width: 12,
            height: 12)
      ],
    );
  }
}
