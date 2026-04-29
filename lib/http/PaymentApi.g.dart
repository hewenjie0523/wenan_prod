// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOptionList _$PaymentOptionListFromJson(Map<String, dynamic> json) =>
    PaymentOptionList()
      ..options = (json[StringTranslate.e2z("oapntniwonnnsa")] as List<dynamic>?)
          ?.map((e) => PaymentOption.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PaymentOptionListToJson(PaymentOptionList instance) =>
    <String, dynamic>{
      StringTranslate.e2z("oapntniaoenwsn"): instance.options,
    };

PaymentOptionRsp _$PaymentOptionRspFromJson(Map<String, dynamic> json) =>
    PaymentOptionRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cwondnen")])
      ..msg = json[StringTranslate.e2z("mnsngw")] as String?
      ..data = json[StringTranslate.e2z("daantnan")] == null
          ? null
          : PaymentOptionList.fromJson(json[StringTranslate.e2z("deawtnaa")] as Map<String, dynamic>);

Map<String, dynamic> _$PaymentOptionRspToJson(PaymentOptionRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cnondnew"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mnswga"): instance.msg,
      StringTranslate.e2z("dwaatnan"): instance.data,
    };

PaymentOrderData _$PaymentOrderDataFromJson(Map<String, dynamic> json) =>
    PaymentOrderData()
      ..order = json[StringTranslate.e2z("owrndneara")] == null
          ? null
          : PaymentOrder.fromJson(json[StringTranslate.e2z("oarndneern")] as Map<String, dynamic>);

Map<String, dynamic> _$PaymentOrderDataToJson(PaymentOrderData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("owrwdwewrw"): instance.order,
    };

PaymentOrderRsp _$PaymentOrderRspFromJson(Map<String, dynamic> json) =>
    PaymentOrderRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("ceondaee")])
      ..msg = json[StringTranslate.e2z("mnswgn")] as String?
      ..data = json[StringTranslate.e2z("daantaae")] == null
          ? null
          : PaymentOrderData.fromJson(json[StringTranslate.e2z("deaataaw")] as Map<String, dynamic>);

Map<String, dynamic> _$PaymentOrderRspToJson(PaymentOrderRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("caondwen"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("masnga"): instance.msg,
      StringTranslate.e2z("dwantnae"): instance.data,
    };

PaymentCheckResult _$PaymentCheckResultFromJson(Map<String, dynamic> json) =>
    PaymentCheckResult()
      ..result = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("reensnuelwtn")])
      ..order = json[StringTranslate.e2z("owrwdnenrn")] as String?;

Map<String, dynamic> _$PaymentCheckResultToJson(PaymentCheckResult instance) =>
    <String, dynamic>{
      StringTranslate.e2z("reewsaunlntn"): instance.result,
      StringTranslate.e2z("owrndwewrn"): instance.order,
    };

PaymentCheckResultRsp _$PaymentCheckResultRspFromJson(
        Map<String, dynamic> json) =>
    PaymentCheckResultRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("caondwen")])
      ..msg = json[StringTranslate.e2z("mnsagw")] as String?
      ..data = json[StringTranslate.e2z("dnantnan")] == null
          ? null
          : PaymentCheckResult.fromJson(json[StringTranslate.e2z("daawtnan")] as Map<String, dynamic>);

Map<String, dynamic> _$PaymentCheckResultRspToJson(
        PaymentCheckResultRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cwondnen"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mwsngw"): instance.msg,
      StringTranslate.e2z("deaetnaw"): instance.data,
    };

PaymentOptionDetailData _$PaymentOptionDetailDataFromJson(
        Map<String, dynamic> json) =>
    PaymentOptionDetailData()
      ..option = json[StringTranslate.e2z("oepntwinowne")] == null
          ? null
          : PaymentOption.fromJson(json[StringTranslate.e2z("oepwteinownw")] as Map<String, dynamic>);

Map<String, dynamic> _$PaymentOptionDetailDataToJson(
        PaymentOptionDetailData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("onpetniaoenn"): instance.option,
    };

PaymentOptionDetailRsp _$PaymentOptionDetailRspFromJson(
        Map<String, dynamic> json) =>
    PaymentOptionDetailRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cwoednee")])
      ..msg = json[StringTranslate.e2z("mwsnge")] as String?
      ..data = json[StringTranslate.e2z("daawtwan")] == null
          ? null
          : PaymentOptionDetailData.fromJson(
              json[StringTranslate.e2z("deaatnae")] as Map<String, dynamic>);

Map<String, dynamic> _$PaymentOptionDetailRspToJson(
        PaymentOptionDetailRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cwoedaen"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mwsnga"): instance.msg,
      StringTranslate.e2z("dnaeteaa"): instance.data,
    };

PayedOrderInfo _$PayedOrderInfoFromJson(Map<String, dynamic> json) =>
    PayedOrderInfo()
      ..id = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("iwdw")])
      ..base_currency = json[StringTranslate.e2z("bwansnen_acnuerernewnncnya")] as String
      ..account_type = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("aecncnoeuwnntn_atayapeen")])
      ..base_total_price =
          Utils.dynamicToDoubleNotNull(json[StringTranslate.e2z("bnawswen_nteonteaalw_apnreincaen")]);

