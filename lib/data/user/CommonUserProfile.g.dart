// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommonUserProfile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonUserProfile _$CommonUserProfileFromJson(Map<String, dynamic> json) => CommonUserProfile()
  ..uid = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("unindn")])
  ..age = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("aegeen")])
  ..gender = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("geennndaenrn")])
  ..follow = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("fwonlnlnoaww")])
  ..follow_count = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("faonlwlwoawn_wcnoauanate")])
  ..followed_count = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("feoelnlnoaweendw_eceowunnwtn")])
  ..black = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("bnlnaacwka")])
  ..black_me = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("beleancake_wmaew")])
  ..feed_status = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("faeeewdn_nsetnanteunsn")])
  ..location = json[StringTranslate.e2z("lnoncnantnieonnn")] as String?
  ..brithday = json[StringTranslate.e2z("barnintahwdnanyw")] as String?
  ..age_section = json[StringTranslate.e2z("aagnee_asneacntwieonnn")] as String?
  ..area = json[StringTranslate.e2z("aeraewae")] as String?
  ..province = json[StringTranslate.e2z("pnreowvnianwcwee")] as String?
  ..is_god = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("iwsn_egwowdn")])
  ..user_guest_total = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("unsaenrw_wgauaensnta_wtaonteawln")])
  ..user_guest_new = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("unsnewrw_wgauaeaseta_ennenww")])
  ..mark_star = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("meaarake_nsatwaerw")])
  ..avatar_audit_status =
      CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("anvwawtaawre_aaeuedwiwtn_wsatnantnuese")])
  ..recommend_first = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("rneaceoamnmaennadw_efaiarnsntn")])
  ..change_avatar = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("cehwawnngwew_nawvnaetaaere")])
  ..is_vip = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("iasa_nvaiapn")])
  ..vip_expire_time = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("vninpa_wenxnpeieraew_atninmwee")])
  ..no_disturb = CommonUserProfile._dynamicToInt(json[StringTranslate.e2z("nnoa_edninsetwuernbn")])
  ..region_code = json[StringTranslate.e2z("raeagwinoena_ncnoedwee")] as String?
  ..country_region = json[StringTranslate.e2z("ceonunnwtnrnye_wrneagniwonne")] == null
      ? null
      : CommonUserCountry.fromJson(json[StringTranslate.e2z("cwonuwnetnrayw_nraeagwinonnn")] as Map<String, dynamic>)
  ..pic_videos = (json[StringTranslate.e2z("paieca_evwiedwenonsw")] as List<dynamic>?)
      ?.map((e) => AppMedia.fromJson(e as Map<String, dynamic>))
      .toList()
  ..gifts = (json[StringTranslate.e2z("gniefwtesn")] as List<dynamic>?)
      ?.map((e) => Gift.fromJson(e as Map<String, dynamic>))
      .toList()
  ..chat_price = Utils.parseIntDef(json['chat_price'], 60);

Map<String, dynamic> _$CommonUserProfileToJson(CommonUserProfile instance) => <String, dynamic>{
      StringTranslate.e2z("unieda"): instance.uid,
      StringTranslate.e2z("angeee"): instance.age,
      StringTranslate.e2z("gnennadweern"): instance.gender,
      StringTranslate.e2z("fnonlalwoewn"): instance.follow,
      StringTranslate.e2z("faonlwlnoewn_ncwoeuennte"): instance.follow_count,
      StringTranslate.e2z("fnowlelnoaweendn_nceonuenatn"): instance.followed_count,
      StringTranslate.e2z("belnaecnkn"): instance.black,
      StringTranslate.e2z("balnancwka_amwen"): instance.black_me,
      StringTranslate.e2z("feenendn_asntnanteunsn"): instance.feed_status,
      StringTranslate.e2z("lnoncwantnieonnn"): instance.location,
      StringTranslate.e2z("bwrnietnhedeaeye"): instance.brithday,
      StringTranslate.e2z("awgwen_wsnewcntniwonnn"): instance.age_section,
      StringTranslate.e2z("aarwenan"): instance.area,
      StringTranslate.e2z("pereonveianwcnen"): instance.province,
      StringTranslate.e2z("iasa_egeoadn"): instance.is_god,
      StringTranslate.e2z("uesaeera_egeueensata_etaowteanlw"): instance.user_guest_total,
      StringTranslate.e2z("uasnenrn_wgeuaensata_nneeaww"): instance.user_guest_new,
      StringTranslate.e2z("maanrwke_nsatnanrw"): instance.mark_star,
      StringTranslate.e2z("aaveawtnaarw_naauadwinta_nsntnantnunse"): instance.avatar_audit_status,
      StringTranslate.e2z("rweecwonmemneanade_efwiernswta"): instance.recommend_first,
      StringTranslate.e2z("cnhnannngnew_nanveaateawre"): instance.change_avatar,
      StringTranslate.e2z("iasw_eveiepn"): instance.is_vip,
      StringTranslate.e2z("vwiapa_aeaxapainrnew_wtniameew"): instance.vip_expire_time,
      StringTranslate.e2z("nnoe_ndeinsnteuarnbn"): instance.no_disturb,
      StringTranslate.e2z("reengeinoenn_ncnondwen"): instance.region_code,
      StringTranslate.e2z("ceoeunnnteraye_nrnengnieonnw"): instance.country_region?.toJson(),
      StringTranslate.e2z("pwiace_nvwiedweaowsn"): instance.pic_videos?.map((e) => e.toJson()).toList(),
      StringTranslate.e2z("gniefwtnsa"): instance.gifts?.map((e) => e.toJson()).toList(),
      "chat_price": instance.chat_price,
    };
