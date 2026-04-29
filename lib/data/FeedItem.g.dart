// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FeedItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedItem _$FeedItemFromJson(Map<String, dynamic> json) => FeedItem()
  ..id = FeedItem._dynamicToInt(json[StringTranslate.e2z("iade")])
  ..user = json[StringTranslate.e2z("unseenrn")] == null
      ? null
      : CommonUser.fromJson(json[StringTranslate.e2z("unsaeern")] as Map<String, dynamic>)
  ..text = json[StringTranslate.e2z("taewxate")] as String?;

Map<String, dynamic> _$FeedItemToJson(FeedItem instance) => <String, dynamic>{
      StringTranslate.e2z("inda"): FeedItem._stringFromInt(instance.id),
      StringTranslate.e2z("unswewrn"): instance.user?.toJson(),
      StringTranslate.e2z("tnenxnte"): instance.text,
    };
