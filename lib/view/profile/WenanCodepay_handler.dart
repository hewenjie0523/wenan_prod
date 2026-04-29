import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodePayManager.dart';
import 'package:wenan/data/PaymentMethod.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/WenanCodeSharedViewLogic.dart';
import 'package:wenan/view/match/discover/gift/WenanCodeGiftPage.dart';
import 'package:wenan/view/WenanCodehome_page.dart';
import 'package:wenan/viewmodel/WenanCodepay_vm_provider.dart';
import 'package:wenan/view/widgets/WenanCodeAuvNavBar.dart';
import 'package:tapped/tapped.dart';
import 'package:wenan/StringTranslate.dart';

final optionDetailProvider = FutureProvider.autoDispose
    .family<PaymentOption?, int>(
        (ref, optionId) => ref.read(payModel).getPaymentOptionDetail(optionId));

class PayFromType {
  //首页拨打video call
  static const int FROM_HOME_VIDEO_CALL = 1;

  //主播profile video call
  static const FROM_PROFILE_VIDEO_CALL = 2;

  //主播profile 隐私相册
  static const FROM_PROFILE_ALBUM = 3;

  //IM免费消息用完
  static const FROM_IM_NO_MORE_FREE_MSG = 4;

  //IM送礼
  static const FROM_IM_SEND_GIFT = 5;

  //IM拨打video call
  static const FROM_IM_VIDEO_CALL = 6;

  //接听video call
  static const FROM_PICK_UP_CALL = 7;

  //Me get VIP
  static const FROM_ME_GET_VIP = 8;

  //Me who like me - become VIP
  static const FROM_ME_WHO_LIKE_ME_BECOME_VIP = 9;

  //Me Coins
  static const FROM_ME_COINS = 10;

  //discover点击只有vip可查看的分区 拉起充值vip弹窗
  static const FROM_REGION = 11;

  //虚拟通话
  static const FROM_INDUCE_VIDEO = 12;

  //没钱匹配
  static const FROM_MATCHING = 13;

  //通话余额不足下一分钟 (每分钟第40秒判断)
  static const FROM_CHAT_CALL_40 = 14;

  //正常通话结束 余额不足
  static const FROM_CHAT_CALL_END = 15;

  //首页banner充值
  static const FROM_HOME_BANNER = 16;

  //转盘充值
  static const FROM_LOTTERY_ACTIVITY = 17;

  //Feed
  static const FROM_FEED = 18;

  //Feed
  static const FROM_FIRST_CHARGE_FLOAT = 19;

  //Award
  static const FROM_AWARD_CHARGE_FLOAT = 20;
}

class PayHandlerPage extends ConsumerStatefulWidget {
  final PaymentOption payOption;
  final int fromType;

