import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:wenan/ClientInfo.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/view/match/discover/WenanCodeRulesPage.dart';
import 'package:wenan/view/WenanCodeloading_dialog.dart';
import 'package:wenan/view/profile/WenanCodefirst_recharge_page.dart';
import 'package:wenan/view/profile/WenanCodevip_buy_pop_view.dart';
import 'package:wenan/view/profile/WenanCodevip_pop_page.dart';
import 'package:tapped/tapped.dart';

import '../base/cache/WenanCodeAppCache.dart';
import '../http/CommonApi.dart';
import '../res/WenanCodecolors.dart';
import '../res/WenanCodegaps.dart';
import '../res/WenanCodestyles.dart';
import '../base/router/WenanCodePageRouter.dart';
import '../utils/WenanCodeAppCacheKeys.dart';
import '../utils/WenanCodeimage_loader.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';

import '../utils/WenanCodelog.dart';

class SharedViewLogic {
  static void showUnFollowConfirmDlg(BuildContext context,
      {VoidCallback? okCallBack}) async {
    var result = await showOkCancelAlertDialog(
        context: context,
        title: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_confirm_unfollow),
        okLabel: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_confirm));
    if (result == OkCancelResult.ok) {
      okCallBack?.call();
    }
  }

  static void showBlockConfirmDlg(BuildContext context,
      {VoidCallback? okCallBack}) async {
    var result = await showOkCancelAlertDialog(
        context: context,
        title: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_block_confirm),
        okLabel: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_confirm));
    if (result == OkCancelResult.ok) {
      okCallBack?.call();
    }
  }

  static void showLogoutConfirmDlg(BuildContext context,
      {VoidCallback? okCallBack}) async {
    var result = await showOkCancelAlertDialog(
        context: context,
        title: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_logout_confirm),
        okLabel: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_confirm));
    if (result == OkCancelResult.ok) {
      okCallBack?.call();
    }
  }

  static void showDeleteAccountConfirmDlg(BuildContext context,
      {VoidCallback? okCallBack}) async {
    var result = await showOkCancelAlertDialog(
        context: context,
        title: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_delete_confirm),
        okLabel: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_confirm));
    if (result == OkCancelResult.ok) {
      okCallBack?.call();
    }
  }

  static void showBalanceReminderDlg(BuildContext context,
      {String? message, VoidCallback? okCallBack}) async {
    var result = await showOkCancelAlertDialog(
        context: context,
        title: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_balance_reminder),
        message: message,
        okLabel: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_recharge));
    if (result == OkCancelResult.ok) {
      okCallBack?.call();
    }
  }

  static void showDisturbConfirmDlg(BuildContext context,
      {VoidCallback? okCallBack}) async {
    var result = await showOkCancelAlertDialog(
        context: context,
        title: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_disturb_dialog_title),
        okLabel: StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_confirm));
    if (result == OkCancelResult.ok) {
      okCallBack?.call();
    }
  }

  static void showDiscoverPopWindow(
      BuildContext context, VoidCallback report, VoidCallback block) {
    showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (context) {
          return Material(
              color: Colors.transparent,
              child: Stack(
                children: [
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () => Navigator.of(context).pop(),
                    child: const SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.of(context).padding.top + 48,
                      left: Application.isARLanguage() ? 24 : null,
                      right: Application.isARLanguage() ? null : 24,
                      child: Container(
                        constraints:
                            const BoxConstraints(minWidth: 105, minHeight: 105),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ImageLoader.assetImage(Application
                                    .isARLanguage()
                                ? "discover/wQeUnlabnp_6r4eBsF_idpiHsOcYohvreVr2_LpLotpOwKiAn0dAoXwt_ZbIgY_umbeT"
                                : "discover/w8eqnYa2n1_hr0e8sC_odDiEsPcDoPvmemrB_RpmoVpzw2iUnrd1oYw3_8bRgW"),
                            fit: BoxFit.fill, // 完全填充
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppGap.vGap27,
                            Tapped(
                              onTap: report,
                              child: Row(
                                children: [
                                  AppGap.hGap16,
                                  ImageLoader.loadLocalImage(
                                      "discover/w7einqaunc_urvemsX_XdWijswcioYv9efr0_artespjotrjt5_giic1olng",
                                      width: 18,
                                      height: 18),
                                  AppGap.hGap8,
                                  Text(
                                    StringTranslate.e2z(
                                        AppLocalizations.of(context)!
                                            .wenan_string_report),
                                    style: AppTextStyle.white16,
                                  ),
                                  AppGap.hGap16,
                                ],
                              ),
                            ),
                            AppGap.vGap20,
                            Tapped(
                              onTap: block,
                              child: Row(
                                children: [
                                  AppGap.hGap16,
                                  ImageLoader.loadLocalImage(
                                      "discover/wiefnkaynj_VrXecsT_5d5iZsqcJoCvkeBry_qbKlHoIcEkv_Mi8cboxn3",
                                      width: 18,
                                      height: 18),
                                  AppGap.hGap8,
                                  Text(
                                    StringTranslate.e2z(
                                        AppLocalizations.of(context)!
                                            .wenan_string_block),
                                    style: AppTextStyle.white16,
                                  ),
                                  AppGap.hGap16,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ));
        });
  }

  static Future showVipDlg(BuildContext context, int fromType) {
    return UIUtils.showPopVip(
        context,
        SizedBox(
          height: 590,
          child: VipPopPage(fromType: fromType),
        ),
        PageRouter.VipChargePopupPage);
  }

  static Future showRulesPageDlg(BuildContext context) {
    return UIUtils.showPopVip(
      context,
      const SizedBox(
        height: 600,
        child: WenanRulesPage(),
      ),
      PageRouter.RulesPage,
    );
  }

  static Future showLoadingDialog(BuildContext context,
      {bool canCancel = true}) {
    return showDialog(
        context: context,
        barrierDismissible: canCancel,
        builder: (context) {
          return const LoadingDialog();
        });
  }

  static void showFeedbackDialog(BuildContext context) {
    var config = AppCache.instance.get<AppConfigRsp>(AppCacheKeys.APP_CONFIG);
    AuvChatLog.d("config=$config");
    String number = config?.data?.extensions?.contact_number ?? "";
    String faq = config?.data?.extensions?.faq ?? "";
    AuvChatLog.d("number=$number,faq=${config?.data?.extensions?.faq}");
    var showFaq = faq.toLowerCase() == "aihelp";
    String url = "";
    if (!Utils.isEmpty(number)) {
      var appInfo = ClientInfo();
      StringBuffer builder = StringBuffer();
      builder.write("${AppConfig.appName} ");
      builder.write("Version:${appInfo.version} ");
      var user = Application.commonUser;
      builder.write("ID:${user?.ucode}  ");
      builder.write("NAME:${user?.nick_name}  ");
      builder.write("VIP:${user?.isVip()}  ");
      builder.write("Brand:${appInfo.brand}  ");
      builder.write("Lang:${appInfo.lang}  ");
      url =
          "https://api.whatsapp.com/send?phone=$number&text=${builder.toString()}"; //.extensions?.contact_number
    }

    var mainWidget = Column(
      children: [
        Container(
          // width: double.infinity,
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          padding:
              const EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 16),
          decoration: BoxDecoration(
              color: AppColor.white_20p,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              // Center(
              //   child: Text(
              //     StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_tips),
              //     style: AppTextStyle.white18,
              //   ),
              // ),
              AppGap.vGap12,
              // Container(
              //   height: 0.5,
              //   color: AppColor.white_10p,
              // ),
              SizedBox(
                height: 74,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppGap.hGap4,
                    ImageLoader.loadLocalImage("me/waeEntaJnF_8rlehso_xmceY_PcKo1iZni_giuceoXn0",
                        width: 44, height: 44),
                    AppGap.hGap10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringTranslate.e2z(
                              AppLocalizations.of(context)!.wenan_string_coins),
                          style: AppTextStyle.white16,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 140,
                            child: Text(
                              StringTranslate.e2z(AppLocalizations.of(context)!
                                  .wenan_string_used_to_call_the_girls),
                              style: AppTextStyle.white12_80p,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 0.5,
                color: AppColor.white_10p,
              ),
              SizedBox(
                height: 74,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppGap.hGap4,
                    ImageLoader.loadLocalImage("me/wRejnHa8nA_Lrceksg_lmled_lvKifpK_GipcxoMno",
                        width: 44, height: 44),
                    AppGap.hGap10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringTranslate.e2z(AppLocalizations.of(context)!
                              .wenan_string_premium),
                          style: AppTextStyle.white16,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 140,
                          child: Text(
                            StringTranslate.e2z(AppLocalizations.of(context)!
                                .wenan_string_used_to_send_msg_2_the_girls),
                            style: AppTextStyle.white12_80p,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //   Container(
              //     height: 0.5,
              //     color: AppColor.white_10p,
              //   ),
            ],
          ),
        ),
        Visibility(
          visible: !Utils.isEmpty(url),
          child: Padding(
            padding: const EdgeInsets.only(top: 24),
            child: UIUtils.commonButton(
              StringTranslate.e2z(
                  AppLocalizations.of(context)!.wenan_string_contact_us),
              24,
              () {
                PageRouter.startBrowserWeb(context, url);
              },
            ),
          ),
        ),
        Visibility(
          visible: showFaq,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: UIUtils.commonButton(
              StringTranslate.e2z(
                  AppLocalizations.of(context)!.wenan_string_customer_service),
              24,
              () {
                Application.callPlatformMethod(
                    "${Application.channelName}.showQA", <String, dynamic>{
                  '${Application.channelName}.ucode':
                      "${Application.currUserCode()}",
                  '${Application.channelName}.nickName':
                      "${Application.commonUser?.nick_name}",
                  '${Application.channelName}.qa_domain':
                      AppConfig.aiHelpDomain,
                  '${Application.channelName}.qa_app_key':
                      AppConfig.aiHelpAppKey,
                  '${Application.channelName}.qa_app_id': AppConfig.aiHelpAppId,
                });
              },
              buttonColor: AppColor.white,
              style: AppTextStyle.style(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.b1,
              ),
            ),
          ),
        ),
        AppGap.vGap20,
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              StringTranslate.e2z(
                  AppLocalizations.of(context)!.wenan_string_cancel),
              style: AppTextStyle.white16Bold,
            )),
        AppGap.vGap30,
      ],
    );
    UIUtils.showTipBottomDialog(
        context,
        StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_tips),
        mainWidget,
        PageRouter.FeedbackBtmDlg);
  }

  static Future showVipBuyDlg(BuildContext context, VoidCallback cancelCallBack,
      VoidCallback confirmCallBack,
      {int expireDay = 0}) {
    return UIUtils.showPopVip(
      context,
      SizedBox(
        child: WenanAppVipBuyView(cancelCallBack, confirmCallBack, expireDay),
      ),
      PageRouter.VipBuyView,
    );
  }
  static Future showFirstRechargeModal(BuildContext context, int fromType) {
    return UIUtils.showPopVip(
      context,
      SizedBox(
        // height: MediaQuery.of(context).size.height * 0.8,
        height: 560,
        child: FirstRechargePage(
          fromType: fromType,
        ),
      ),
      PageRouter.FirstChargePopupPage,
    );
  }


  static void showCallHangUp(BuildContext context, VoidCallback hangup) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height * 0.7,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: ImageLoader.loadLocalImage(
                    "call/wHe9nma8no_jrMeGs0_ecma4lall_ohoafnmgUuhpn_EbSg4",
                    width: MediaQuery.of(context).size.width - 40,
                    height: 452,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 8,
                  child: ImageLoader.loadLocalImage(
                    "call/wseanQaknb_yrqeNsY_hcLa8lJlF_OhtaOnLgru9pr_YtuoLpWpQixn6gz",
                    width: 320,
                    height: 332,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Text(
                            StringTranslate.e2z(AppLocalizations.of(context)!
                                .wenan_string_hang_up_text),
                            style: AppTextStyle.style(
                              color: const Color(0xFFF8FF5E),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        AppGap.vGap26,
                        Tapped(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: 220,
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.white,
                            ),
                            child: Center(
                              child: Text(
                                StringTranslate.e2z(
                                    AppLocalizations.of(context)!
                                        .wenan_string_hang_up_cancel),
                                style: AppTextStyle.style(
                                  color: Color(0xFF7132FF),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                        ),
                        AppGap.vGap12,
                        Tapped(
                          onTap: hangup,
                          child: Container(
                            width: 220,
                            height: 40,
                            color: AppColor.transparent,
                            child: Center(
                              child: Text(
                                StringTranslate.e2z(Application
                                    .appLocalizations!
                                    .wenan_string_hang_up_confirm),
                                style: AppTextStyle.white16,
                              ),
                            ),
                          ),
                        ),
                        AppGap.vGap5,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future showChatListTipDlg(BuildContext context) {
    return UIUtils.showPopVip(
      context,
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 56,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24), color:AppColor.white),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text( StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_tips) ,textAlign: TextAlign.center,
                  style: AppTextStyle.style(color: const Color(0xFF333333), fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Text(StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_im_tips),
                  textAlign: TextAlign.center, style: AppTextStyle.style(color: const Color(0xFF666666), fontSize: 16)),
              const SizedBox(height: 24),
              GestureDetector(
                onTap:() {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 220,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color(0xFF8430F3),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    StringTranslate.e2z(
                        Application.appLocalizations!.wenan_string_confirm),
                    style: AppTextStyle.white16Bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      PageRouter.ChatListTip,
    );
  }
}
