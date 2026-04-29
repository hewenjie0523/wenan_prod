import 'package:fluro/fluro.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/view/WenanCodeSharedViewLogic.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:tapped/tapped.dart';
import 'package:wenan/view/profile/view/NaneVipHeadView.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodegaps.dart';
import '../../res/WenanCodestyles.dart';
import '../../utils/WenanCodeimage_loader.dart';
import '../../utils/WenanCodeutils.dart';
import '../../viewmodel/WenanCodepay_vm_provider.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';

import '../widgets/WenanCodeAuvNavBar.dart';

final vipProvider = FutureProvider.autoDispose<List<PaymentOption>>(
    (ref) => ref.read(payModel).getVipList());

enum VipType { Main, Dialog }

class VipPage extends ConsumerWidget {
  List<PaymentOption> pays = [];
  final VipType type;
  int fromType;
  int expireTime = 0;

  VipPage(
      {Key? key,
      this.type = VipType.Main,
      this.fromType = PayFromType.FROM_ME_GET_VIP})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CommonUser? user = Application.commonUser;
    if (user != null) {
      expireTime = user.getVipExpireTime();
    }
    return Stack(
      children: [
        Positioned(child: Container(color: Color(0xFF1D002A),)),
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: ImageLoader.loadLocalImage('me/wheYn1aXnF_ArUersf_HvQibpm_whue2axdIefr8_BbTg0', height: 310)),
        Scaffold(
            backgroundColor: AppColor.transparent,
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            appBar: _toolBar(context),
            body: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: VipFuctionHeaderView(),
                ),
                Positioned(
                  top: 280,
                  left: 0,
                  right: 0,
                  bottom: 48,
                  child: _vipListView(context, ref),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 24,
                  child: _bottomTipText(context),
                ),
              ],
            ))
      ],
    )
      ;
  }

  _toolBar(BuildContext context){
    return AuvCupertinoNavigationBar(
      backgroundColor: AppColor.transparent,
      border: null,
      padding: const EdgeInsetsDirectional.only(
        top: 10,
      ),
      leading: UIUtils.navigationCommonBackButton(
            () {
          if (expireTime == 0) {
            SharedViewLogic.showVipBuyDlg(
              context,
                  () {
                AuvChatLog.d('showVipBuyLeaveDlg cancel');
                Navigator.of(context).pop();
                FluroRouter.appRouter.pop(context);
              },
                  () {
                AuvChatLog.d('showVipBuyLeaveDlg confirm');
                Navigator.of(context).pop();
              },
              expireDay: 0,
            );
          } else {
            FluroRouter.appRouter.pop(context);
          }
        },
        color: AppColor.white,
      ),
      middle: Text(
        StringTranslate.e2z(
            Application.appLocalizations!.wenan_string_premium),
        style: AppTextStyle.style(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColor.white,
        ),
      ),
    );
  }

  Widget _vipListView(BuildContext context, WidgetRef ref) {
    var vipList = ref.watch(vipProvider).value;
    if (!Utils.isEmptyList(vipList)) {
      pays.clear();
      pays.addAll(vipList!);
    }
    if (pays.isEmpty) {
      return const SizedBox();
    }
    Widget body = ListView.separated(
      itemBuilder: (context, index) {
        var data = pays[index];
        return _vipItemView(context, data, index, ref);
      },
      itemCount: pays.length,
      padding: const EdgeInsets.symmetric(vertical: 12),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 8,
          color: AppColor.transparent,
        );
      },
    );

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 165,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: body,
    );
  }

  _vipItemView(
      BuildContext context, PaymentOption data, int index, WidgetRef ref) {
    AuvChatLog.d("data.discountStr=${data.discountStr}");
    payCallback() {
      if (expireTime > 0) {
        SharedViewLogic.showVipBuyDlg(
          context,
          () {
            AuvChatLog.d('showVipBuyLeaveDlg cancel');
            Navigator.of(context).pop();
          },
          () {
            AuvChatLog.d('showVipBuyLeaveDlg confirm');
            payEvent(context, data, ref, fromType);
          },
          expireDay: expireTime,
        );
      } else {
        payEvent(context, data, ref, fromType);
      }
    }

    Widget body = Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned(
            child: vipListCell(context, data, payEvent: payCallback),
          ),
          Positioned(
            left: Application.isARLanguage() ? null : 0,
            right: Application.isARLanguage() ? 0 : null,
            top: 0,
            child: Visibility(
              visible: data.isBestOffer || data.showDiscount,
              child: UIUtils.coinDiscountItem(data),
            ),
          ),
        ],
      ),
    );
    return body;
  }

  void payEvent(
      BuildContext context, PaymentOption data, WidgetRef ref, int fromType) {
    PageRouter.startPayHandlerPage(context, data, fromType);
  }

  _bottomTipText(BuildContext context) {
    var normalStyle = const TextStyle(
        fontSize: 12, color: AppColor.b3, fontWeight: FontWeight.normal);
    var hightStyle = const TextStyle(
        fontSize: 12, color: Color(0xFF7641D3), fontWeight: FontWeight.w500);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: StringTranslate.e2z(
              AppLocalizations.of(context)!.wenan_string_vip_terms_text),
          style: normalStyle,
          children: [
            TextSpan(
              text: StringTranslate.e2z(AppLocalizations.of(context)!
                  .wenan_string_terms_user_agreement),
              style: hightStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  PageRouter.startWebview(context, AppConfig.userAgreement);
                },
            ),
          ]),
    );
  }

  vipListCell(BuildContext context, PaymentOption data, {VoidCallback? payEvent}) {
    return Tapped(
      onTap: payEvent,
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFCA87FF), Color(0xFF7641D3)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _vipListCellLeftView(context, data),
            _vipListCellRightView(data)
          ],
        ),
      ),
    );
  }

  _vipListCellLeftView(BuildContext context, PaymentOption data){
    bool isAR = Application.isARLanguage();
    return Stack(
      children: [
        data.isLifetime ?
        ImageLoader.loadLocalImage(
          isAR ? "me/woeDnRaBne_FrLeWsR_tvCi4p5_6lsirfTe0t8iombed_Ub2gO_VawrC" : "me/wvetnlaenh_drxemsj_TvWivpO_jl9ivfzeQtriJmQee_kbGgR",
          width: 78,
          height: 77,
          fit: BoxFit.contain,
        ):SizedBox(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            data.isLifetime ?
            SizedBox(width: 12,):
            Container(
              margin : EdgeInsets.only(left: 12),
              width: 48,
              alignment: Alignment.center,
              child: Text(
                "${data.name_amount}",
                style: AppTextStyle.style(
                    color: AppColor.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
            ),
            AppGap.hGap8,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.isLifetime
                      ? StringTranslate.e2z(AppLocalizations.of(context)!
                      .wenan_string_lifetime)
                      : data.unitTitle,
                  style: AppTextStyle.style(
                      color: data.isLifetime
                          ? AppColor.white
                          : AppColor.white,
                      fontFamily: AppText.fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize:data.isLifetime ? 24 : 16),
                ),
                Visibility(
                  visible: data.extra_value > 0,
                  child: Container(
                    height: 20,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "+${data.extra_value.toInt()}",
                          style: AppTextStyle.style(
                              color: AppColor.white,
                              fontFamily: AppText.fontFamily,
                              fontSize: 12),
                        ),
                        AppGap.hGap2,
                        Text(
                          StringTranslate.e2z(AppLocalizations.of(context)!
                              .wenan_string_coins),
                          style: AppTextStyle.style(
                              color: AppColor.white,
                              fontFamily: AppText.fontFamily,
                              fontSize: 12),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  _vipListCellRightView(PaymentOption data){
    return Container(
      constraints: const BoxConstraints(maxWidth: 120),
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          data.priceStr,
          style: AppTextStyle.style(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
