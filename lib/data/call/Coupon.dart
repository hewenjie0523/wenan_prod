

import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

import '../../utils/WenanCodeutils.dart';
part 'Coupon.g.dart';


class Coupon {
  Coupon();
  
  int id = -404;
  
  int uid = -404;
  
  int coupon_id = -404;
  
  int chat_duration = -404;
  
  int diamond_amount = -404;
  
  int vip_duration = -404;
  
  int status = -404;

  factory Coupon.fromJson(Map<String, dynamic> json) => _$CouponFromJson(json);

  Map<String, dynamic> toJson() => _$CouponToJson(this);

  static int _dynamicToInt(dynamic number) => Utils.parseInt(number) ?? -404;
}