  const PayHandlerPage({
    Key? key,
    required this.payOption,
    required this.fromType,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PayHandlerPageState();
  }
}

class _PayHandlerPageState extends ConsumerState<PayHandlerPage>
    with WidgetsBindingObserver {
  int selectedIndex = -1;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    AuvChatLog.d(
        "PayHandlerPage didChangeAppLifecycleState state:$state");

    switch (state) {
      case AppLifecycleState.resumed:
        PayManager.instance.batchCheckThirdPayCachedOrders(showToast: true);
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var optionDetail =
        ref.watch(optionDetailProvider(widget.payOption.id)).value ??
            widget.payOption;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: const Color(0xFF1D002A),
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          // mainScrollController: ScrollController(),
          appBar: AuvCupertinoNavigationBar(
            backgroundColor: AppColor.transparent,
            border: null,
            padding: const EdgeInsetsDirectional.only(
              top: 10,
            ),
            leading: UIUtils.navigationCommonBackButton(
              () => FluroRouter.appRouter.pop(context),
              color: AppColor.white,
            ),
            middle: Text(
              StringTranslate.e2z(
                  Application.appLocalizations!.wenan_string_pay),
              style: AppTextStyle.style(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColor.white,
              ),
            ),
          ),
          body: Stack(
            children: [
              Positioned(
                top: 96,
                left: 16,
                right: 16,
                child: _paymentOptionView(context, optionDetail),
              ),
              Positioned(
                top: 200,
                left: 24,
                right: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringTranslate.e2z(Application
                          .appLocalizations!.wenan_string_select_payment_method),
                      style: AppTextStyle.style(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white_40p,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 240,
                bottom: 80,
                left: 16,
                right: 16,
                child: Visibility(
                  visible: !Utils.isEmptyList(optionDetail.pay_mode_prices),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                      height: 8,
                      color: AppColor.transparent,
                    ),
                    padding: const EdgeInsets.all(0),
                    itemCount: optionDetail.pay_mode_prices!.length,
                    itemBuilder: (context, index) {
                      return Tapped(
                        onTap: () {
                          Utils.callSetStateSafely(this, () {
                            if (mounted) {
                              selectedIndex = index;
                            }
                          });
                        },
                        child: _buildItem(
                            context,
                            optionDetail.pay_mode_prices![index],
                            selectedIndex == index),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                left: 58,
                height: 58,
                bottom: 24,
                child: _payNowButton(optionDetail),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _payNowButton(PaymentOption optionDetail){
    return Opacity(
      opacity: selectedIndex >= 0 ? 1 : 0.4,
      child: Container(
        width: MediaQuery.of(context).size.width - 58 * 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: UIUtils.mainGradient()),
        child: CupertinoButton(
          minSize: 64,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          onPressed: selectedIndex >= 0
              ? () {
            handlePay(optionDetail,
                optionDetail.pay_mode_prices![selectedIndex]);
          }
              : null,
          child: Text(
            StringTranslate.e2z(
                Application.appLocalizations!.wenan_string_pay_now),
            style: AppTextStyle.TextWhite_16_Medium,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  _paymentOptionView(BuildContext context, PaymentOption optionDetail) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: 84,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
        color: const Color(0xFF7A00FF)
          ),
      padding: const EdgeInsets.only(left: 20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImageLoader.loadLocalImage(
                  optionDetail.isVip
                      ? "me/w3eNntaCnl_0rhegs1_6vwijpp_Wltixfhe4tCi0mheK_TixcGolnJ"
                      : "me/waeEntaJnF_8rlehso_xmceY_PcKo1iZni_giuceoXn0",
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                ),
                AppGap.hGap8,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      optionDetail.detailName ?? "",
                      style: AppTextStyle.style(
                        fontSize: 18,
                        color: AppColor.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppGap.hGap4,
                    Text(
                      optionDetail.isVip
                          ? optionDetail.unitTitle
                          : StringTranslate.e2z(Application
                          .appLocalizations!.wenan_string_coins),
                      style: AppTextStyle.white14_60p,
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 8,
            child: Visibility(
              visible: optionDetail.extra_value > 0,
              child: Container(
                height: 24,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.white),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "+${optionDetail.extra_value.toStringAsFixed(0)}",
                      style: AppTextStyle.style(
                        color: const Color(0xFFFF5390),
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AppGap.hGap2,
                    ImageLoader.loadLocalImage(
                      "me/waeEntaJnF_8rlehso_xmceY_PcKo1iZni_giuceoXn0",
                      width: 14,
                      height: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, PaymentMethod paymentMethod, bool selected) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: 84,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.white_20p,
        border: selected
            ? Border.all(width: 2, color: const Color(0xFFFF812D))
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ImageLoader.loadDefault(
                  paymentMethod.icon ?? "",
                  width: 32,
                  height: 32,
                ),
                AppGap.hGap4,
                Text(
                  paymentMethod.name ?? "",
                  style: AppTextStyle.white16,
                ),
              ],
            ),
            Text(
              paymentMethod.priceStr,
              style: AppTextStyle.white14,
            ),
          ],
        ),
      ),
    );
  }

  void handlePay(PaymentOption item, PaymentMethod paymentMethod) {
    SharedViewLogic.showLoadingDialog(context, canCancel: false);
    PayManager.instance.payOptionCommon(
        item, context, widget.fromType, paymentMethod, onSuccess: () {
      Navigator.pop(context);
      ref.refresh(currUserCoins);
      ref.refresh(commonUserNotify);
      Fluttertoast.showToast(
          msg: StringTranslate.e2z(
              Application.appLocalizations!.wenan_string_recharge_success));
    }, onFailure: (msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: msg ??
              StringTranslate.e2z(
                  Application.appLocalizations!.wenan_string_recharge_error));
    })?.then((value) {
      AuvChatLog.d("handlePay then value:$value");
      if (paymentMethod.pay_mode != 3 && paymentMethod.pay_mode != 4) {
        Navigator.pop(context);
        PayManager.instance.batchCheckThirdPayCachedOrders(showToast: true);
      }
    });
  }
}
