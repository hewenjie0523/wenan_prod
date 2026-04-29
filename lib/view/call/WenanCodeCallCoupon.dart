import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/call/Coupon.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:tapped/tapped.dart';
import 'package:wenan/StringTranslate.dart';

import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodegaps.dart';
import '../../utils/WenanCodeimage_loader.dart';

class CallCoupon extends StatefulWidget {
  final Coupon _coupon;

  const CallCoupon(this._coupon, {Key? key}) : super(key: key);

  @override
  State<CallCoupon> createState() => _CallCouponState();
  static bool active = false;

  static void show(BuildContext context, Coupon coupon) {
    showDialog(
      context: context,
      barrierColor: AppColor.b1_80p,
      builder: (context) {
        return CallCoupon(coupon);
      },
    );
  }
}

class _CallCouponState extends State<CallCoupon> {
  @override
  void initState() {
    CallCoupon.active = true;
    super.initState();
  }

  @override
  void dispose() {
    CallCoupon.active = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 56,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: AppColor.white,
            border: Border.all(color: AppColor.white, width: 4)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            _couponImage(),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 14),
              child: _tipView(),
            ),
            AppGap.vGap16,
            _acceptText(),
            AppGap.vGap16,
          ],
        ),
      ),
    );
  }

  Widget _couponImage(){
    return ClipRRect(
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: ImageLoader.loadLocalImage(
        "discover/wieln8ajnO_rr6e6sI_rceolujpKopnb_UdpiUaVl0oigz_8tZoZpvp4innLg4",
        height: 211,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _tipView(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: "${widget._coupon.diamond_amount}",
          style: AppTextStyle.style(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFFF5032),
          ),
          children: [
            TextSpan(
              text: StringTranslate.e2z(Application
                  .appLocalizations!.wenan_string_coupon_desc),
              style: AppTextStyle.black16,
            )
          ]),
    );
  }

  Widget _acceptText(){
    return Tapped(
      onTap: () => FluroRouter.appRouter.pop(context),
      child: Container(
        width: 200,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: UIUtils.mainGradient()
        ),
        child: Center(
          child: Text(
            StringTranslate.e2z(Application
                .appLocalizations!.wenan_string_coupon_accept),
            style: AppTextStyle.white16Bold,
          ),
        ),
      ),
    );
  }
}
