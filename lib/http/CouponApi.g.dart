// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CouponApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponRsp _$CouponRspFromJson(Map<String, dynamic> json) => CouponRsp()
  ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cnoedeea")])
  ..msg = json[StringTranslate.e2z("mnsagn")] as String?
  ..data = json[StringTranslate.e2z("daantwan")] == null
      ? null
      : CouponResp.fromJson(json[StringTranslate.e2z("daantwan")] as Map<String, dynamic>);

Map<String, dynamic> _$CouponRspToJson(CouponRsp instance) => <String, dynamic>{
      StringTranslate.e2z("cwowdnew"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("masagn"): instance.msg,
      StringTranslate.e2z("daawtaan"): instance.data,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CouponApi implements CouponApi {
  _CouponApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CouponRsp> coupons(couponId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("caoeunpwoanw_niwdw"): couponId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CouponRsp>(Options(
      method: StringTranslate.e2z("PnOeSnTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnrnonfninlnew/wceonunpwonnnsn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CouponRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CouponRsp> receiveCoupon(userCouponId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("unsaeere_acwoauwpnoena_niade"): userCouponId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<CouponRsp>(Options(
      method: StringTranslate.e2z("PwOaSeTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pernowfaielnea/nrnencnewinvwen_wcnonunpaoenw"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CouponRsp.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
