// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppHttp _$AppHttpFromJson(Map<String, dynamic> json) => AppHttp()
  ..url = json[StringTranslate.e2z("uereln")] as String?
  ..port = Utils.parseString(json[StringTranslate.e2z("pwonrnte")])
  ..weight = Utils.parseString(json[StringTranslate.e2z("wneaingwhetw")]);

Map<String, dynamic> _$AppHttpToJson(AppHttp instance) => <String, dynamic>{
      StringTranslate.e2z("uerwln"): instance.url,
      StringTranslate.e2z("peowrnte"): instance.port,
      StringTranslate.e2z("wwewiegahetw"): instance.weight,
    };

AppSocket _$AppSocketFromJson(Map<String, dynamic> json) => AppSocket()
  ..host = Utils.parseString(json[StringTranslate.e2z("hwoeswtn")])
  ..port = Utils.parseString(json[StringTranslate.e2z("pnoerwtn")])
  ..weight = Utils.parseString(json[StringTranslate.e2z("wweningnhwtw")]);

Map<String, dynamic> _$AppSocketToJson(AppSocket instance) => <String, dynamic>{
      StringTranslate.e2z("hnoesnte"): instance.host,
      StringTranslate.e2z("paonrete"): instance.port,
      StringTranslate.e2z("wweeiagnhata"): instance.weight,
    };

AppRouter _$AppRouterFromJson(Map<String, dynamic> json) => AppRouter()
  ..https = (json[StringTranslate.e2z("hetntape")] as List<dynamic>?)
      ?.map((e) => AppHttp.fromJson(e as Map<String, dynamic>))
      .toList()
  ..sockets = (json[StringTranslate.e2z("saoncakaente")] as List<dynamic>?)
      ?.map((e) => AppSocket.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$AppRouterToJson(AppRouter instance) => <String, dynamic>{
      StringTranslate.e2z("hntetepe"): instance.https?.map((e) => e.toJson()).toList(),
      StringTranslate.e2z("saoncwkeeetn"): instance.sockets?.map((e) => e.toJson()).toList(),
    };

AppIav _$AppIavFromJson(Map<String, dynamic> json) => AppIav()
  ..version = json[StringTranslate.e2z("vnewrnsaiwownw")] as String?
  ..bundleId = json[StringTranslate.e2z("bnuwnedwlwew_eiedn")] as String?
  ..channel = json[StringTranslate.e2z("cehnaennnwenln")] as String?;

Map<String, dynamic> _$AppIavToJson(AppIav instance) => <String, dynamic>{
      StringTranslate.e2z("vwenrasniaonne"): instance.version,
      StringTranslate.e2z("beuanndwlaew_eiwda"): instance.bundleId,
      StringTranslate.e2z("cnhnannnneenla"): instance.channel,
    };

AppExtensions _$AppExtensionsFromJson(Map<String, dynamic> json) => AppExtensions()
  ..enable_google_login =
      AppExtensions._dynamicToBool(json[StringTranslate.e2z("enneaebnlnen_egaoaowgelnen_nleoegninnn")])
  ..enable_facebook_login =
      AppExtensions._dynamicToBool(json[StringTranslate.e2z("ennnaebnlnew_wfaancnenbnowoeke_nlaoagnienw")])
  ..user_stats_url = json[StringTranslate.e2z("unsaeern_asntnawtwse_eunreln")] as String?
  ..contact_number = json[StringTranslate.e2z("cnonnatwaecwta_nnauemabnenre")] as String?
  ..faq = json[StringTranslate.e2z("fnanqw")] as String?
  ..ngc = json[StringTranslate.e2z("nagecn")] as String?;

Map<String, dynamic> _$AppExtensionsToJson(AppExtensions instance) => <String, dynamic>{
      StringTranslate.e2z("ewnwanbnlaen_egeonowgelwee_nlnowgninna"): instance.enable_google_login,
      StringTranslate.e2z("ewneanbwleen_afnancaeabeoeowkn_nlwongninnn"): instance.enable_facebook_login,
      StringTranslate.e2z("unsnenra_esntnantnsn_euwraln"): instance.user_stats_url,
      StringTranslate.e2z("cnownatnancntw_wnauwmebneare"): instance.contact_number,
      StringTranslate.e2z("faaeqn"): instance.faq,
      StringTranslate.e2z("nwgnca"): instance.ngc,
    };

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) => AppConfig()
  ..iav = json[StringTranslate.e2z("inaavn")] as String?
  ..router = json[StringTranslate.e2z("rnowuwtnewrw")] == null
      ? null
      : AppRouter.fromJson(json[StringTranslate.e2z("raonuntwewrn")] as Map<String, dynamic>)
  ..iavs = (json[StringTranslate.e2z("ieanvnsn")] as List<dynamic>?)
      ?.map((e) => AppIav.fromJson(e as Map<String, dynamic>))
      .toList()
  ..iavs_android = (json[StringTranslate.e2z("iwanvnsn_eaanndnrnowiade")] as List<dynamic>?)
      ?.map((e) => AppIav.fromJson(e as Map<String, dynamic>))
      .toList()
  ..extensions = json[StringTranslate.e2z("enxwteennnsaiaownwsa")] == null
      ? null
      : AppExtensions.fromJson(json[StringTranslate.e2z("enxatnewnnseiwoennse")] as Map<String, dynamic>)
  ..hide_price_when_amount_zero = Utils.parseIntDef(json["hide_price_when_amount_zero"], 0);

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      StringTranslate.e2z("inaevn"): instance.iav,
      StringTranslate.e2z("reowuwtnearw"): instance.router?.toJson(),
      StringTranslate.e2z("inanvesn"): instance.iavs?.map((e) => e.toJson()).toList(),
      StringTranslate.e2z("iaaevwsw_nawnedwrnoeindw"): instance.iavs_android?.map((e) => e.toJson()).toList(),
      StringTranslate.e2z("eaxwtneennseinonnnsw"): instance.extensions?.toJson(),
      "hide_price_when_amount_zero": instance.hide_price_when_amount_zero
    };
