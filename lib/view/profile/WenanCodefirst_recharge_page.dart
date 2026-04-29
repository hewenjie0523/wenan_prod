import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:tapped/tapped.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/viewmodel/WenanCodepay_vm_provider.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';

final popProvider = FutureProvider.autoDispose<List<PaymentOption>>((ref) => ref.read(payModel).getFirstRechargeList());

class FirstRechargePage extends ConsumerWidget {
  int fromType;

  List<PaymentOption> pays = [];
  final bool isAr = Application.isARLanguage();

  FirstRechargePage({Key? key, this.fromType = PayFromType.FROM_FIRST_CHARGE_FLOAT}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var balanceList = ref.watch(popProvider).value;
    if (!Utils.isEmptyList(balanceList)) {
      pays.clear();
      pays.addAll(balanceList!);
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 40,
          height: 560,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              _backgroundWidget(),
              _topImageWidget(),
              Positioned(
                top: 90,
                left: 16,
                right: 16,
                bottom: 0,
                child: Container(
                  color: AppColor.transparent,
                  padding: const EdgeInsets.fromLTRB(4, 200, 4, 24),
                  child: _listWidget(context, ref),
                ),
              ),
              _firstRechargeCard(context, balanceList, ref),
              _coinsListView(context),
              _goBackButton(context)
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  _backgroundWidget() {
    return Positioned(
        top: 60,
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          height: 530,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: AppColor.white),
        ));
  }

  _topImageWidget() {
    return Positioned(
      top: 0,
      child: IgnorePointer(
        child: ImageLoader.loadLocalImage(
          "me/w4emnXatnw_UryetsK_pb8aZlKacnUc3eL_KmxoNdLaglh_gttohpKpVilnTgQ",
          width: 117,
          height: 117,
        ),
      ),
    );
  }

  _firstRechargeCard(BuildContext context, List balanceList, WidgetRef ref) {
    return Positioned(
      top: 180,
      left: 20,
      right: 20,
      child: UIUtils.firstRechargeItem(context, balanceList[0], payEvent: () {
        DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_FIRST_RECHARGE_ITEM, 1);
        payEvent(context, balanceList[0], ref, fromType);
      }),
    );
  }

  _goBackButton(BuildContext context) {
    bool isAr = Application.isARLanguage();
    return Positioned(
      right: isAr ? null : 20,
      left: isAr ? 20 : null,
      top: 80,
      child: GestureDetector(
        onTap: () => FluroRouter.appRouter.pop(context),
        child: Container(
          child: ImageLoader.loadLocalImage("profile/w4eLn3avnL_yryeGsd_PpYoKpe_JdHizaulqoYgk_7cklAoJs0eB_HbMlRaFclku", height: 36, width: 36),
        ),
      ),
    );
  }

  _coinsListView(BuildContext context) {
    return Positioned(
      top: 120,
      left: 16,
      right: 16,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_recharge_title),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7641D3),
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_recharge_desc),
            style: const TextStyle(
              fontSize: 9,
              color: AppColor.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ],
      ),
    );
  }

  _listWidget(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        height: 8,
        color: AppColor.transparent,
      ),
      padding: const EdgeInsets.all(0),
      itemCount: pays.length,
      itemBuilder: (context, index) {
        var data = pays[index];
        return _itemView(context, data, ref);
      },
    );
  }

  void payEvent(BuildContext context, PaymentOption data, WidgetRef ref, int fromType) {
    PageRouter.startPayHandlerPage(context, data, fromType);
  }

  _itemView(BuildContext context, PaymentOption data, WidgetRef ref) {
    return data.isFirstRecharge
        ? Container()
        : Container(
            height: 74,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(22), color: AppColor.black_05p),
            child: Stack(
              children: [
                Positioned(
                  top: 4,
                  left: 4,
                  right: 4,
                  child: UIUtils.modalRechargeItem(context, data, payEvent: () {
                    payEvent(context, data, ref, fromType);
                  }),
                ),
                Positioned(
                  left: isAr ? null : 0,
                  right: isAr ? 0 : null,
                  top: 0,
                  child: Visibility(
                    visible: data.showDiscount && !data.isBestOffer,
                    child: UIUtils.coinDiscountItem(data, width: 36, height: 36),
                  ),
                ),
                Positioned(
                  left: isAr ? null : 0,
                  right: isAr ? 0 : null,
                  top: 0,
                  child: Visibility(
                    visible: data.isBestOffer,
                    child: UIUtils.coinDiscountItem(data, width: 36, height: 36),
                  ),
                ),
              ],
            ),
          );
  }
}
