import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

import '../../utils/WenanCodelog.dart';
import 'Coupon.dart';

part 'CouponResp.g.dart';


class CouponResp {
  CouponResp();

  
  List<Coupon>? coupons;

  ///有可领取体验卡
  Coupon? availableCoupon() {
    try {
      // return coupons?[0];
      return coupons?.firstWhere((element) => element.status == -1);
    } catch (e) {
      return null;
    }
  }

  ///有可使用的体验卡
  bool hasCoupon() {
    return coupons?.any((element) => element.status == 0) ?? false;
  }

  ///可用体验卡总金额
  int couponTotalValue() {
    var total = 0;
    coupons?.where((element) => element.status == 0).forEach((element) {
      total += element.diamond_amount;
    });
    AuvChatLog.d("couponTotalValue total:$total", tag: "CouponResp");
    return total;
  }

  factory CouponResp.fromJson(Map<String, dynamic> json) => _$CouponRespFromJson(json);

  Map<String, dynamic> toJson() => _$CouponRespToJson(this);
}
