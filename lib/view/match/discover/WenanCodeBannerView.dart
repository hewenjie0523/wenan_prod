import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/data/BannerInfo.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/WenanCodeSharedViewLogic.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:wenan/viewmodel/WenanCodeBannerConfigViewModel.dart';

class BannerView extends ConsumerWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(bannerConfigNotifier);
    if (Utils.isEmpty(state.data)) {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    } else {
      return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 4, color: AppColor.white)
          ),
          child: _createBannerView(context, state.data!),),);
    }
  }

  Widget _createBannerView(BuildContext context, List<BannerInfo> banners) {
    final height = (MediaQuery.of(context).size.width - 12 * 2) * 13 / 35;
    return SizedBox(
      height: height,
      child: CarouselSlider(
        items: banners.map((elem) {
          return GestureDetector(
            onTap: () {
              DataReporter.sendTrackCountEvent(
                  DataReporter.CLICK_ON_BANNER, 1);
              if (!Utils.isEmptyString(elem.scheme_url)) {
                if (elem.isNative) {
                  if (PageRouter.FirstChargePopupPage == elem.scheme_url) {
                    SharedViewLogic.showFirstRechargeModal(
                        context, PayFromType.FROM_HOME_BANNER);
                  } else if (PageRouter.VipChargePopupPage ==
                      elem.scheme_url) {
                    SharedViewLogic.showVipDlg(
                        context, PayFromType.FROM_HOME_BANNER);
                  } else {
                    PageRouter.routePage(context, elem.scheme_url!,
                        opaque: true);
                  }
                } else if (elem.isWeb) {
                  PageRouter.startWebview(context, elem.scheme_url!);
                }
              }
            },
            child: ImageLoader.loadRoundCornerImage(
                elem.image_url ?? "", BorderRadius.circular(16),
                type: ImageClipType.IMAGE_M),
          );
        }).toList(),
        options: CarouselOptions(
          height: height,
          viewportFraction: 1,
          aspectRatio: 35 / 13,
          autoPlay: true,
        ),
      ),
    );
  }
}
