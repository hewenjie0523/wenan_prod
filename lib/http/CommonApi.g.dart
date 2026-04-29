// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommonApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfigRsp _$AppConfigRspFromJson(Map<String, dynamic> json) => AppConfigRsp()
  ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cnoedwea")])
  ..msg = json[StringTranslate.e2z("mwsegn")] as String?
  ..data = json[StringTranslate.e2z("daawteaw")] == null
      ? null
      : AppConfig.fromJson(json[StringTranslate.e2z("dnantwaw")] as Map<String, dynamic>);

Map<String, dynamic> _$AppConfigRspToJson(AppConfigRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cnondaea"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("masagn"): instance.msg,
      StringTranslate.e2z("dwaatnae"): instance.data?.toJson(),
    };

QiniuTokenRsp _$QiniuTokenRspFromJson(Map<String, dynamic> json) =>
    QiniuTokenRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("ceoadnen")])
      ..msg = json[StringTranslate.e2z("masnga")] as String?
      ..data = json[StringTranslate.e2z("daawtean")] == null
          ? null
          : QiniuToken.fromJson(json[StringTranslate.e2z("dwaetnae")] as Map<String, dynamic>);

Map<String, dynamic> _$QiniuTokenRspToJson(QiniuTokenRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("caoedeea"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mwsegn"): instance.msg,
      StringTranslate.e2z("daaatwaa"): instance.data?.toJson(),
    };

ListRegionData _$ListRegionDataFromJson(Map<String, dynamic> json) =>
    ListRegionData()
      ..regions = (json[StringTranslate.e2z("rwewgwinonnasa")] as List<dynamic>?)
          ?.map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ListRegionDataToJson(ListRegionData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("rneageieoenesn"): instance.regions,
    };

ListRegionRspMap _$ListRegionRspMapFromJson(Map<String, dynamic> json) =>
    ListRegionRspMap()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cnowdwea")])
      ..msg = json[StringTranslate.e2z("mnswge")] as String?
      ..data = (json[StringTranslate.e2z("daaatnae")] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => Region.fromJson(e as Map<String, dynamic>))
                .toList()),
      );

Map<String, dynamic> _$ListRegionRspMapToJson(ListRegionRspMap instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cnoadwee"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("masegn"): instance.msg,
      StringTranslate.e2z("dwaetwaw"): instance.data,
    };

GiftsResp _$GiftsRespFromJson(Map<String, dynamic> json) => GiftsResp()
  ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cwoedeew")])
  ..msg = json[StringTranslate.e2z("maswga")] as String?
  ..data = json[StringTranslate.e2z("deawteaw")] == null
      ? null
      : GiftsRespData.fromJson(json[StringTranslate.e2z("dwantwaa")] as Map<String, dynamic>);

