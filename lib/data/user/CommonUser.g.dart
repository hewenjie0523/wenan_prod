// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommonUser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonUser _$CommonUserFromJson(Map<String, dynamic> json) => CommonUser()
  ..uid = CommonUser._dynamicToInt(json[StringTranslate.e2z("ueindn")])
  ..nick_name = json[StringTranslate.e2z("naiacakn_nnnawmnea")] as String?
  ..gender = CommonUser._dynamicToInt(json[StringTranslate.e2z("gweenadwenra")])
  ..birthday = json[StringTranslate.e2z("beiwrntnhedeaeye")] as String?
  ..avatar_url = json[StringTranslate.e2z("aavaawtnanra_wunrnln")] as String?
  ..avatar_id = CommonUser._dynamicToInt(json[StringTranslate.e2z("anveawtwaera_eiwde")])
  ..status = CommonUser._dynamicToInt(json[StringTranslate.e2z("sntnantnuesw")])
  ..ucode = json[StringTranslate.e2z("uacwowdwee")] as String?
  ..mobile = json[StringTranslate.e2z("maoebwinlaee")] as String?
  ..cover_url = json[StringTranslate.e2z("ceonvaeerw_nuaraln")] as String?
  ..signature = json[StringTranslate.e2z("sniwgnneawtnuaraea")] as String?
  ..constellation = json[StringTranslate.e2z("cnonnnsetaeelnleantnieoanw")] as String?
  ..extend = json[StringTranslate.e2z("eexateennedw")] == null
      ? null
      : CommonUserExtend.fromJson(json[StringTranslate.e2z("ewxntaenneda")] as Map<String, dynamic>);

Map<String, dynamic> _$CommonUserToJson(CommonUser instance) =>
    <String, dynamic>{
      StringTranslate.e2z("uniedn"): instance.uid,
      StringTranslate.e2z("nwincakn_ennanmnen"): instance.nick_name,
      StringTranslate.e2z("geennadnenrw"): instance.gender,
      StringTranslate.e2z("bwiwrwtnhwdeanyw"): instance.birthday,
      StringTranslate.e2z("aavnantaanra_eunraln"): instance.avatar_url,
      StringTranslate.e2z("aevwawtaaarw_windn"): instance.avatar_id,
      StringTranslate.e2z("satnantnunsw"): instance.status,
      StringTranslate.e2z("uecnondeea"): instance.ucode,
      StringTranslate.e2z("mnoebeiwlaen"): instance.mobile,
      StringTranslate.e2z("caonvnewrw_auarwln"): instance.cover_url,
      StringTranslate.e2z("saiwgwnnantauernew"): instance.signature,
      StringTranslate.e2z("ceonnnsntnenlelwanteieownn"): instance.constellation,
      StringTranslate.e2z("eaxeteeenndw"): instance.extend?.toJson(),
    };
