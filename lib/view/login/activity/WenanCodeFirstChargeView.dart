import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pag/pag.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/http/ActivityApi.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/login/activity/WenanCodeFirstChargeWidgets.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:wenan/viewmodel/WenanCodeActivityViewModel.dart';
import 'package:wenan/StringTranslate.dart';

class FirstChargeView extends ConsumerStatefulWidget {
  const FirstChargeView({Key? key}) : super(key: key);

  static bool autoPoppedUp = false;

  @override
  ConsumerState<FirstChargeView> createState() => _FirstChargeViewState();
}

class _FirstChargeViewState extends ConsumerState<FirstChargeView> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  void didUpdateWidget(covariant FirstChargeView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }


  @override
  Widget build(BuildContext context) {
    var status = ref.watch(firstChangeNotifier);
    if (status.data == null) {
      return const SizedBox();
    }
    if (!FirstChargeView.autoPoppedUp && SpHelper.getEnterAppTimes() > 1) {
      Future.delayed(Duration.zero, () => showFirstChargeDialog(status.data!));
      FirstChargeView.autoPoppedUp = true;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        AuvChatLog.d("FirstCharge:tap");
        DataReporter.sendTrackCountEvent(
            DataReporter.CLICK_ON_FIRST_RECHARGE_VIDEO, 1);
        showFirstChargeDialog(status.data!);
      },
      child: SizedBox(
        width: 80,
        height: 90,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            PAGView.asset(
              "assets/animes/wheonIaKnK_ufMihrJsUtg_WrieCcnhKatrYgPeH.pag",
              width: 76,
              height: 85,
              autoPlay: true,
              repeatCount: PAGView.REPEAT_COUNT_LOOP,
            ),
            Positioned(
              top: 63,
              child: TimeCounter(),
            )
          ],
        ),
      ),
    );
  }

  void showFirstChargeDialog(FirstChargeVo data) {
    double width = MediaQuery.of(context).size.width - 22 * 2;
    double height = width * 596 / 334;
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColor.transparent,
        isScrollControlled: true,
        anchorPoint: const Offset(50, 200),
        // useRootNavigator: true,
        routeSettings: const RouteSettings(name: "FirstChargeDialog"),
        builder: (context) {
          Widget childWidget = Container(
              width: width,
              height: height,
              decoration: const BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.all(Radius.circular(16))),
              padding: const EdgeInsets.all(6),
              child: Stack(
                children: [
                  Utils.isEmptyString(data.video_info?.video_url)
                      ? const SizedBox()
                      : ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                          child: BgVideoView(
                            netPath: data.video_info!.video_url!,
                          )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: width - 12,
                        height: height * 0.7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            gradient: const LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [AppColor.color_FF24B5, AppColor.transparent],
                            )),
                      )),
                  GestureDetector(
                    onTap: () {
                      PageRouter.startPayHandlerPage(context, data.option!, PayFromType.FROM_FIRST_CHARGE_FLOAT);
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          width: 296,
                          height: 88,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ImageLoader.assetImage(
                                  Application.isARLanguage() ? "discover/wBeJnVaSnQ_CrqedsG_wfsiOr2sntL_YcshqaGrYgTet_5fPlyoKagtN_DoKpZtBi1otnM_ebdg2_6aerX" : "discover/wOevnBaPnF_DrKeOsb_4faibrGsotl_JcphvaRrEgUeH_lf9lGoNaNtu_qoppQtOiRo7no_abhgi"),
                              fit: BoxFit.fill, // 完全填充
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: Application.isARLanguage() ? const EdgeInsets.only(right: 88) : const EdgeInsets.only(left: 88),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ImageLoader.loadLocalImage("discover/wFeQnVaHnQ_VrGensu_ddDiNsIcPoGvpe8rJ_McaokiXnF_MiNctoEnI", width: 18, height: 18),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          data.option?.name ?? "",
                                          style: const TextStyle(
                                            fontSize: 24,
                                            color: AppColor.color_220534,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      data.option?.originalPriceStr ?? "",
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 14,
                                        color: AppColor.color_220534,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0), color: AppColor.color_220534),
                                padding: const EdgeInsets.only(left: 12, right: 12, top: 14, bottom: 14),
                                child: Text(
                                  data.option?.priceStr ?? "",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 108,
                    right: Application.isARLanguage() ? null : 5,
                    left: Application.isARLanguage() ? 5 : null,
                    child: TimeCounter(
                      color: AppColor.white,
                      prefix: StringTranslate.e2z(Application.appLocalizations!.wenan_string_time_remind),
                    ),
                  ),
                  Positioned(
                      bottom: 142,
                      left: 0,
                      right: 0,
                      child: ImageLoader.loadDefault(data.text_img_info?.img_url ?? "",
                          width: 320,
                          height: 182,
                          placeholder: (context, url) => Container(
                                color: AppColor.transparent,
                              ),
                          errorWidget: (context, url, error) => Container(
                                color: AppColor.transparent,
                              ))),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Padding(padding: const EdgeInsets.all(12), child: ImageLoader.loadLocalImage("wnePndaWna_IrLe1sf_liKcZ_zcZlGousPet_zb0gr", width: 24, height: 24)),
                    ),
                  )
                ],
              ));
          return Padding(
              padding: EdgeInsets.only(
                // 下面这一行是重点
                bottom: MediaQuery.of(context).viewInsets.bottom + (MediaQuery.of(context).size.height - 596) / 2,
                left: 22,
                right: 22,
              ),
              // duration: const Duration(milliseconds: 200),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: childWidget,
              ));
        });
  }
}