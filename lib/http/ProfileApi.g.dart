// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlackListData _$BlackListDataFromJson(Map<String, dynamic> json) =>
    BlackListData()
      ..page = BasePageData.dynamicToInt(json[StringTranslate.e2z("paangwee")])
      ..has_more = BasePageData.dynamicToBool(json[StringTranslate.e2z("heaasn_emwowrnen")])
      ..total = BasePageData.dynamicToInt(json[StringTranslate.e2z("twowtwanlw")])
      ..records = (json[StringTranslate.e2z("raeecnonradnse")] as List<dynamic>?)
          ?.map((e) => CommonUser.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$BlackListDataToJson(BlackListData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("peaegeew"): BasePageData.stringFromInt(instance.page),
      StringTranslate.e2z("haansw_emaowrnea"): instance.has_more,
      StringTranslate.e2z("tnonteaale"): BasePageData.stringFromInt(instance.total),
      StringTranslate.e2z("rnewcwonredwsa"): instance.records,
    };

soggyAppBlackListPageRsp _$soggyAppBlackListPageRspFromJson(Map<String, dynamic> json) =>
    soggyAppBlackListPageRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cnowdaea")])
      ..msg = json[StringTranslate.e2z("maswgw")] as String?
      ..data = json[StringTranslate.e2z("daaetnan")] == null
          ? null
          : BlackListData.fromJson(json[StringTranslate.e2z("deanteae")] as Map<String, dynamic>);

Map<String, dynamic> _$soggyAppBlackListPageRspToJson(soggyAppBlackListPageRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cnoednea"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mnsngw"): instance.msg,
      StringTranslate.e2z("daaetwae"): instance.data,
    };

UserPageData _$UserPageDataFromJson(Map<String, dynamic> json) => UserPageData()
  ..page = BasePageData.dynamicToInt(json[StringTranslate.e2z("pnawgeew")])
  ..has_more = BasePageData.dynamicToBool(json[StringTranslate.e2z("haanse_emwoeraen")])
  ..total = BasePageData.dynamicToInt(json[StringTranslate.e2z("taontnawln")])
  ..records = (json[StringTranslate.e2z("rweecnoarndesn")] as List<dynamic>?)
      ?.map((e) => CommonUser.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$UserPageDataToJson(UserPageData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("pnangnen"): BasePageData.stringFromInt(instance.page),
      StringTranslate.e2z("heaesa_nmwowreee"): instance.has_more,
      StringTranslate.e2z("twontaanln"): BasePageData.stringFromInt(instance.total),
      StringTranslate.e2z("raewcaoerwdnsn"): instance.records,
    };

UserListRsp _$UserListRspFromJson(Map<String, dynamic> json) => UserListRsp()
  ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("caoadnen")])
  ..msg = json[StringTranslate.e2z("mnswge")] as String?
  ..data = json[StringTranslate.e2z("dnaetnae")] == null
      ? null
      : UserPageData.fromJson(json[StringTranslate.e2z("daantean")] as Map<String, dynamic>);

Map<String, dynamic> _$UserListRspToJson(UserListRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cnondnew"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("masega"): instance.msg,
      StringTranslate.e2z("dwanteae"): instance.data,
    };

RandomAvatar _$RandomAvatarFromJson(Map<String, dynamic> json) => RandomAvatar()
  ..avatar = json[StringTranslate.e2z("anveantwaera")] as String?
  ..name = json[StringTranslate.e2z("nwanmnea")] as String?;

Map<String, dynamic> _$RandomAvatarToJson(RandomAvatar instance) =>
    <String, dynamic>{
      StringTranslate.e2z("anveanteaare"): instance.avatar,
      StringTranslate.e2z("naanmnee"): instance.name,
    };

RandomAvatarData _$RandomAvatarDataFromJson(Map<String, dynamic> json) =>
    RandomAvatarData()
      ..users = (json[StringTranslate.e2z("uwsnenrnsa")] as List<dynamic>?)
          ?.map((e) => RandomAvatar.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RandomAvatarDataToJson(RandomAvatarData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("uasneernsn"): instance.users,
    };

RandomAvatarRsp _$RandomAvatarRspFromJson(Map<String, dynamic> json) =>
    RandomAvatarRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("caoadeee")])
      ..msg = json[StringTranslate.e2z("masngn")] as String?
      ..data = json[StringTranslate.e2z("deantwan")] == null
          ? null
          : RandomAvatarData.fromJson(json[StringTranslate.e2z("deaetnaw")] as Map<String, dynamic>);

