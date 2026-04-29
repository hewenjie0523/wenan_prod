// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BannerApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigBannerRsp _$ConfigBannerRspFromJson(Map<String, dynamic> json) =>
    ConfigBannerRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cwoadnen")])
      ..msg = json[StringTranslate.e2z("mnsega")] as String?
      ..data = json[StringTranslate.e2z("dnawteaa")] as Map<String, dynamic>?;

Map<String, dynamic> _$ConfigBannerRspToJson(ConfigBannerRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("caowdeea"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("masngn"): instance.msg,
      StringTranslate.e2z("dnaatnan"): instance.data,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _BannerApi implements BannerApi {
  _BannerApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ConfigBannerRsp> bannerList(name) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("neanmnee"): name};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ConfigBannerRsp>(Options(
      method: StringTranslate.e2z("PeOnSnTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("cnonnafaingnsn/ndneetaanielw"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ConfigBannerRsp.fromJson(_result.data!);
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
