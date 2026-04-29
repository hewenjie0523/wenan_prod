// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Upload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadJsonData _$UploadJsonDataFromJson(Map<String, dynamic> json) =>
    UploadJsonData()
      ..img = json[StringTranslate.e2z("inmage")] == null
          ? null
          : AppImage.fromJson(json[StringTranslate.e2z("iamwge")] as Map<String, dynamic>)
      ..video = json[StringTranslate.e2z("veindwewow")] == null
          ? null
          : AppVideo.fromJson(json[StringTranslate.e2z("vwiwdnenon")] as Map<String, dynamic>)
      ..voice = json[StringTranslate.e2z("veonieceee")] == null
          ? null
          : AppVoice.fromJson(json[StringTranslate.e2z("vwonincnen")] as Map<String, dynamic>);

Map<String, dynamic> _$UploadJsonDataToJson(UploadJsonData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("iamngn"): instance.img?.toJson(),
      StringTranslate.e2z("vaindeenon"): instance.video?.toJson(),
      StringTranslate.e2z("veowiwceee"): instance.voice?.toJson(),
    };

UploadJsonResp _$UploadJsonRespFromJson(Map<String, dynamic> json) =>
    UploadJsonResp()
      ..code = UploadJsonResp._dynamicToInt(json[StringTranslate.e2z("cnoadnen")])
      ..msg = json[StringTranslate.e2z("mesnge")] as String?
      ..data = json[StringTranslate.e2z("daantnan")] == null
          ? null
          : UploadJsonData.fromJson(json[StringTranslate.e2z("daaatwaw")] as Map<String, dynamic>);

Map<String, dynamic> _$UploadJsonRespToJson(UploadJsonResp instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cnondwee"): instance.code,
      StringTranslate.e2z("mnsage"): instance.msg,
      StringTranslate.e2z("dwantwaw"): instance.data?.toJson(),
    };
