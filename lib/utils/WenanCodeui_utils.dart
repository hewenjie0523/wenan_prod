import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/data/user/CommonUserOnlineStatus.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:tapped/tapped.dart';
import 'package:wenan/view/WenanCodeUserOSView.dart';

import '../base/WenanCodeApplication.dart';
import '../res/WenanCodedimens.dart';
import 'package:wenan/StringTranslate.dart';

class UIUtils {
  static CupertinoButton navigationCommonBackButton(
    VoidCallback onPressed, {
    Color color = AppColor.white,
    double leftPadding = 16,
    double rightPadding = 16,
  }) {
    return CupertinoButton(
      padding: EdgeInsets.fromLTRB(leftPadding, 10, rightPadding, 10),
      onPressed: onPressed,
      child: ImageLoader.loadLocalImage(
        Application.isARLanguage() ? "wpeYnxarnF_urKeksa_ciycw_rbla2cOkS_Rwl_SmYeo" : "wBeinDaDnW_mrQe5sX_siScP_yb7aWcJkW_twi",
        width: 24,
        height: 24,
        color: color,
      ),
    );
  }

  static Text navigationTitle(
    String title, {
    Color color = AppColor.b1a,
    double fontSize = 17.0,
  }) {
    return Text(
      title,
      style: AppTextStyle.style(
        color: color,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static Widget roundBackgroundButton({
    required String title,
    Color titleColor = AppColor.white,
    double titleFontSize = 12.0,
    FontWeight fontWeight = FontWeight.w500,
    Widget? titleWidget,
    Color backgroundColor = AppColor.color_5a5ada,
    VoidCallback? onPressed,
    double width = 56.0,
    double height = 28.0,
    EdgeInsets padding = const EdgeInsets.all(0.0),
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: CupertinoButton(
        minSize: height,
        borderRadius: BorderRadius.circular(height / 2),
        color: backgroundColor,
        disabledColor: backgroundColor.withAlpha(128),
        padding: padding,
        onPressed: onPressed,
        child: titleWidget ??
            Text(
              title,
              style: AppTextStyle.style(
                color: titleColor,
                fontSize: titleFontSize,
                fontWeight: fontWeight,
              ),
            ),
      ),
    );
  }

  static Size calculateTextSize(
    String value, {
    required BuildContext buildContext,
    TextStyle? style,
    double maxWidth = double.infinity,
    int maxLines = 1,
  }) {
    TextPainter painter = TextPainter(
        // 华为手机如果不指定locale的时候，该方法算出来的文字高度是比系统计算偏小的。
        locale: Localizations.localeOf(buildContext),
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        text: TextSpan(text: value, style: style));
    painter.layout(maxWidth: maxWidth);
    return painter.size;
  }

  static userInfoWidget(CommonUser user,
      {Color backgroundColor = AppColor.color15ABFF, EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 8)}) {
    return Container(
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      padding: padding,
      constraints: const BoxConstraints(minWidth: 60),
      child: userInfoWidgetWRow(user),
    );
  }

  static Row userInfoWidgetWRow(CommonUser user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageLoader.loadLocalImage(user.gender == 1 ? "login/wMeqnaafnv_2roexsU_5moa1lSe1_XiAcvoInZ" : "login/wSeFnfaVn4_wrTeFsk_UfveLmxaalLeu_6i0c5o2ny",
            width: 12, height: 12),
        AppGap.hGap2,
        // Text(
        //   "${user.getAge()},",
        //   style: AppTextStyle.white12,
        // ),
        // AppGap.hGap2,
        Visibility(
          visible: user.getCountry() != null,
          child: ImageLoader.loadOvalImage(user.getCountry()?.icon ?? "", width: 12, height: 12),
        ),
        AppGap.hGap2,
        Visibility(
            visible: user.getCountry() != null,
            child: maxWidthText(
                Text(
                  user.getCountry()?.name ?? "",
                  style: AppTextStyle.white12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                80)),
      ],
    );
  }

  static commonIconTextWidget(
    Widget icon,
    double radios,
    Color backgroundColor,
    Widget text, {
    double height = 24,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radios),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      constraints: const BoxConstraints(minWidth: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon, AppGap.hGap2, text],
      ),
    );
  }

  static profileFunctionWidget(
    Widget icon,
    Widget titleWidget,
    double radios,
    Color backgroundColor,
    Widget endIcon, {
    double height = 64,
    Widget? descWidget,
    VoidCallback? onPressed,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radios),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkResponse(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [icon, AppGap.hGap22, titleWidget],
            ),
            Row(
              children: [
                Visibility(visible: descWidget != null, child: descWidget ?? Container()),
                AppGap.hGap12,
                endIcon,
              ],
            ),
          ],
        ),
      ),
    );
  }

  static settingItemWidget(
    Widget titleWidget, {
    double radios = 20,
    double height = 56,
    Color backgroundColor = AppColor.white_20p,
    Widget? descWidget,
    Widget? endIcon,
    VoidCallback? onPressed,
    double left = 16.0,
    double right = 16.0,
  }) {
    return Container(
      height: height,
      margin: EdgeInsets.only(left: left, right: right, top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radios),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkResponse(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleWidget,
            Row(
              children: [
                Visibility(visible: descWidget != null, child: descWidget ?? Container()),
                Visibility(
                    visible: endIcon != null,
                    child: Container(
                      margin: const EdgeInsets.only(left: 12),
                      child: endIcon ?? Container(),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static profileItemWidget(
    Widget titleWidget, {
    double radios = 12,
    double height = 64,
    Color backgroundColor = AppColor.white_20p,
    Widget? descWidget,
    Widget? endIcon,
    Widget? startIcon,
    VoidCallback? onPressed,
    double left = 16.0,
    double right = 16.0,
  }) {
    var startIconWidget = startIcon == null
        ? titleWidget
        : Row(
            children: [
              startIcon,
              AppGap.hGap15,
              titleWidget,
            ],
          );
    return Container(
      height: height,
      margin: EdgeInsets.only(left: left, right: right, top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radios),
        color: backgroundColor,
        // border: Border.all(color: const Color(0xFFF0F0F0), width: 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkResponse(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            startIconWidget,
            Row(
              children: [
                Visibility(visible: descWidget != null, child: descWidget ?? Container()),
                AppGap.hGap12,
                Visibility(
                    visible: endIcon != null,
                    child: Container(
                      child: endIcon ?? Container(),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static commonButton(String text, double radios, VoidCallback? onPressed,
      {Color buttonColor = AppColor.colorFFF616, TextStyle style = AppTextStyle.TextB1_16_Middle, double width = 260}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(width, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radios),
        ),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  static void showTipBottomDialog(BuildContext context, String title, Widget mainWidget, String pageName) {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColor.transparent,
        isScrollControlled: true,
        // useRootNavigator: true,
        routeSettings: RouteSettings(name: pageName),
        builder: (context) {
          Widget childWidget = Container(
              decoration: const BoxDecoration(
                  color: Color(0xFF635BFF), borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: AppColor.transparent,
                    highlightColor: AppColor.transparent,
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                      child: ImageLoader.loadLocalImage("profile/wXeYn2aPnF_urVetsF_cadrXrHodwK_odXoBwank_oiGcPobnx", width: 40, height: 10),
                    ),
                  ),
                  Text(
                    title,
                    style: AppTextStyle.white18Bold,
                  ),
                  mainWidget
                ],
              ));
          return AnimatedPadding(
              padding: EdgeInsets.only(
                // 下面这一行是重点
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              duration: Duration.zero,
              child: childWidget);
        });
  }

  static void showBottomDialog(BuildContext context, String title, Widget mainWidget, String pageName) {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColor.transparent,
        isScrollControlled: true,
        // useRootNavigator: true,
        routeSettings: RouteSettings(name: pageName),
        builder: (context) {
          Widget childWidget = Container(
              decoration: const BoxDecoration(
                  color: AppColor.color1E294F, borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: AppColor.transparent,
                    highlightColor: AppColor.transparent,
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                      child: ImageLoader.loadLocalImage("profile/wXeYn2aPnF_urVetsF_cadrXrHodwK_odXoBwank_oiGcPobnx", width: 40, height: 10),
                    ),
                  ),
                  Text(
                    title,
                    style: AppTextStyle.white18Bold,
                  ),
                  mainWidget
                ],
              ));
          return AnimatedPadding(
              padding: EdgeInsets.only(
                // 下面这一行是重点
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              duration: Duration.zero,
              child: childWidget);
        });
  }

  static editUserInfoRow(String title, String desc, String localHead, VoidCallback callback,
      {bool isLast = false,
      bool isMore = true,
      Color backgroundColor = AppColor.color15ABFF,
      EdgeInsetsGeometry padding = const EdgeInsets.symmetric(horizontal: 8)}) {
    Widget child = SizedBox(
      height: 60,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ImageLoader.loadLocalImage(localHead, width: 18, height: 18),
                    AppGap.hGap8,
                    Text(
                      title,
                      style: AppTextStyle.white16_60p,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 150,
                      ),
                      child: Text(
                        desc,
                        style: AppTextStyle.white16,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    AppGap.hGap8,
                    isMore
                        ? ImageLoader.loadLocalImage(
                            Application.isARLanguage()
                                ? "profile/w1eDnGatn0_irneVsd_3asr7rzo1wM_xeUnbdV_RmaeY_4iRc8oGnB"
                                : "profile/w7eVnKaXnV_4r0e3sw_VaIr4rroYwd_ZeEnNd0_gi6cmopn0",
                            width: 12,
                            height: 12)
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
              visible: !isLast,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AppGap.lineH1p2_white10p,
              ))
        ],
      ),
    );

    return InkWell(
      splashColor: AppColor.transparent,
      highlightColor: AppColor.transparent,
      onTap: callback,
      child: child,
    );
  }

  static balanceItem(BuildContext context, PaymentOption data, {bool isMax = false, int index = 0, VoidCallback? payEvent}) {
    return Tapped(
      onTap: payEvent,
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: isMax ? null : AppColor.black_05p,
                  gradient: isMax
                      ? const LinearGradient(
                          begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Color(0xFFCB32FF), Color(0xFFFF4464), Color(0xFFFFCA32)])
                      : null),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      isMax
                          ? ImageLoader.loadLocalImage(
                              "me/wrewnjaynl_WrWeUsg_HbzaHlra5nEcEet_Sb4iVg7_VcNo8iwnl_6iechoPnL",
                              width: 67,
                              height: 48,
                              fit: BoxFit.contain,
                            )
                          : ImageLoader.loadLocalImage(
                              "me/waeEntaJnF_8rlehso_xmceY_PcKo1iZni_giuceoXn0",
                              width: 36,
                              height: 36,
                              fit: BoxFit.contain,
                            ),
                      AppGap.hGap8,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${data.name}",
                            style: AppTextStyle.style(
                              fontSize: 24,
                              color: isMax ? AppColor.white : AppColor.black,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Visibility(
                                  visible: data.extra_value > 0,
                                  child: Text(
                                    "+${data.extra_value.toInt()} ",
                                    style: isMax ? AppTextStyle.white12 : AppTextStyle.TextB1_12,
                                  )),
                              Text(
                                StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_coins),
                                style: isMax ? AppTextStyle.white12 : AppTextStyle.TextB1_12,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isMax ? AppColor.white : const Color(0xFFFFEC1C),
                          gradient: isMax ? null : UIUtils.mainGradient()),
                      child: Center(
                        child: Text(
                          data.priceStr,
                          style: AppTextStyle.style(fontSize: 16, color: isMax ? const Color(0xFFA367EB) : AppColor.white),
                          textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static balancecoinDiscountItem(
    PaymentOption data, {
    double width = 40,
    double height = 40,
  }) {
    bool isAr = Application.isARLanguage();
    String title = "";
    String desc = "";
    if (data.isBestOffer) {
      title = "Best";
      desc = "Offer";
    } else if (data.showDiscount) {
      title = data.discountStr;
      desc = "OFF";
    }
    return Container(
      width: 86,
      height: 22,
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: isAr
              ? const BorderRadius.only(
                  topRight: Radius.circular(22),
                  bottomLeft: Radius.circular(22),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                )),
      child: Center(
        child: Text(
          '$title $desc',
          style: AppTextStyle.style(
            fontSize: AppDimen.font_sp12,
            color: AppColor.color_FF326A,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static coinDiscountItem(
    PaymentOption data, {
    double width = 40,
    double height = 40,
  }) {
    String title = "";
    String desc = "";
    if (data.isBestOffer) {
      title = "Best";
      desc = "Offer";
    } else if (data.showDiscount) {
      title = data.discountStr;
      desc = "OFF";
    }
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          ImageLoader.loadLocalImage(
            "me/wceJncaSnx_IrSemsG_ZrTe9c7hSaKrTg8eF_kdXiKs8cioPuEn9t4_0ijcDoQn8",
            width: width,
            height: height,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyle.style(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                  ),
                ),
                Text(
                  desc,
                  style: AppTextStyle.style(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  static firstRechargeItem(BuildContext context, PaymentOption data, {bool isMax = false, VoidCallback? payEvent}) {
    return Tapped(
      onTap: payEvent,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomRight, colors: [Color(0xFF4FFFAF), Color(0xFFE9FF29)]),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppGap.hGap20,
            ImageLoader.loadLocalImage(
              'profile/wDe6nLacne_frBeQsC_vfQiOrasWtp_arLe4cqhcaxgveo_tcToJiLnI',
              width: 72,
              height: 71,
            ),
            AppGap.hGap10,
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${data.name}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColor.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ImageLoader.loadLocalImage(
                          "me/waeEntaJnF_8rlehso_xmceY_PcKo1iZni_giuceoXn0",
                          width: 18,
                          height: 18,
                        )
                      ],
                    ),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(28), gradient: UIUtils.mainGradient()),
                      child: Center(
                        child: Text(
                          data.priceStr,
                          style: AppTextStyle.white14,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                AppGap.vGap8,
                Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(13), color: const Color(0xFFFF578B)),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_first_purchase_desc),
                      style: AppTextStyle.style(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                      ),
                      textAlign: TextAlign.center,
                    ))
              ],
            )),
            AppGap.hGap16,
          ],
        ),
      ),
    );
  }

  static modalRechargeItem(BuildContext context, PaymentOption data, {bool isMax = false, VoidCallback? payEvent}) {
    return Tapped(
        onTap: payEvent,
        child: Container(
          height: 64,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: AppColor.white_20p),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppGap.hGap4,
                  ImageLoader.loadLocalImage(
                    "me/waeEntaJnF_8rlehso_xmceY_PcKo1iZni_giuceoXn0",
                    width: 36,
                    height: 36,
                    fit: BoxFit.contain,
                  ),
                  AppGap.hGap8,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${data.name}",
                        style: AppTextStyle.style(
                          fontSize: 24,
                          color: AppColor.black,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Visibility(
                              visible: data.extra_value > 0,
                              child: Text(
                                "+${data.extra_value.toInt()} ",
                                style: AppTextStyle.black12,
                              )),
                          Text(
                            StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_coins),
                            style: AppTextStyle.black12,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Container(
                  width: 86,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: UIUtils.mainGradient(),
                  ),
                  child: Center(
                    child: Text(
                      data.priceStr,
                      style: AppTextStyle.style(
                        fontSize: AppDimen.font_sp14,
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppText.fontFamily,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ))
            ],
          ),
        ));
  }

  static vipMainDiscountItem(PaymentOption data) {
    String title = "";
    String desc = "";
    if (data.isBestOffer) {
      title = "Best";
      desc = "Offer";
    } else if (data.showDiscount) {
      title = data.discountStr;
      desc = "OFF";
    }
    return Container(
      width: 72,
      height: 22,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100), topRight: Radius.circular(100)),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(0xFFFF8AD4),
              Color(0xFFFF8AD4),
              Color(0xFFFFFFFF),
            ],
          )),
      child: Center(
        child: Text(
          '$title $desc',
          style: AppTextStyle.style(
            fontSize: AppDimen.font_sp12,
            color: Color(0xFFFF326A),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static discountItem(PaymentOption data) {
    String title = "";
    String desc = "";
    if (data.isBestOffer) {
      title = "Best";
      desc = "Offer";
    } else if (data.showDiscount) {
      title = data.discountStr;
      desc = "OFF";
    }
    return SizedBox(
      height: 40,
      width: 40,
      child: Stack(
        children: [
          ImageLoader.loadLocalImage("me/wceJncaSnx_IrSemsG_ZrTe9c7hSaKrTg8eF_kdXiKs8cioPuEn9t4_0ijcDoQn8", width: 40, height: 40),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyle.white12,
                ),
                Text(
                  desc,
                  style: AppTextStyle.white8,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static Future showBottomVip(BuildContext context, Widget mainWidget, String pageName) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: AppColor.transparent,
        routeSettings: RouteSettings(name: pageName),
        isScrollControlled: true,
        useSafeArea: true,
        builder: (context) {
          return mainWidget;
        });
  }

  static onlineStatusWidget(BuildContext context, int uid) {
    return UserOnlineStatusView(uid: uid, showText: true);
  }

  static Widget maxWidthText(Text text, double maxWidth, {double? minWidth}) {
    return Container(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0,
        maxWidth: maxWidth,
      ),
      child: text,
    );
  }

  static Future showPopVip(BuildContext context, Widget mainWidget, String pageName) {
    return showDialog(
        context: context,
        routeSettings: RouteSettings(name: pageName),
        builder: (context) {
          return mainWidget;
        });
  }

  static LinearGradient mainGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF6DAAFF), Color(0xFF3933DF)],
    );
  }

  static LinearGradient subGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomRight,
      colors: [Color(0xFF4FFFAF), Color(0xFFE9FF29)],
    );
  }

  static LinearGradient bgGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFFACFFAA), Color(0xFFFFFFFF)],
    );
  }

  static LinearGradient bottomGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.center,
      colors: [Color(0x001D002A), Color(0xFF1D002A)],
    );
  }

  static Container userCountryWidget(CommonUser user) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: AppColor.black_40p,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: user.getCountry() != null,
            child: ImageLoader.loadOvalImage(user.getCountry()?.icon ?? "", width: 14, height: 14),
          ),
          AppGap.hGap4,
          Visibility(
            visible: user.getCountry() != null,
            child: maxWidthText(
                Text(
                  user.getCountry()?.name ?? "",
                  style: AppTextStyle.white12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                80),
          ),
        ],
      ),
    );
  }

  static ShaderMask gradientText(Text text) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return UIUtils.mainGradient().createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: text,
    );
  }
}

class TrapezoidPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    bool isAr = Application.isARLanguage();
    if (isAr) {
      path.moveTo(size.width, 0);
      path.lineTo(26, 0);
      // final rightTopRect = Rect.fromLTRB(
      //     size.width - 28 -  22 * 2, 0, size.width , 22 * 2);
      // path.arcTo(rightTopRect, 270 / 180 * pi, 90 / 180 * pi, false);
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
    } else {
      path.moveTo(0, 0);
      path.lineTo(size.width - 26, 0);
      // final rightTopRect = Rect.fromLTRB(
      //     size.width - 28 -  22 * 2, 0, size.width , 22 * 2);
      // path.arcTo(rightTopRect, 270 / 180 * pi, 90 / 180 * pi, false);
      path.lineTo(size.width, size.height);
      path.lineTo(0, size.height);
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RoundPathWidget extends StatelessWidget {
  final Widget child;
  final double leftTopRadius;
  final double rightTopRadius;
  final double leftBottomRadius;
  final double rightBottomRadius;

  final PathShapeEnum pathShape;
  final double radius;

  RoundPathWidget(
      {required this.child,
      this.radius = 0,
      this.pathShape = PathShapeEnum.CirclePath,
      this.leftTopRadius = 0,
      this.rightTopRadius = 0,
      this.leftBottomRadius = 0,
      this.rightBottomRadius = 0});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: RoundPathClipper(
          leftTopRadius: leftTopRadius,
          rightTopRadius: rightTopRadius,
          leftBottomRadius: leftBottomRadius,
          rightBottomRadius: rightBottomRadius,
          pathShape: pathShape,
          radius: radius),
      child: child,
    );
  }
}

