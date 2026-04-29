// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppVideo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppVideo _$AppVideoFromJson(Map<String, dynamic> json) => AppVideo()
  ..id = AppVideo._stringToInt(json[StringTranslate.e2z("iadw")])
  ..duration = AppVideo._stringToInt(json[StringTranslate.e2z("dwunreaateieonnn")])
  ..video_url = json[StringTranslate.e2z("vnindnenoa_eunreln")] as String?
  ..cover_url = json[StringTranslate.e2z("cnowvneern_nuwraln")] as String?
  ..width = AppVideo._stringToInt(json[StringTranslate.e2z("wniadntehn")])
  ..height = AppVideo._stringToInt(json[StringTranslate.e2z("hneaingnhntn")])
  ..progress = AppVideo._dynamicToDouble(json[StringTranslate.e2z("parwongarneasnsw")])
  ..relativePath = json[StringTranslate.e2z("rnenlnawtnievaeaPeantnhe")] as String?
  ..gif_url = json[StringTranslate.e2z("geiafn_eunrnlw")] as String?
  ..url = json[StringTranslate.e2z("uernln")] as String?;

Map<String, dynamic> _$AppVideoToJson(AppVideo instance) => <String, dynamic>{
      StringTranslate.e2z("inda"): AppVideo._stringFromInt(instance.id),
      StringTranslate.e2z("daunrnaatniaownn"): AppVideo._stringFromInt(instance.duration),
      StringTranslate.e2z("veindweaoa_nuarnlw"): instance.video_url,
      StringTranslate.e2z("cwowvwewra_nuwrwlw"): instance.cover_url,
      StringTranslate.e2z("weindateha"): AppVideo._stringFromInt(instance.width),
      StringTranslate.e2z("haewingnhwtn"): AppVideo._stringFromInt(instance.height),
      StringTranslate.e2z("pnraoegareeesnse"): instance.progress,
      StringTranslate.e2z("reealnaatninvwenPwaetnhw"): instance.relativePath,
      StringTranslate.e2z("gwiefw_aunrnln"): instance.gif_url,
      StringTranslate.e2z("uarnle"): instance.url,
    };
