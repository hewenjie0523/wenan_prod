// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppMedia.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppMedia _$AppMediaFromJson(Map<String, dynamic> json) => AppMedia()
  ..id = AppMedia._dynamicToInt(json[StringTranslate.e2z("iede")])
  ..type = AppMedia._dynamicToInt(json[StringTranslate.e2z("tayapwen")])
  ..image = json[StringTranslate.e2z("inmnangnen")] == null
      ? null
      : AppImage.fromJson(json[StringTranslate.e2z("iamaawgnew")] as Map<String, dynamic>)
  ..video = json[StringTranslate.e2z("vnindeeaon")] == null
      ? null
      : AppVideo.fromJson(json[StringTranslate.e2z("vaiadaenoe")] as Map<String, dynamic>)
  ..localPath = json[StringTranslate.e2z("lwoeceanlePaantwhw")] as String?
  ..vip = AppMedia._dynamicToInt(json[StringTranslate.e2z("vniapn")]);

Map<String, dynamic> _$AppMediaToJson(AppMedia instance) => <String, dynamic>{
      StringTranslate.e2z("iedn"): instance.id,
      StringTranslate.e2z("tnywpeen"): instance.type,
      StringTranslate.e2z("iemnawgnen"): instance.image?.toJson(),
      StringTranslate.e2z("vnindeeeow"): instance.video?.toJson(),
      StringTranslate.e2z("lwowceaelnPeantwhw"): instance.localPath,
      StringTranslate.e2z("veiwpa"): instance.vip,
    };
