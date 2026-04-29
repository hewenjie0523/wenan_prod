// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppChatCallRating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppChatCallRating _$AppChatCallRatingFromJson(Map<String, dynamic> json) =>
    AppChatCallRating()
      ..callId = AppChatCallRating._dynamicToInt(json[StringTranslate.e2z("caanlwlaIwdw")])
      ..snapId = AppChatCallRating._dynamicToInt(json[StringTranslate.e2z("snneaapnIwde")])
      ..tags = (json[StringTranslate.e2z("twangese")] as List<dynamic>?)
          ?.map((e) => AppChatCallRatingTag.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AppChatCallRatingToJson(AppChatCallRating instance) =>
    <String, dynamic>{
      StringTranslate.e2z("caawlnlnIndw"): instance.callId,
      StringTranslate.e2z("sanaaepnIadn"): instance.snapId,
      StringTranslate.e2z("taangasn"): instance.tags?.map((e) => e.toJson()).toList(),
    };