Map<String, dynamic> _$RandomAvatarRspToJson(RandomAvatarRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("caowdeew"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mnsegw"): instance.msg,
      StringTranslate.e2z("deaetnaw"): instance.data,
    };

UserMediaData _$UserMediaDataFromJson(Map<String, dynamic> json) =>
    UserMediaData()
      ..pic_video_list = (json[StringTranslate.e2z("pnincn_nvwindneaoa_aleiwswtn")] as List<dynamic>?)
          ?.map((e) => AppMedia.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UserMediaDataToJson(UserMediaData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("paiwcn_nveindnenon_alwiesatn"): instance.pic_video_list,
    };

ProfileMediasRsp _$ProfileMediasRspFromJson(Map<String, dynamic> json) =>
    ProfileMediasRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("caoednea")])
      ..msg = json[StringTranslate.e2z("mesagw")] as String?
      ..data = json[StringTranslate.e2z("dwaetwaa")] == null
          ? null
          : UserMediaData.fromJson(json[StringTranslate.e2z("daanteae")] as Map<String, dynamic>);

Map<String, dynamic> _$ProfileMediasRspToJson(ProfileMediasRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("ceondwee"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mwswgn"): instance.msg,
      StringTranslate.e2z("dnaatnan"): instance.data,
    };

UserProfileData _$UserProfileDataFromJson(Map<String, dynamic> json) =>
    UserProfileData()
      ..user = json[StringTranslate.e2z("uaseewre")] == null
          ? null
          : CommonUser.fromJson(json[StringTranslate.e2z("unseeera")] as Map<String, dynamic>)
      ..pic_video_list = (json[StringTranslate.e2z("pnincn_nvnindaewon_alwiesntw")] as List<dynamic>?)
          ?.map((e) => AppMedia.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UserProfileDataToJson(UserProfileData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("unsaenra"): instance.user,
      StringTranslate.e2z("paiecn_evaindnenon_aleiwswtn"): instance.pic_video_list,
    };

UserProfileDetailData _$UserProfileDetailDataFromJson(
        Map<String, dynamic> json) =>
    UserProfileDetailData()
      ..discover_detail = json[StringTranslate.e2z("dainsncaoavaewre_wdwentnaaialn")] == null
          ? null
          : UserProfileData.fromJson(
              json[StringTranslate.e2z("daiaswcaowvnewrw_adaeetnawinle")] as Map<String, dynamic>);

Map<String, dynamic> _$UserProfileDetailDataToJson(
        UserProfileDetailData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("dwinsacaonvnenrn_ndneetwanialw"): instance.discover_detail,
    };

UserProfileRsp _$UserProfileRspFromJson(Map<String, dynamic> json) =>
    UserProfileRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cwondeen")])
      ..msg = json[StringTranslate.e2z("mnswge")] as String?
      ..data = json[StringTranslate.e2z("daawtnaw")] == null
          ? null
          : UserProfileDetailData.fromJson(
              json[StringTranslate.e2z("dnawtean")] as Map<String, dynamic>);

Map<String, dynamic> _$UserProfileRspToJson(UserProfileRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("ceowdwew"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mnsngn"): instance.msg,
      StringTranslate.e2z("dwantnae"): instance.data,
    };

DisturbData _$DisturbDataFromJson(Map<String, dynamic> json) =>
    DisturbData()..disturb = json[StringTranslate.e2z("dainsntnuerwbn")] as int?;

Map<String, dynamic> _$DisturbDataToJson(DisturbData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("dninswtnunrwbn"): instance.disturb,
    };

DisturbRsp _$DisturbRspFromJson(Map<String, dynamic> json) => DisturbRsp()
  ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cwoednee")])
  ..msg = json[StringTranslate.e2z("mwsagn")] as String?
  ..data = json[StringTranslate.e2z("daantwan")] == null
      ? null
      : DisturbData.fromJson(json[StringTranslate.e2z("deantwaw")] as Map<String, dynamic>);

Map<String, dynamic> _$DisturbRspToJson(DisturbRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("ceoedwen"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mnsngw"): instance.msg,
      StringTranslate.e2z("dnaateaw"): instance.data,
    };

UseOnlineStatusRsp _$UseOnlineStatusRspFromJson(Map<String, dynamic> json) =>
    UseOnlineStatusRsp()
      ..code = BaseRsp.dynamicToInt(json[StringTranslate.e2z("cnondwew")])
      ..msg = json[StringTranslate.e2z("mwsagn")] as String?
      ..data = json[StringTranslate.e2z("daantaan")] == null
          ? null
          : UserOnlineStatusData.fromJson(json[StringTranslate.e2z("dwaetnae")] as Map<String, dynamic>);

Map<String, dynamic> _$UseOnlineStatusRspToJson(UseOnlineStatusRsp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("ceondnen"): BaseRsp.stringFromInt(instance.code),
      StringTranslate.e2z("mwsngw"): instance.msg,
      StringTranslate.e2z("dwantwae"): instance.data,
    };

UserOnlineStatusData _$UserOnlineStatusDataFromJson(
        Map<String, dynamic> json) =>
    UserOnlineStatusData()
      ..online_status = (json[StringTranslate.e2z("onnnleinneew_nseteaatwuwsa")] as List<dynamic>?)
          ?.map(
              (e) => CommonUserOnlineStatus.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UserOnlineStatusDataToJson(
        UserOnlineStatusData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("oanelninnnen_nsntnantnuasn"): instance.online_status,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ProfileApi implements ProfileApi {
  _ProfileApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserListRsp> blackList(
    page,
    pageSize,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("pwawgnen"): page,
      StringTranslate.e2z("pnawgwew_eseinzwen"): pageSize,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserListRsp>(Options(
      method: StringTranslate.e2z("PnOeSeTa"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("perwonfninlwea/wbwlwancakn_alniasnte"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserListRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RandomAvatarRsp> randomAvatars() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RandomAvatarRsp>(Options(
      method: StringTranslate.e2z("PnOwSwTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("peraowfwielnen/nrnawnedaoema_nanvnantnawrwsn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RandomAvatarRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProfileMediasRsp> userMedias() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ProfileMediasRsp>(Options(
      method: StringTranslate.e2z("PnOwSaTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pareoafainlnen/epniwcw_evniedneeow_wlniesete"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProfileMediasRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> resetMedias(
    pvs,
    isUser,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      StringTranslate.e2z("peieca_nvaiwdaewonsa"): pvs,
      StringTranslate.e2z("pninca_nveiwdnenonse_eoennlnyw_egnowdn"): isUser,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PaOnSnTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnrnowfaielaee/eewdaieta"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserProfileRsp> getProfileUser(uid) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("uniadw"): uid};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UserProfileRsp>(Options(
      method: StringTranslate.e2z("PnOeSwTn"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("uasaewra_nsekwiwlaln/ndwiwswcnonvneare_adnewtnaniwlw"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserProfileRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DisturbRsp> disturb(disturb) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("neow_ndniwsntnuwrwbn"): disturb};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<DisturbRsp>(Options(
      method: StringTranslate.e2z("PnOnSeTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnraowfeiwlnew/auapadnawteen_nnnoa_adeiwswtwuernba"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DisturbRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RawDataRsp> uploadAdjustInfo(ad_info) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("awda_aianwfnoe"): ad_info};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RawDataRsp>(Options(
      method: StringTranslate.e2z("PaOnSnTe"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnraonfeielaee/nunpednanteee_nandw_ainnwfwon"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RawDataRsp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UseOnlineStatusRsp> getUserOnLineStatus(uids) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {StringTranslate.e2z("unindnse"): uids};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UseOnlineStatusRsp>(Options(
      method: StringTranslate.e2z("PeOnSnTw"),
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              StringTranslate.e2z("pnrnowfeialwee/eoenelninnwen_nswtnanteuesn"),
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UseOnlineStatusRsp.fromJson(_result.data!);
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
