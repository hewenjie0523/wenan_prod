
part of 'MatchVideoFindItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchVideoFindItem _$FeedItemFromJson(Map<String, dynamic> json) => MatchVideoFindItem()
  ..id = MatchVideoFindItem._dynamicToInt(json[StringTranslate.e2z("ieda")])
  ..user = json[StringTranslate.e2z("unseenrn")] == null
      ? null
      : CommonUser.fromJson(json[StringTranslate.e2z("unsaeern")] as Map<String, dynamic>)

  ..video = json[StringTranslate.e2z("veindwewow")] == null
      ? null
      : AppVideo.fromJson(json[StringTranslate.e2z("vwiwdnenon")] as Map<String, dynamic>);

Map<String, dynamic> _$FeedItemToJson(MatchVideoFindItem instance) => <String, dynamic>{
  StringTranslate.e2z("ieda"): MatchVideoFindItem._stringFromInt(instance.id),
  StringTranslate.e2z("unsaeern"): instance.user?.toJson(),
  StringTranslate.e2z("veindwewow"): instance.video,
};
