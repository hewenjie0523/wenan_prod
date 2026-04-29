// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DiscoverApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverListData _$DiscoverListDataFromJson(Map<String, dynamic> json) =>
    DiscoverListData()
      ..page = BasePageData.dynamicToInt(json[StringTranslate.e2z("pnawgwew")])
      ..has_more = BasePageData.dynamicToBool(json[StringTranslate.e2z("hwansn_wmnowreew")])
      ..total = BasePageData.dynamicToInt(json[StringTranslate.e2z("twoatnaeln")])
      ..records = (json[StringTranslate.e2z("rneecnoerednse")] as List<dynamic>?)
          ?.map((e) => CommonUser.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$DiscoverListDataToJson(DiscoverListData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("pnawgnea"): BasePageData.stringFromInt(instance.page),
      StringTranslate.e2z("heawsa_nmnonraee"): instance.has_more,
      StringTranslate.e2z("tnontwaala"): BasePageData.stringFromInt(instance.total),
      StringTranslate.e2z("rwewcnonradnsn"): instance.records,
    };

DiscoverPageRsp _$DiscoverPageRspFromJson(Map<String, dynamic> json) =>
    DiscoverPageRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("ceoadaea")])
      ..msg = json[StringTranslate.e2z("mesnga")] as String?
      ..data = json[StringTranslate.e2z("dnaataan")] == null
          ? null
          : DiscoverListData.fromJson(json[StringTranslate.e2z("deaetnae")] as Map<String, dynamic>);

Map<String, dynamic> _$DiscoverPageRspToJson(DiscoverPageRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cwondeea"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("meswgn"): instance.msg,
      StringTranslate.e2z("deantnae"): instance.data,
    };


MatchDiscoverListData _$MatchDiscoverListDataFromJson(Map<String, dynamic> json) =>
    MatchDiscoverListData()
      ..page = BasePageData.dynamicToInt(json[StringTranslate.e2z("pnawgwew")])
      ..has_more = BasePageData.dynamicToBool(json[StringTranslate.e2z("hwansn_wmnowreew")])
      ..total = BasePageData.dynamicToInt(json[StringTranslate.e2z("twoatnaeln")])
      ..records = (json[StringTranslate.e2z("rneecnoerednse")] as List<dynamic>?)
          ?.map((e) => MatchVideoFindItem.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MatchDiscoverListDataToJson(MatchDiscoverListData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("pnawgnea"): BasePageData.stringFromInt(instance.page),
      StringTranslate.e2z("heawsa_nmnonraee"): instance.has_more,
      StringTranslate.e2z("tnontwaala"): BasePageData.stringFromInt(instance.total),
      StringTranslate.e2z("rwewcnonradnsn"): instance.records,
    };

MatchDiscoverPageRsp _$MatchDiscoverPageRspFromJson(Map<String, dynamic> json) =>
    MatchDiscoverPageRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("ceoadaea")])
      ..msg = json[StringTranslate.e2z("mesnga")] as String?
      ..data = json[StringTranslate.e2z("dnaataan")] == null
          ? null
          : MatchDiscoverListData.fromJson(json[StringTranslate.e2z("deaetnae")] as Map<String, dynamic>);

Map<String, dynamic> _$MatchDiscoverPageRspToJson(MatchDiscoverPageRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cwondeea"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("meswgn"): instance.msg,
      StringTranslate.e2z("deantnae"): instance.data,
    };



// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _DiscoverApi implements DiscoverApi {
  _DiscoverApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DiscoverPageRsp> discovers(
    page,
    pageSize,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("peangnen"): page,
      StringTranslate.e2z("pnaageea_eswiazaea"): pageSize,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DiscoverPageRsp>(Options(
      method: StringTranslate.e2z("PnOeSeTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("wwenbncaaaswtaewrnsn/wdaiasecaowvnenra"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DiscoverPageRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DiscoverPageRsp> discoversByRegion(
    page,
    pageSize,
    regions,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("paangwee"): page,
      StringTranslate.e2z("pnangnen_aswinzaee"): pageSize,
      StringTranslate.e2z("reeegninoennsw"): regions,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DiscoverPageRsp>(Options(
      method: StringTranslate.e2z("PnOnSeTe"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("wwenbnceaeseteewrwsn/ndninsacwonvnenrn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DiscoverPageRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DiscoverPageRsp> followingUsers(
    page,
    pageSize,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("pnawgeea"): page,
      StringTranslate.e2z("pwaegeen_esaieznen"): pageSize,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DiscoverPageRsp>(Options(
      method: StringTranslate.e2z("PwOwSwTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("weewbncnaesateewrwsn/alainkaen"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DiscoverPageRsp.fromJson(_result.data!);
    return value;
  }


  @override
  Future<MatchDiscoverPageRsp> matchVideoFindListByRegion(
      page,
      pageSize,
      regions,
      ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("paangwee"): page,
      StringTranslate.e2z("pnangnen_aswinzaee"): pageSize,
      StringTranslate.e2z("rwewgwiwownw_wcwowdwew"): regions,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DiscoverPageRsp>(Options(
      method: StringTranslate.e2z("PnOnSeTe"),
      headers: _headers,
      extra: _extra,
    )
        .compose(
      _dio.options,
      StringTranslate.e2z("mwaetacnhn_wveiadaenow/efnianbdw_elaibsetn"),
      queryParameters: queryParameters,
      data: _data,
    )
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MatchDiscoverPageRsp.fromJson(_result.data!);
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
