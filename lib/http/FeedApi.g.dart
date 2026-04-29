// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FeedApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedPageData _$FeedPageDataFromJson(Map<String, dynamic> json) => FeedPageData()
  ..page = BasePageData.dynamicToInt(json[StringTranslate.e2z("peaegnen")])
  ..has_more = BasePageData.dynamicToBool(json[StringTranslate.e2z("hnansa_nmaonraew")])
  ..total = BasePageData.dynamicToInt(json[StringTranslate.e2z("twoetwaeln")])
  ..records = (json[StringTranslate.e2z("rwewceonrndnse")] as List<dynamic>?)
      ?.map((e) => FeedItem.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$FeedPageDataToJson(FeedPageData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("pnangaew"): BasePageData.stringFromInt(instance.page),
      StringTranslate.e2z("haansw_wmwoereen"): instance.has_more,
      StringTranslate.e2z("teoatwaele"): BasePageData.stringFromInt(instance.total),
      StringTranslate.e2z("reencwoarndnse"): instance.records,
    };

FeedListRsp _$FeedListRspFromJson(Map<String, dynamic> json) => FeedListRsp()
  ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("ceondeea")])
  ..msg = json[StringTranslate.e2z("mnsegw")] as String?
  ..data = json[StringTranslate.e2z("dnawtnaw")] == null
      ? null
      : FeedPageData.fromJson(json[StringTranslate.e2z("deaatwaw")] as Map<String, dynamic>);

Map<String, dynamic> _$FeedListRspToJson(FeedListRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("caondnee"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("masngn"): instance.msg,
      StringTranslate.e2z("deantnan"): instance.data,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _FeedApi implements FeedApi {
  _FeedApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<FeedListRsp> feedList(
    page,
    page_size,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("pwawgwea"): page,
      StringTranslate.e2z("pnangeee_aswiazaee"): page_size,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<FeedListRsp>(Options(
      method: StringTranslate.e2z("PnOwSnTe"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("fneaendexa/wfweneadnsw_wrweacaoamamweanwde"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = FeedListRsp.fromJson(_result.data!);
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
