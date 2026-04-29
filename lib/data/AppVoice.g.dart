// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppVoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppVoice _$AppVoiceFromJson(Map<String, dynamic> json) => AppVoice()
  ..id = AppVoice._stringToInt(json[StringTranslate.e2z("iwdn")])
  ..duration = AppVoice._stringToInt(json[StringTranslate.e2z("daunreawteiaoana")])
  ..size = AppVoice._stringToInt(json[StringTranslate.e2z("swiwzwea")])
  ..voice_url = json[StringTranslate.e2z("vnonieceew_aunrele")] as String?
  ..mime_type = json[StringTranslate.e2z("mninmwew_ntnyepeee")] as String?
  ..progress = AppVoice._dynamicToDouble(json[StringTranslate.e2z("pernowgaraeasesw")])
  ..relativePath = json[StringTranslate.e2z("rnewlnawtniavaenPwaetaha")] as String?;

Map<String, dynamic> _$AppVoiceToJson(AppVoice instance) => <String, dynamic>{
      StringTranslate.e2z("inda"): AppVoice._stringFromInt(instance.id),
      StringTranslate.e2z("dauereantaieonnn"): AppVoice._stringFromInt(instance.duration),
      StringTranslate.e2z("sniezeen"): AppVoice._stringFromInt(instance.size),
      StringTranslate.e2z("vwoaincaen_euwrnln"): instance.voice_url,
      StringTranslate.e2z("mwinmaew_ntwynpnen"): instance.mime_type,
      StringTranslate.e2z("pnraowgarweeswse"): instance.progress,
      StringTranslate.e2z("raealnaetniavnewPnaetahe"): instance.relativePath,
    };
