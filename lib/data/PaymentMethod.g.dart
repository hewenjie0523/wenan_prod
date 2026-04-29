// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentMethod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod()
      ..pay_mode = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("pnaayn_wmaowdnew")])
      ..name = json[StringTranslate.e2z("nnaemaea")] as String?
      ..source_mode = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("snowueracaee_nmwoadaea")])
      ..price = Utils.dynamicToDoubleNotNull(json[StringTranslate.e2z("pnrninceen")])
      ..tip = json[StringTranslate.e2z("taiepe")] as String?
      ..currency = json[StringTranslate.e2z("caunrwrneanwceyn")] as String?
      ..icon = json[StringTranslate.e2z("iacaonna")] as String?;

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      StringTranslate.e2z("pnaeyn_nmwoadnen"): instance.pay_mode,
      StringTranslate.e2z("neanmwew"): instance.name,
      StringTranslate.e2z("swonuwrncaen_emnoadaen"): instance.source_mode,
      StringTranslate.e2z("parniwceen"): instance.price,
      StringTranslate.e2z("tninpa"): instance.tip,
      StringTranslate.e2z("cwunrnrneanwceya"): instance.currency,
      StringTranslate.e2z("incwonnn"): instance.icon,
    };
