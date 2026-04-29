
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/StringTranslate.dart';
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

final vipProvider = FutureProvider.autoDispose<List<PaymentOption>>(
    (ref) => ref.read(payModel).getVipList());

class VipPopPage extends ConsumerWidget {
  List<PaymentOption> pays = [];
  int fromType;
  int expireTime = 0;

  VipPopPage({Key? key, this.fromType = PayFromType.FROM_ME_GET_VIP})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CommonUser? user = Application.commonUser;
    if (user != null) {
      expireTime = user.getVipExpireTime();
    }
    return Center(
      child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          height: 560,
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFF1D002A),
                borderRadius: BorderRadius.circular(40),
                border: Border.all(color: AppColor.white, width: 8)),
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
                      child: ImageLoader.loadLocalImage(
                          'me/wbednTaEnY_qrdeKso_MvQixpD_vpMocp6_XhNeOaSdPerrd_ablgj',
                          height: 265),
                    )),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: VipFuctionHeaderView(height: 200),
                ),
                Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  bottom: 24,
                  child: _vipListView(context, ref),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: Tapped(
                    onTap: () => FluroRouter.appRouter.pop(context),
                    child: ImageLoader.loadLocalImage(
                      "profile/w3e5nfaJne_QrIeSsj_bpdoGpw_Hduiea8laoqgt_ZcOl2oxsSeB",
                      width: 30,
                      height: 30,
                    ),
                  ),
                )
              ],
            ),
          )),
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
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Stack(
        children: [
          Positioned(
            child: _vipItemInfoWidget(context, data, payEvent: payCallback),
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

  _vipListCellInfoWidget(BuildContext context, PaymentOption data){
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


  _vipItemInfoWidget(BuildContext context, PaymentOption data,
      {VoidCallback? payEvent}) {
    return Tapped(
      onTap: payEvent,
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient:const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFCA87FF),
                    Color(0xFF7641D3)
                  ],
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _vipListCellInfoWidget(context, data),
            _vipCellPriceText(data)
          ],
        ),
      ),
    );
  }

  _vipCellPriceText(PaymentOption data){
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

  void payEvent(
      BuildContext context, PaymentOption data, WidgetRef ref, int fromType) {
    PageRouter.startPayHandlerPage(context, data, fromType);
  }

}
