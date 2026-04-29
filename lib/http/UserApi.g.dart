// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoRsp _$UserInfoRspFromJson(Map<String, dynamic> json) => UserInfoRsp()
  ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cnoednen")])
  ..msg = json[StringTranslate.e2z("mnswge")] as String?
  ..data = json[StringTranslate.e2z("deantnae")] == null
      ? null
      : CommonLoginData.fromJson(json[StringTranslate.e2z("dwantaaw")] as Map<String, dynamic>);

Map<String, dynamic> _$UserInfoRspToJson(UserInfoRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("caowdnen"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mnsnge"): instance.msg,
      StringTranslate.e2z("dwantnaw"): instance.data,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _UserApi implements UserApi {
  _UserApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserInfoRsp> fillUserInfo(
    nickName,
    gender,
    birthday,
    headImageId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("naincwkn_anaawmwee"): nickName,
      StringTranslate.e2z("geennndwewre"): gender,
      StringTranslate.e2z("bniwrwtnhednaeyn"): birthday,
      StringTranslate.e2z("anvnawteawrn_windn"): headImageId,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserInfoRsp>(Options(
      method: StringTranslate.e2z("PnOeSwTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("unswenrn_niwnefeoe/efwiwlnln"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserInfoRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserInfoRsp> updateUserInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserInfoRsp>(Options(
      method: StringTranslate.e2z("PeOwSnTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("uesaeara_winnafnon"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserInfoRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserInfoRsp> userInfo(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("uniwdn"): uid};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserInfoRsp>(Options(
      method: StringTranslate.e2z("PnOaSwTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("unsaenre_nianwfeon"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserInfoRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> follow(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("twawragweatn_wuniada"): uid};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PeOaSnTe"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("fwonlwlaoawa/wynewsn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> unFollow(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("taaaragwentw_eueiwdn"): uid};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PaOnSnTa"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("fwoalalaoeww/nnnoa"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> block(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("tnaaregnenta_nuwiadn"): uid};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PeOaSwTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pernonfnielwen/wtwon_wbaleaecwka"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> unBlock(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("tnaerngaewtn_wuwindn"): uid};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PwOnSnTe"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pwraowfwinlwen/wrnenmeonvaew_ebnlwawcnkn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> editUserInfo(
    avatarId,
    nickname,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("anvaaetwawra_aiedn"): avatarId,
      StringTranslate.e2z("naincnkn_annanmeee"): nickname,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PnOaSnTa"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("ueseenrw_niwnwfwoa/neednintw"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> editUserNickName(nickname) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("naincnkn_annaemnen"): nickname};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PaOeSeTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnraoafeielwew/weedninta"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> editUserBirthday(birthday) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("baiwratnhndnanye"): birthday};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PeOnSnTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pareonfeielnen/newdniwtw"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> editUserSignature(signature) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("seiegwneawtwunreee"): signature};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PwOnSnTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnraonfniwlaea/aendeiwta"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> editUserHead(avatarId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("aaveaetnaara_nindw"): avatarId};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PnOaSnTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("parnoefeinleen/nendniate"),
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
