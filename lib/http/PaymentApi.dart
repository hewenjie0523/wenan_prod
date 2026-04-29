import 'package:wenan/StringTranslate.dart';
import 'package:wenan/data/BaseRsp.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/data/PaymentOrder.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'PaymentApi.g.dart';


abstract class PaymentApi {
  factory PaymentApi(Dio dio, {String baseUrl}) = _PaymentApi;

  /// @param accountType : 1 coin, 9 vip
  
  Future<PaymentOptionRsp> options( int platform,  int accountType);

  
  Future<PaymentOptionRsp> popupOptions( int platform);

  
  Future<PaymentOrderRsp> optionOrder( int payMode,  int optionId);

  
  Future<PaymentOrderRsp> optionOrderWithExtra( int payMode,  int optionId,  String extra);


  
  Future<PaymentCheckResultRsp> payCheck( int payMode,  String orderId,  String receiptInfo);

  
  Future<BatchPayCheckRsp> batchPayCheck( String ordersJson);

  
  Future<PaymentOptionDetailRsp> optionDetail( int optionId);
}


class PaymentOptionList {
  List<PaymentOption>? options;

  PaymentOptionList();

  factory PaymentOptionList.fromJson(Map<String, dynamic> json) => _$PaymentOptionListFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOptionListToJson(this);
}


class PaymentOptionRsp extends BaseRsp<PaymentOptionList> {
  PaymentOptionList? data;

  PaymentOptionRsp();

  factory PaymentOptionRsp.fromJson(Map<String, dynamic> json) => _$PaymentOptionRspFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOptionRspToJson(this);

  @override
  PaymentOptionList? getData() {
    return data;
  }
}


class PaymentOrderData {
  PaymentOrder? order;

  PaymentOrderData();

  factory PaymentOrderData.fromJson(Map<String, dynamic> json) => _$PaymentOrderDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOrderDataToJson(this);
}


class PaymentOrderRsp extends BaseRsp<PaymentOrderData> {
  PaymentOrderData? data;

  PaymentOrderRsp();

  factory PaymentOrderRsp.fromJson(Map<String, dynamic> json) => _$PaymentOrderRspFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOrderRspToJson(this);

  @override
  PaymentOrderData? getData() {
    return data;
  }
}


class PaymentCheckResult {
  
  int result = 0;
  String? order;

  PaymentCheckResult();

  factory PaymentCheckResult.fromJson(Map<String, dynamic> json) => _$PaymentCheckResultFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCheckResultToJson(this);
}


class PaymentCheckResultRsp extends BaseRsp<PaymentCheckResult> {
  PaymentCheckResult? data;

  PaymentCheckResultRsp();

  factory PaymentCheckResultRsp.fromJson(Map<String, dynamic> json) => _$PaymentCheckResultRspFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCheckResultRspToJson(this);

  @override
  PaymentCheckResult? getData() {
    return data;
  }
}


class PaymentOptionDetailData {
  PaymentOption? option;

  PaymentOptionDetailData();

  factory PaymentOptionDetailData.fromJson(Map<String, dynamic> json) => _$PaymentOptionDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOptionDetailDataToJson(this);
}


class PaymentOptionDetailRsp extends BaseRsp<PaymentOptionDetailData> {
  PaymentOptionDetailData? data;

  PaymentOptionDetailRsp();

  factory PaymentOptionDetailRsp.fromJson(Map<String, dynamic> json) => _$PaymentOptionDetailRspFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOptionDetailRspToJson(this);

  @override
  PaymentOptionDetailData? getData() {
    return data;
  }
}


///data class PayOrderInfo(var id : Long = 0L,
//                         var base_total_price :Float = 0F,
//                         var base_currency:String = "",
//                         var account_type :Int = 0) : Parcelable{
//
//
///var id : Long = 0L,
//                         var uid :Long = 0L,
//                         var pay_mode :Int = 0,
//                         var total_price :Float = 0F,
//                         var pay_currency:String = "",
//                         var base_total_price :Float = 0F,
//                         var base_currency:String = "",
//                         var account_type :Int = 0


//     companion object{
//         const val PAY_VIP_TYPE = 9
//     }
// }


class PayedOrderInfo {

  
  int id = 0;
  String base_currency = "";
  
  int account_type = 0;
  
  double base_total_price = 0;

  PayedOrderInfo();

  factory PayedOrderInfo.fromJson(Map<String, dynamic> json) => _$PayedOrderInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PayedOrderInfoToJson(this);
}

///data class BatchPayCheckInfo(var result : Int = 0,var order: PayOrderInfo? = null ) : Parcelable


class BatchPayCheckInfo {

  
  int result = 0;

  PayedOrderInfo? order;

  BatchPayCheckInfo();

  factory BatchPayCheckInfo.fromJson(Map<String, dynamic> json) => _$BatchPayCheckInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BatchPayCheckInfoToJson(this);
}


class BatchPayCheckInfoList {
  List<BatchPayCheckInfo>? orders;

  BatchPayCheckInfoList();

  factory BatchPayCheckInfoList.fromJson(Map<String, dynamic> json) => _$BatchPayCheckInfoListFromJson(json);

  Map<String, dynamic> toJson() => _$BatchPayCheckInfoListToJson(this);
}


class BatchPayCheckRsp extends BaseRsp<BatchPayCheckInfoList> {
  BatchPayCheckInfoList? data;

  BatchPayCheckRsp();

  factory BatchPayCheckRsp.fromJson(Map<String, dynamic> json) => _$BatchPayCheckRspFromJson(json);

  Map<String, dynamic> toJson() => _$BatchPayCheckRspToJson(this);

  @override
  BatchPayCheckInfoList? getData() {
    return data;
  }
}


