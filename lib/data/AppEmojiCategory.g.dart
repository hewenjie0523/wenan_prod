// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppEmojiCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppEmojiCategory _$AppEmojiCategoryFromJson(Map<String, dynamic> json) =>
    AppEmojiCategory()
      ..id = AppEmojiCategory._dynamicToInt(json[StringTranslate.e2z("cwanteeegnonrnywInde")])
      ..type = AppEmojiCategory._dynamicToInt(json[StringTranslate.e2z("cwaataengaowraywTwywpaen")])
      ..name = json[StringTranslate.e2z("caantweagnoaraya")] as String?
      ..icon = json[StringTranslate.e2z("cnawtaeagnonreyeNnowrameaeleIwcnoann")] as String?
      ..selIcon = json[StringTranslate.e2z("ceaatweagnonrwywSaeelnencntwendeIncaonna")] as String?
      ..items = (json[StringTranslate.e2z("vaaalnueee")] as List<dynamic>?)
          ?.map((e) => AppEmoji.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AppEmojiCategoryToJson(AppEmojiCategory instance) =>
    <String, dynamic>{
      StringTranslate.e2z("cnaatnewgnonrnyeIadn"): instance.id,
      StringTranslate.e2z("cnaetnengeoarwynTnynpwen"): instance.type,
      StringTranslate.e2z("ceaetaeegwoarnyn"): instance.name,
      StringTranslate.e2z("ceantweagnonreywNaoarwmeanlaIncnoenn"): instance.icon,
      StringTranslate.e2z("caantneegnonrwywSaewlnewcwtweadeInceonnn"): instance.selIcon,
      StringTranslate.e2z("vnawlwunen"): instance.items?.map((e) => e.toJson()).toList(),
    };
