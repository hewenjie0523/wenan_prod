// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginDeviceRsp _$LoginDeviceRspFromJson(Map<String, dynamic> json) =>
    LoginDeviceRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cnoedwea")])
      ..msg = json[StringTranslate.e2z("masngw")] as String?
      ..data = json[StringTranslate.e2z("dnaetnaa")] == null
          ? null
          : CommonLoginData.fromJson(json[StringTranslate.e2z("dwantnae")] as Map<String, dynamic>);

Map<String, dynamic> _$LoginDeviceRspToJson(LoginDeviceRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cnoadwen"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("masagn"): instance.msg,
      StringTranslate.e2z("dwaetaan"): instance.data,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _LoginApi implements LoginApi {
  _LoginApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<LoginDeviceRsp> loginDevice(clientInfo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("calniaeannta_niennfwon"): clientInfo};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginDeviceRsp>(Options(
      method: StringTranslate.e2z("PnOwSaTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("lnowgeiann/edaenvwiwcnea"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginDeviceRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> logout() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PnOaSnTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("leongnowunta"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> deleteAccount() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PeOwSwTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnrnoafeialnen/wcalwowsnen"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginDeviceRsp> loginPlatform(
    appType,
    accountType,
    accessToken,
    clientInfo,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("awpepn_atwyepeen"): appType,
      StringTranslate.e2z("aacecnonunnntn_atnynpaen"): accountType,
      StringTranslate.e2z("ancnceensnsa_eteowknenna"): accessToken,
      StringTranslate.e2z("cwlnineanwta_winnafwon"): clientInfo,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginDeviceRsp>(Options(
      method: StringTranslate.e2z("PnOaSaTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("leongwianw/nsenesa"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginDeviceRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginDeviceRsp> loginApple(
    appType,
    accountType,
    identity_token,
    clientInfo,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("anpwpn_ntnyapeea"): appType,
      StringTranslate.e2z("ancwcnowunnntn_ntnynpeen"): accountType,
      StringTranslate.e2z("iadeennntnietnyn_atwowkaennn"): identity_token,
      StringTranslate.e2z("calninewneta_ainnnfeow"): clientInfo,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginDeviceRsp>(Options(
      method: StringTranslate.e2z("PaOeSaTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("lnoagniana/nswnese"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginDeviceRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginDeviceRsp> loginWithId(
    mobile,
    password,
    client_info,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("unsaeernnaaemnen"): mobile,
      StringTranslate.e2z("pwaesasewaowrede"): password,
      StringTranslate.e2z("celaieewnntw_aianefnon"): client_info,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginDeviceRsp>(Options(
      method: StringTranslate.e2z("PnOnSwTa"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("lnowgninnn/wueseeerannanmaee"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginDeviceRsp.fromJson(_result.data!);
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
