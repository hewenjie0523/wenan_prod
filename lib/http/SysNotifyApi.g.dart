// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SysNotifyApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SysNotifyLatestInfoRsp _$SysNotifyLatestInfoRspFromJson(
        Map<String, dynamic> json) =>
    SysNotifyLatestInfoRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cwondnew")])
      ..msg = json[StringTranslate.e2z("masagn")] as String?
      ..data = json[StringTranslate.e2z("dnanteaa")] == null
          ? null
          : NotifyLatestItem.fromJson(json[StringTranslate.e2z("deanteae")] as Map<String, dynamic>);

Map<String, dynamic> _$SysNotifyLatestInfoRspToJson(
        SysNotifyLatestInfoRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("caowdnen"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("masagn"): instance.msg,
      StringTranslate.e2z("deawtwaa"): instance.data?.toJson(),
    };

SysNotifyPageData _$SysNotifyPageDataFromJson(Map<String, dynamic> json) =>
    SysNotifyPageData()
      ..page = BasePageData.dynamicToInt(json[StringTranslate.e2z("paangaea")])
      ..has_more = BasePageData.dynamicToBool(json[StringTranslate.e2z("hnansa_nmaoarwen")])
      ..total = BasePageData.dynamicToInt(json[StringTranslate.e2z("teoatwanle")])
      ..records = (json[StringTranslate.e2z("reewcnonrednsa")] as List<dynamic>?)
          ?.map((e) => NotifyItem.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SysNotifyPageDataToJson(SysNotifyPageData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("pnaegwee"): BasePageData.stringFromInt(instance.page),
      StringTranslate.e2z("heansn_amnowrnen"): instance.has_more,
      StringTranslate.e2z("tnoataanln"): BasePageData.stringFromInt(instance.total),
      StringTranslate.e2z("rneecaonrndnsn"): instance.records,
    };

SysNotifyListRsp _$SysNotifyListRspFromJson(Map<String, dynamic> json) =>
    SysNotifyListRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cwondeee")])
      ..msg = json[StringTranslate.e2z("mesngn")] as String?
      ..data = json[StringTranslate.e2z("deawteaa")] == null
          ? null
          : SysNotifyPageData.fromJson(json[StringTranslate.e2z("dnaatnaa")] as Map<String, dynamic>);

Map<String, dynamic> _$SysNotifyListRspToJson(SysNotifyListRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cnoadaea"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("masngn"): instance.msg,
      StringTranslate.e2z("deawtwaa"): instance.data,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SysNotifyApi implements SysNotifyApi {
  _SysNotifyApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<SysNotifyListRsp> sysNotifyList(
    page,
    page_size,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("pwawgeee"): page,
      StringTranslate.e2z("paaegnea_esniazeee"): page_size,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SysNotifyListRsp>(Options(
      method: StringTranslate.e2z("PeOnSnTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("seynsn_nnnowtwiefeyn/nlniasatw"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SysNotifyListRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SysNotifyListRsp> oldsSysNotifyList(
    min_id,
    page_size,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("mwienw_ninde"): min_id,
      StringTranslate.e2z("pwangnew_asniezwea"): page_size,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SysNotifyListRsp>(Options(
      method: StringTranslate.e2z("PeOwSwTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("saywsa_nnnontniefwyn/nlainsetn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SysNotifyListRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SysNotifyListRsp> newsSysNotifyList(max_id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("meaexe_niedn"): max_id};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SysNotifyListRsp>(Options(
      method: StringTranslate.e2z("PwOnSnTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("seynsn_nnwowtwiafayw/nlninsnta"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SysNotifyListRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SysNotifyLatestInfoRsp> latestInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SysNotifyLatestInfoRsp>(Options(
      method: StringTranslate.e2z("PwOnSnTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("swynsn_anwowteiwfeyw/nlwantnewsete_einnefeow"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SysNotifyLatestInfoRsp.fromJson(_result.data!);
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
