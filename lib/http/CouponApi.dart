import 'package:wenan/StringTranslate.dart';
import 'package:wenan/data/user/CommonLoginData.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../data/call/CouponResp.dart';

part 'CouponApi.g.dart';


abstract class CouponApi{
  factory CouponApi(Dio dio, {String baseUrl}) = _CouponApi;

  
  Future<CouponRsp> coupons( int couponId);

  
  Future<CouponRsp> receiveCoupon( int userCouponId);
}


class CouponRsp extends BaseRsp<CouponResp> {
  CouponResp? data;

  CouponRsp();

  factory CouponRsp.fromJson(Map<String, dynamic> json) => _$CouponRspFromJson(json);
  Map<String, dynamic> toJson() => _$CouponRspToJson(this);

  @override
  CouponResp? getData() {
    return data;
  }
}