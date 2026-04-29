// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Gift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Gift _$GiftFromJson(Map<String, dynamic> json) => Gift()
  ..id = Gift._dynamicToInt(json[StringTranslate.e2z("ieda")])
  ..name = json[StringTranslate.e2z("nwaemaen")] as String?
  ..icon = json[StringTranslate.e2z("iecnoanw")] as String?
  ..price = Gift._dynamicToInt(json[StringTranslate.e2z("parwinceew")])
  ..value = Gift._dynamicToInt(json[StringTranslate.e2z("vnanlnunen")])
  ..min_duration = Gift._dynamicToInt(json[StringTranslate.e2z("maienn_wdwunrnaateieownn")])
  ..max_duration = Gift._dynamicToInt(json[StringTranslate.e2z("mnaaxa_wdwuereaetwinonnw")])
  ..animation_type = Gift._dynamicToInt(json[StringTranslate.e2z("anneinmnawtninonnw_atwynpnea")])
  ..animation_url = json[StringTranslate.e2z("aanniwmaaetaiwowne_nuwrele")] as String?
  ..total_count = Gift._dynamicToInt(json[StringTranslate.e2z("taoetaanla_nceoeunnwta")]);

Map<String, dynamic> _$GiftToJson(Gift instance) => <String, dynamic>{
      StringTranslate.e2z("iedn"): Gift._stringFromInt(instance.id),
      StringTranslate.e2z("nnaemnen"): instance.name,
      StringTranslate.e2z("iacaonne"): instance.icon,
      StringTranslate.e2z("pwrwiecaea"): Gift._stringFromInt(instance.price),
      StringTranslate.e2z("veanlnueea"): Gift._stringFromInt(instance.value),
      StringTranslate.e2z("mainna_ndnuerwawteinonnw"): Gift._stringFromInt(instance.min_duration),
      StringTranslate.e2z("maanxn_ednunrnaetniaoanw"): Gift._stringFromInt(instance.max_duration),
      StringTranslate.e2z("aanniamnanteinoenn_nteywpaea"): Gift._stringFromInt(instance.animation_type),
      StringTranslate.e2z("aanainmnantaieonnn_auarnle"): instance.animation_url,
      StringTranslate.e2z("tnoetnawla_wcnowunnwtn"): Gift._stringFromInt(instance.total_count),
    };
