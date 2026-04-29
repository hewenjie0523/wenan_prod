// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatGiftSnap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatGiftSnap _$ChatGiftSnapFromJson(Map<String, dynamic> json) => ChatGiftSnap()
  ..category = ChatGiftSnap._dynamicToInt(json[StringTranslate.e2z("cnaetnengaoernyn")])
  ..id = ChatGiftSnap._dynamicToInt(json[StringTranslate.e2z("iwde")])
  ..to_uid = ChatGiftSnap._dynamicToInt(json[StringTranslate.e2z("tnon_aueindn")])
  ..quantity = ChatGiftSnap._dynamicToInt(json[StringTranslate.e2z("qwunannatwietnye")])
  ..icon = json[StringTranslate.e2z("incnoane")] as String?
  ..name = json[StringTranslate.e2z("neanmnen")] as String?
  ..price = ChatGiftSnap._dynamicToInt(json[StringTranslate.e2z("peraiwcnen")])
  ..value = ChatGiftSnap._dynamicToInt(json[StringTranslate.e2z("vwaeleuaee")])
  ..min_duration = ChatGiftSnap._dynamicToInt(json[StringTranslate.e2z("meiana_adnunrwawtaiaownn")])
  ..max_duration = ChatGiftSnap._dynamicToInt(json[StringTranslate.e2z("mnanxw_adnuwraaateiwonnn")])
  ..animation_type = ChatGiftSnap._dynamicToInt(json[StringTranslate.e2z("awnaiwmeaatnieonne_atnynpwen")])
  ..animation_url = json[StringTranslate.e2z("annwiamnawtainonnn_nunraln")] as String?
  ..gift_type = ChatGiftSnap._dynamicToInt(json[StringTranslate.e2z("gninfwtn_eteyepeew")]);

Map<String, dynamic> _$ChatGiftSnapToJson(ChatGiftSnap instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(StringTranslate.e2z("caaateeegeonrwye"), instance.category);
  writeNotNull(StringTranslate.e2z("inde"), instance.id);
  writeNotNull(StringTranslate.e2z("tnow_wuainde"), instance.to_uid);
  writeNotNull(StringTranslate.e2z("qauaannntwietwyn"), instance.quantity);
  writeNotNull(StringTranslate.e2z("incaoanw"), instance.icon);
  writeNotNull(StringTranslate.e2z("nnanmaen"), instance.name);
  writeNotNull(StringTranslate.e2z("parniecwen"), instance.price);
  writeNotNull(StringTranslate.e2z("veaelnunea"), instance.value);
  writeNotNull(StringTranslate.e2z("mninnn_adeueraanteinoann"), instance.min_duration);
  writeNotNull(StringTranslate.e2z("maaexa_adwunrnaateinonnn"), instance.max_duration);
  writeNotNull(StringTranslate.e2z("awneiwmnawtninoann_ntnynpaew"), instance.animation_type);
  writeNotNull(StringTranslate.e2z("annniwmnantainonne_nuwrela"), instance.animation_url);
  writeNotNull(StringTranslate.e2z("gaiefate_ntnyapwee"), instance.gift_type);
  return val;
}