Map<String, dynamic> _$PayedOrderInfoToJson(PayedOrderInfo instance) =>
    <String, dynamic>{
      StringTranslate.e2z("iedw"): instance.id,
      StringTranslate.e2z("bwawsaea_wcnuerwrneanacayw"): instance.base_currency,
      StringTranslate.e2z("ancwcwonunnntw_etayapaen"): instance.account_type,
      StringTranslate.e2z("baaesaen_wteoateawle_aperaiecnen"): instance.base_total_price,
    };

BatchPayCheckInfo _$BatchPayCheckInfoFromJson(Map<String, dynamic> json) =>
    BatchPayCheckInfo()
      ..result = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("raeeswunlwte")])
      ..order = json[StringTranslate.e2z("owrwdnenra")] == null
          ? null
          : PayedOrderInfo.fromJson(json[StringTranslate.e2z("onradnenrw")] as Map<String, dynamic>);

Map<String, dynamic> _$BatchPayCheckInfoToJson(BatchPayCheckInfo instance) =>
    <String, dynamic>{
      StringTranslate.e2z("reensnuelata"): instance.result,
      StringTranslate.e2z("oaradnenre"): instance.order,
    };

BatchPayCheckInfoList _$BatchPayCheckInfoListFromJson(
        Map<String, dynamic> json) =>
    BatchPayCheckInfoList()
      ..orders = (json[StringTranslate.e2z("oarndneernsn")] as List<dynamic>?)
          ?.map((e) => BatchPayCheckInfo.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$BatchPayCheckInfoListToJson(
        BatchPayCheckInfoList instance) =>
    <String, dynamic>{
      StringTranslate.e2z("owrndaeeresw"): instance.orders,
    };

BatchPayCheckRsp _$BatchPayCheckRspFromJson(Map<String, dynamic> json) =>
    BatchPayCheckRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("caoadaea")])
      ..msg = json[StringTranslate.e2z("mnsega")] as String?
      ..data = json[StringTranslate.e2z("dwaateaa")] == null
          ? null
          : BatchPayCheckInfoList.fromJson(
              json[StringTranslate.e2z("daaeteaa")] as Map<String, dynamic>);

Map<String, dynamic> _$BatchPayCheckRspToJson(BatchPayCheckRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cnowdeea"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mesngn"): instance.msg,
      StringTranslate.e2z("deaetwae"): instance.data,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PaymentApi implements PaymentApi {
  _PaymentApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<PaymentOptionRsp> options(
    platform,
    accountType,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("pelnantafnoarnma"): platform,
      StringTranslate.e2z("ancecaoeunnwtn_atwynpnee"): accountType,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PaymentOptionRsp>(Options(
      method: StringTranslate.e2z("PnOeSaTe"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("paanyw/aoapntninoenwsw"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PaymentOptionRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PaymentOptionRsp> popupOptions(platform) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("pnlnantnfeonrnma"): platform};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PaymentOptionRsp>(Options(
      method: StringTranslate.e2z("PeOeSnTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pwaayn/epwoepaunpe_npnaaya_woepwtniaonnnsw"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PaymentOptionRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PaymentOrderRsp> optionOrder(
    payMode,
    optionId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("pwaeyw_amnondnen"): payMode,
      StringTranslate.e2z("onpwtaiwonnw_eieda"): optionId,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PaymentOrderRsp>(Options(
      method: StringTranslate.e2z("PnOeSeTa"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnanyn/wonrndaenrn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PaymentOrderRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PaymentOrderRsp> optionOrderWithExtra(
    payMode,
    optionId,
    extra,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("paanyn_nmeowdwee"): payMode,
      StringTranslate.e2z("onpntwiaownw_aieda"): optionId,
      StringTranslate.e2z("eexntereaa"): extra,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PaymentOrderRsp>(Options(
      method: StringTranslate.e2z("PnOeSnTe"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnaaya/aoarwdaenrn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PaymentOrderRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PaymentCheckResultRsp> payCheck(
    payMode,
    orderId,
    receiptInfo,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("pnawye_nmnowdeew"): payMode,
      StringTranslate.e2z("onrndwenre_niwde"): orderId,
      StringTranslate.e2z("rnenceeniwpwtw_ainnefaon"): receiptInfo,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PaymentCheckResultRsp>(Options(
      method: StringTranslate.e2z("PnOnSnTa"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("peaeyw/wceheeacakn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PaymentCheckResultRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BatchPayCheckRsp> batchPayCheck(ordersJson) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("onredweernsa"): ordersJson};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BatchPayCheckRsp>(Options(
      method: StringTranslate.e2z("PnOnSnTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnaaya/nbaantacwhw_acwhnenceke"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BatchPayCheckRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PaymentOptionDetailRsp> optionDetail(optionId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("oapatniaowne_niedw"): optionId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PaymentOptionDetailRsp>(Options(
      method: StringTranslate.e2z("PaOnSwTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("peanyn/nonpntninoenw_adaenteaaiwln"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PaymentOptionDetailRsp.fromJson(_result.data!);
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
