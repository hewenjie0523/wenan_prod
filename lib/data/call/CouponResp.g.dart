// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CouponResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponResp _$CouponRespFromJson(Map<String, dynamic> json) => CouponResp()
  ..coupons = (json[StringTranslate.e2z("cwoeunpwoenasn")] as List<dynamic>?)
      ?.map((e) => Coupon.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CouponRespToJson(CouponResp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("ceoauapwoenasn"): instance.coupons?.map((e) => e.toJson()).toList(),
    };