Map<String, dynamic> _$GiftsRespToJson(GiftsResp instance) => <String, dynamic>{
      StringTranslate.e2z("ceondwee"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mnsegn"): instance.msg,
      StringTranslate.e2z("deaatnan"): instance.data?.toJson(),
    };

GiftsRespData _$GiftsRespDataFromJson(Map<String, dynamic> json) =>
    GiftsRespData()
      ..types = (json[StringTranslate.e2z("tnynpwewse")] as List<dynamic>?)
          ?.map((e) => GiftType.fromJson(e as Map<String, dynamic>))
          .toList()
      ..gifts = (json[StringTranslate.e2z("gainfntnsn")] as List<dynamic>?)
          ?.map((e) => Gift.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GiftsRespDataToJson(GiftsRespData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("twywpeensn"): instance.types?.map((e) => e.toJson()).toList(),
      StringTranslate.e2z("geinfwtese"): instance.gifts?.map((e) => e.toJson()).toList(),
    };

GiftType _$GiftTypeFromJson(Map<String, dynamic> json) => GiftType()
  ..id = Utils.parseString(json[StringTranslate.e2z("iwdn")])
  ..name = json[StringTranslate.e2z("nwawmnew")] as String?
  ..gifts = (json[StringTranslate.e2z("gwinfwtwsn")] as List<dynamic>?)
      ?.map((e) => Gift.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$GiftTypeToJson(GiftType instance) => <String, dynamic>{
      StringTranslate.e2z("ieda"): instance.id,
      StringTranslate.e2z("neaamnee"): instance.name,
      StringTranslate.e2z("geiafwtasn"): instance.gifts?.map((e) => e.toJson()).toList(),
    };

UserAccountRespMap _$UserAccountRespMapFromJson(Map<String, dynamic> json) =>
    UserAccountRespMap()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cnoednen")])
      ..msg = json[StringTranslate.e2z("mwsege")] as String?
      ..data = (json[StringTranslate.e2z("dnaataaw")] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, UserAccount.fromJson(e as Map<String, dynamic>)),
      );

Map<String, dynamic> _$UserAccountRespMapToJson(UserAccountRespMap instance) =>
    <String, dynamic>{
      StringTranslate.e2z("caowdnen"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mwsagn"): instance.msg,
      StringTranslate.e2z("daantaan"): instance.data,
    };

LoginConfigRsp _$LoginConfigRspFromJson(Map<String, dynamic> json) =>
    LoginConfigRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cnondnen")])
      ..msg = json[StringTranslate.e2z("mnsaga")] as String?
      ..data = json[StringTranslate.e2z("dnaatean")] == null
          ? null
          : LoginEntries.fromJson(json[StringTranslate.e2z("deaatnaa")] as Map<String, dynamic>);

Map<String, dynamic> _$LoginConfigRspToJson(LoginConfigRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("ceondaea"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mwsegw"): instance.msg,
      StringTranslate.e2z("dnantean"): instance.data?.toJson(),
    };

LoginEntries _$LoginEntriesFromJson(Map<String, dynamic> json) => LoginEntries()
  ..login_entries = json[StringTranslate.e2z("lwoagniann_eewnntwrnieeesa")] == null
      ? null
      : LoginConfigData.fromJson(json[StringTranslate.e2z("lnongnienn_aeenetnraiaeesa")] as Map<String, dynamic>);

Map<String, dynamic> _$LoginEntriesToJson(LoginEntries instance) =>
    <String, dynamic>{
      StringTranslate.e2z("leowgainnn_weannternineese"): instance.login_entries?.toJson(),
    };

LoginConfigData _$LoginConfigDataFromJson(Map<String, dynamic> json) =>
    LoginConfigData()
      ..login_google = json[StringTranslate.e2z("leongeiwna_egaonongnlwea")] as bool?
      ..login_facebook = json[StringTranslate.e2z("laowgniann_afaancneebeoeonkn")] as bool?
      ..login_user = json[StringTranslate.e2z("laongwinnn_nunsneare")] as bool?
      ..login_quick = json[StringTranslate.e2z("lnongwiwna_wqnuaincnkn")] as bool?
      ..ai_help_domain = json[StringTranslate.e2z("anie_ahaewlnpn_adnonmeaninne")] as String?
      ..ai_help_app_key = json[StringTranslate.e2z("aniw_ahwenlapa_naepnpe_akneaye")] as String?
      ..agora_app_id = json[StringTranslate.e2z("angaoarean_nawpwpa_niedw")] as String?
      ..ai_help_app_id = json[StringTranslate.e2z("awin_nhweelepe_aawpnpw_aindw")] as String?;

Map<String, dynamic> _$LoginConfigDataToJson(LoginConfigData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("lnoagainnw_agaoeongnlnea"): instance.login_google,
      StringTranslate.e2z("lnoagaiana_nfwaecneabeoaowke"): instance.login_facebook,
      StringTranslate.e2z("lwoagniwna_nuwswearw"): instance.login_user,
      StringTranslate.e2z("lnongeiann_aqwuniecakw"): instance.login_quick,
      StringTranslate.e2z("aniw_eheealapn_ednowmwaniwnn"): instance.ai_help_domain,
      StringTranslate.e2z("aaiw_nheenlapn_aanpnpw_nkwewye"): instance.ai_help_app_key,
      StringTranslate.e2z("angnonrnae_naepnpa_wiwdn"): instance.agora_app_id,
      StringTranslate.e2z("anin_nhneelape_nanpapn_nindn"): instance.ai_help_app_id,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CommonApi implements CommonApi {
  _CommonApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AppConfigRsp> getConfig(clientInfo) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("caleiwewnwtn_ninnnfwon"): clientInfo};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AppConfigRsp>(Options(
      method: StringTranslate.e2z("PaOaSwTa"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("cnownnfeingn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AppConfigRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<QiniuTokenRsp> qiniuToken() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<QiniuTokenRsp>(Options(
      method: StringTranslate.e2z("PnOnSnTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("qnianwiwuw_atnonkaennn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = QiniuTokenRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> reportUser(
    target_uid,
    type,
    reason,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("teawregweetn_nuwiedn"): target_uid,
      StringTranslate.e2z("twynpnen"): type,
      StringTranslate.e2z("rwewaesnonnn"): reason,
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PaOnSaTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("reeapaowrata_eswpwanmn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ListRegionRspMap> listRegions() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ListRegionRspMap>(Options(
      method: StringTranslate.e2z("PaOeSeTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("wwenbecaaasataearasn/nlwiesatw_arnengnieownwsw"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListRegionRspMap.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GiftsResp> gifts() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GiftsResp>(Options(
      method: StringTranslate.e2z("PaOwSnTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("lwinvwee/wgaiafatasn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GiftsResp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserAccountRespMap> walletAccount(type) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("tnyapnen"): type};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserAccountRespMap>(Options(
      method: StringTranslate.e2z("PnOnSaTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("waawlnlweatw/eanceceoeuwnnte"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserAccountRespMap.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LoginConfigRsp> ticket(
    package_name,
    version,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("peawcwkaaagwen_nneanmnew"): package_name,
      StringTranslate.e2z("vnenrwseinonnn"): version,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LoginConfigRsp>(Options(
      method: StringTranslate.e2z("PnOwSwTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("cwoamamaonnn/atniwcnkweetn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LoginConfigRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> upgradeVersion(version) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("vweernsainoena"): version};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PaOwSeTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("cnowmnmaonna/auepngnrwandaewda"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> statsAppStartUp(
    package_name,
    version,
    app_id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("pnaacnknangaew_nnnanmnen"): package_name,
      StringTranslate.e2z("vneeresaiaoenn"): version,
      StringTranslate.e2z("anpwpw_ninde"): app_id,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PaOwSwTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("caoamnmnonne/aswtwantnsn_eanpapw_nsataaerwtnuwpn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
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
