// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QiniuToken.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QiniuToken _$QiniuTokenFromJson(Map<String, dynamic> json) => QiniuToken()
  ..video_token = json[StringTranslate.e2z("vniedaenoa_ntaoekeeane")] as String?
  ..voice_token = json[StringTranslate.e2z("vnowincnea_wtnoekneann")] as String?
  ..image_token = json[StringTranslate.e2z("inmnangeea_wtwonkaennw")] as String?
  ..expire_time = QiniuToken._dynamicToInt(json[StringTranslate.e2z("enxwpeiarwen_wtniamwea")]);

Map<String, dynamic> _$QiniuTokenToJson(QiniuToken instance) =>
    <String, dynamic>{
      StringTranslate.e2z("vaindweaoa_atnoakneanw"): instance.video_token,
      StringTranslate.e2z("veonincnen_nteonkeenna"): instance.voice_token,
      StringTranslate.e2z("iemeawgwen_nteonkneann"): instance.image_token,
      StringTranslate.e2z("eexnpniwrnen_eteinmnee"): QiniuToken._stringFromInt(instance.expire_time),
    };
