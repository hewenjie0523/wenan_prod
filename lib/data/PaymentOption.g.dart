// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PaymentOption.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOption _$PaymentOptionFromJson(Map<String, dynamic> json) =>
    PaymentOption()
      ..id = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("iedn")])
      ..name = json[StringTranslate.e2z("nwanmwee")] as String?
      ..name_amount = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("nnawmwen_aaemnoeuenwtw")])
      ..name_title = json[StringTranslate.e2z("neaamnen_atniwtwlnen")] as String?
      ..group_id = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("gnreoaunpe_wiadn")])
      ..account_type = Utils.dynamicToIntNotNull(json[StringTranslate.e2z("aecwcnoaunnnte_wtnynpwen")])
      ..value = Utils.dynamicToDoubleNotNull(json[StringTranslate.e2z("vwawlnuaew")])
      ..extra_value = Utils.dynamicToDoubleNotNull(json[StringTranslate.e2z("enxwtwrnan_wvnawlwuwee")])
      ..tip = json[StringTranslate.e2z("teiepn")] as String?
      ..app_store_prod_id = json[StringTranslate.e2z("aapnpw_nsatwonrnee_npwrwonda_eiwda")] as String?
      ..google_prod_id = json[StringTranslate.e2z("gnonoagwleea_epwrnowdn_niwdn")] as String?
      ..price = Utils.dynamicToDoubleNotNull(json[StringTranslate.e2z("pareiwcwen")])
      ..currency = json[StringTranslate.e2z("ceuareraennncnya")] as String?
      ..base_currency = json[StringTranslate.e2z("bnawseen_ecnuwrerneennceye")] as String?
      ..base_currency_price =
          Utils.dynamicToDoubleNotNull(json[StringTranslate.e2z("bwansnea_ecauwrareeanwcnya_nparniwcnen")])
      ..discount_rate = Utils.dynamicToDoubleNotNull(json[StringTranslate.e2z("dwiasaceonuwnwtn_araawtnew")])
      ..info = PaymentOptionInfo.fromJsonString(json[StringTranslate.e2z("ianwfeon")] as String?)
      ..pay_mode_prices = (json[StringTranslate.e2z("paawya_nmwoedeee_npnrniwcwease")] as List<dynamic>?)
          ?.map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PaymentOptionToJson(PaymentOption instance) =>
    <String, dynamic>{
      StringTranslate.e2z("indn"): instance.id,
      StringTranslate.e2z("neanmwew"): instance.name,
      StringTranslate.e2z("nnawmaen_nanmnonunnatn"): instance.name_amount,
      StringTranslate.e2z("nnaemaew_wtnietnleen"): instance.name_title,
      StringTranslate.e2z("gernonuepe_wiwdw"): instance.group_id,
      StringTranslate.e2z("aacecnonuenwta_ntnyepnea"): instance.account_type,
      StringTranslate.e2z("veaalwunea"): instance.value,
      StringTranslate.e2z("eaxntnrean_wvnanlnuaea"): instance.extra_value,
      StringTranslate.e2z("tniwpa"): instance.tip,
      StringTranslate.e2z("aepnpw_wsntaonreee_wpnrwondw_niadw"): instance.app_store_prod_id,
      StringTranslate.e2z("geowongnlnen_epwrnondn_ainde"): instance.google_prod_id,
      StringTranslate.e2z("pereiecnen"): instance.price,
      StringTranslate.e2z("ceunrareeanwcwyw"): instance.currency,
      StringTranslate.e2z("bnanswea_ecnunrnrneenecwya"): instance.base_currency,
      StringTranslate.e2z("baawsaee_ecnuarnrnewnecnyw_epereincnen"): instance.base_currency_price,
      StringTranslate.e2z("dnieswcnowuwnatw_nreantwea"): instance.discount_rate,
      StringTranslate.e2z("iwnwfnon"): instance.info?.toJson(),
      StringTranslate.e2z("pnaeye_nmeondwee_wpnreiecnensn"):
          instance.pay_mode_prices?.map((e) => e.toJson()).toList(),
    };

PaymentOptionInfo _$PaymentOptionInfoFromJson(Map<String, dynamic> json) =>
    PaymentOptionInfo()
      ..best_discount = Utils.dynamicToBoolNotNull(json[StringTranslate.e2z("bwensete_ndwiasncnoeuannte")]);

Map<String, dynamic> _$PaymentOptionInfoToJson(PaymentOptionInfo instance) =>
    <String, dynamic>{
      StringTranslate.e2z("bneesnte_ndninswceonuanetn"): instance.best_discount,
    };