enum PathShapeEnum { CirclePath, RoundRect, PartRoundRect }

class RoundPathClipper extends CustomClipper<Path> {
  final double leftTopRadius;
  final double rightTopRadius;
  final double leftBottomRadius;
  final double rightBottomRadius;

  final PathShapeEnum pathShape;
  final double radius;

  RoundPathClipper(
      {required this.pathShape,
      required this.radius,
      required this.leftTopRadius,
      required this.rightTopRadius,
      required this.leftBottomRadius,
      required this.rightBottomRadius});

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    final path = Path();

    if (PathShapeEnum.CirclePath == pathShape) {
      path.addOval(Rect.fromLTRB(0, 0, width, height));
    } else if (PathShapeEnum.RoundRect == pathShape) {
      path.addRRect(RRect.fromRectAndRadius(Rect.fromLTWH(0, 0, width, height), Radius.circular(radius)));
    } else {
      final rightTopRect = Rect.fromLTRB(width - rightTopRadius * 2, 0, width - rightTopRadius / 4, rightTopRadius);
      path.moveTo(0, 0);

      path.lineTo(width - rightTopRadius, 0);
      path.arcTo(rightTopRect, 270 / 180 * pi, 90 / 180 * pi, false);

      path.lineTo(width, height);
      path.lineTo(0, height);
      path.close();
    }
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
