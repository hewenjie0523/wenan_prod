// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ActivityApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityListData _$ActivityListDataFromJson(Map<String, dynamic> json) =>
    ActivityListData()
      ..activities = (json[StringTranslate.e2z("awcntniavnintninease")] as List<dynamic>?)
          ?.map((e) => ActivityVo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ActivityListDataToJson(ActivityListData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("aacntwievwiwtninewsw"): instance.activities,
    };

ActivityListDataRsp _$ActivityListDataRspFromJson(Map<String, dynamic> json) =>
    ActivityListDataRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cwondeen")])
      ..msg = json[StringTranslate.e2z("mwsegn")] as String?
      ..data = json[StringTranslate.e2z("daawtnaa")] == null
          ? null
          : ActivityListData.fromJson(json[StringTranslate.e2z("dwaatwaw")] as Map<String, dynamic>);

Map<String, dynamic> _$ActivityListDataRspToJson(
        ActivityListDataRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("ceondwee"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mnswgn"): instance.msg,
      StringTranslate.e2z("dnaetnaa"): instance.data,
    };

ActivityVo _$ActivityVoFromJson(Map<String, dynamic> json) => ActivityVo()
  ..type = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("tnyapwew")])
  ..first_charge = json[StringTranslate.e2z("feinresntn_wcnhaanrageew")] == null
      ? null
      : FirstChargeVo.fromJson(json[StringTranslate.e2z("fniwrwsetn_ncehnaerngaee")] as Map<String, dynamic>);

Map<String, dynamic> _$ActivityVoToJson(ActivityVo instance) =>
    <String, dynamic>{
      StringTranslate.e2z("teynpwen"): instance.type,
      StringTranslate.e2z("fniarnsnte_ncnhnanragwen"): instance.first_charge,
    };

FirstChargeVo _$FirstChargeVoFromJson(Map<String, dynamic> json) =>
    FirstChargeVo()
      ..id = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("indw")])
      ..video_info = json[StringTranslate.e2z("veiedweaoe_einnefnoe")] == null
          ? null
          : AppVideo.fromJson(json[StringTranslate.e2z("vwiwdaenon_aienafaon")] as Map<String, dynamic>)
      ..option = json[StringTranslate.e2z("oepwtninoenn")] == null
          ? null
          : PaymentOption.fromJson(json[StringTranslate.e2z("owpetwinoenn")] as Map<String, dynamic>)
      ..text_img_info = json[StringTranslate.e2z("tnewxetw_aiwmwgn_niwnnfnon")] == null
          ? null
          : AppImage.fromJson(json[StringTranslate.e2z("teenxetn_ninmage_niwnnfnoe")] as Map<String, dynamic>);

Map<String, dynamic> _$FirstChargeVoToJson(FirstChargeVo instance) =>
    <String, dynamic>{
      StringTranslate.e2z("iedn"): instance.id,
      StringTranslate.e2z("vaindnenow_eiwnnfnoe"): instance.video_info,
      StringTranslate.e2z("oapntainoenw"): instance.option,
      StringTranslate.e2z("teewxwtn_ninmwga_niannfaon"): instance.text_img_info,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ActivityApi implements ActivityApi {
  _ActivityApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ActivityListDataRsp> acList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ActivityListDataRsp>(Options(
      method: StringTranslate.e2z("PaOeSnTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("owpaewrnaataieonneaaln_aaecntniavwintaye/nlainsnte"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ActivityListDataRsp.fromJson(_result.data!);
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
