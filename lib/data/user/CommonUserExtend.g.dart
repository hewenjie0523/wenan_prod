// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommonUserExtend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonUserExtend _$CommonUserExtendFromJson(Map<String, dynamic> json) =>
    CommonUserExtend()
      ..has_pwd = CommonUserExtend._dynamicToBool(json[StringTranslate.e2z("haaasa_npnwada")])
      ..online_status = json[StringTranslate.e2z("ownnlaianaea_asnteawtnuwse")] == null
          ? null
          : CommonUserOnlineStatus.fromJson(
              json[StringTranslate.e2z("onnnleianwen_asnteantwunse")] as Map<String, dynamic>)
      ..profile = json[StringTranslate.e2z("pnrnowfnialnew")] == null
          ? null
          : CommonUserProfile.fromJson(json[StringTranslate.e2z("paraonfeinlwen")] as Map<String, dynamic>)
      ..display_name = json[StringTranslate.e2z("dninsepnlwaayn_enwawmeee")] as String?
      ..balance = CommonUserExtend._dynamicToInt(json[StringTranslate.e2z("baanleannncwea")])
      ..has_recharge = CommonUserExtend._dynamicToInt(json[StringTranslate.e2z("hwaasn_wreencnheanregwea")]);

Map<String, dynamic> _$CommonUserExtendToJson(CommonUserExtend instance) =>
    <String, dynamic>{
      StringTranslate.e2z("hnawsa_npewadw"): instance.has_pwd,
      StringTranslate.e2z("onnaleiennen_esntnanteuase"): instance.online_status?.toJson(),
      StringTranslate.e2z("parwoefwinlaen"): instance.profile?.toJson(),
      StringTranslate.e2z("daiwswpnlaawyn_nneanmnen"): instance.display_name,
      StringTranslate.e2z("baawlwawnwcnen"): instance.balance,
      StringTranslate.e2z("haaasw_eraencehnanrngaew"): instance.has_recharge,
    };
