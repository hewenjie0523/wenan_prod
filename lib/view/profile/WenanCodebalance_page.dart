import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/view/profile/WenanCodefirst_recharge_page.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:wenan/view/profile/view/NaneBalanceHeadCoinsView.dart';
import 'package:wenan/view/widgets/WenanCodeAuvNavBar.dart';
import '../../res/WenanCodecolors.dart';
import '../../utils/WenanCodeutils.dart';
import '../../viewmodel/WenanCodepay_vm_provider.dart';
import '../match/discover/gift/WenanCodeGiftPage.dart';
import 'package:wenan/base/WenanCodeApplication.dart';

final balanceProvider = FutureProvider.autoDispose<List<PaymentOption>>(
    (ref) => ref.read(payModel).getBalanceList());

class BalancePage extends ConsumerWidget {
  int fromType;
  List<PaymentOption> pays = [];
  final bool isAr = Application.isARLanguage();

  BalancePage({Key? key, this.fromType = PayFromType.FROM_ME_COINS})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColor.white,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AuvCupertinoNavigationBar(
        backgroundColor: AppColor.transparent,
        border: null,
        padding: const EdgeInsetsDirectional.only(
          top: 10,
        ),
        leading: UIUtils.navigationCommonBackButton(
          () {
            FluroRouter.appRouter.pop(context);
          },
          color: AppColor.white,
        ),
        // trailing: UIUtils.navigationCommonMoreButton(
        //   () {
        //     FluroRouter.appRouter.pop(context);
        //   },
        // ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 280,
              child: ImageLoader.loadLocalImage('me/wteEnpannQ_grueEss_LbaaKldaenbcOed_dtLompT_mbAgC'),
            ),
          ),
          Positioned(
            top: 120,
            left: 16,
            right: 16,
            child: _myCoinsView(context, ref),
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
                color: AppColor.white
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 274,
            child: _firstRechargeView(context, ref),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 394,
            bottom: 24,
            child: _balanceGroup(context, ref),
          )
        ],
      ),
    );
  }

  Widget _balanceGroup(BuildContext context, WidgetRef ref) {
    var balanceList = ref.watch(balanceProvider).value;
    PaymentOption? maxData;
    if (!Utils.isEmptyList(balanceList)) {
      pays.clear();
      pays.addAll(balanceList!);
      maxData = pays.reduce((value, element) => element);
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        height: 2,
        color: AppColor.transparent,
      ),
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, index) {
        var data = pays[index];
        return _balanceItemView(
            context, data, data.id == maxData?.id, ref, index);
      },
      itemCount: pays.length,
    );
  }

  Widget _firstRechargeView(BuildContext context, WidgetRef ref) {
    PaymentOption firstRechargeData;
    var popList = ref.watch(popProvider).value;
    if (!Utils.isEmptyList(popList)) {
      var firstRechargeList =
          popList!.where((element) => element.isFirstRecharge).toList();
      if (!Utils.isEmptyList(firstRechargeList)) {
        firstRechargeData = firstRechargeList[0];
        return Container(
          height: 120,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: UIUtils.firstRechargeItem(context, firstRechargeData,
              payEvent: () {
            payEvent(context, firstRechargeData, ref, fromType);
          }),
        );
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }
  Widget _balanceItemView(BuildContext context, PaymentOption? data, bool max,
      WidgetRef ref, int index) {
    if (data == null) return Container();

    Widget body = Container(
      height: 92,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: UIUtils.balanceItem(context, data, isMax: max, index: index,
                payEvent: () {
                  payEvent(context, data, ref, fromType);
                }),
          ),
          Positioned(
            left: isAr ? null : 0,
            right: isAr ? 0 : null,
            top: 0,
            child: Visibility(
                visible: data.showDiscount && !data.isBestOffer,
                child: UIUtils.coinDiscountItem(data)),
          ),
          Positioned(
            left: isAr ? null : 0,
            right: isAr ? 0 : null,
            top: 0,
            child: Visibility(
              visible: data.isBestOffer,
              child: UIUtils.coinDiscountItem(data),
            ),
          ),
        ],
      ),
    );
    return body;
  }

  Widget _myCoinsView(BuildContext context, WidgetRef ref) {
    var coins = ref.watch(currUserCoins).value;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 152,
          height: 160,
          child: ImageLoader.loadLocalImage('me/wEeZnYagn1_kr3eKsZ_mbJanlkaQnPcXeb_HtCoFpN_LiPcsoqn7'),
        ),
        NaneBalanceHeadCoinsView("${Utils.parseDouble(coins)?.toInt() ?? 0}")
      ],
    );
  }

  void payEvent(
      BuildContext context, PaymentOption data, WidgetRef ref, int fromType) {
    PageRouter.startPayHandlerPage(context, data, fromType);
  }
}
