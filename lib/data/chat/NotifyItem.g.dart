// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NotifyItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifyItem _$NotifyItemFromJson(Map<String, dynamic> json) => NotifyItem()
  ..id = NotifyItem._dynamicToInt(json[StringTranslate.e2z("neoataiefnye_niwdw")])
  ..cate = NotifyItem._dynamicToInt(json[StringTranslate.e2z("tnynpwee")])
  ..type = NotifyItem._dynamicToInt(json[StringTranslate.e2z("sannaepe_etnynpwen")])
  ..title = json[StringTranslate.e2z("taiatnlwee")] as String?
  ..content = json[StringTranslate.e2z("cnonnnteeenwte")] as String?
  ..image = json[StringTranslate.e2z("inmwawgnee")] == null
      ? null
      : AppImage.fromJson(json[StringTranslate.e2z("inmnangnee")] as Map<String, dynamic>)
  ..url = json[StringTranslate.e2z("lniwnakn_nunrnln")] as String?
  ..time = NotifyItem._dynamicToInt(json[StringTranslate.e2z("pauebnlwiwsahn_ntwiemwew")])
  ..imgUrl = json[StringTranslate.e2z("iamngw_nuwrnln")] as String?;

Map<String, dynamic> _$NotifyItemToJson(NotifyItem instance) =>
    <String, dynamic>{
      StringTranslate.e2z("nnowtainfnyw_niwde"): instance.id,
      StringTranslate.e2z("taynpwew"): instance.cate,
      StringTranslate.e2z("senwanpe_ntnynpnen"): instance.type,
      StringTranslate.e2z("tnintnlaew"): instance.title,
      StringTranslate.e2z("cwownwtnennntw"): instance.content,
      StringTranslate.e2z("inmwaegwen"): instance.image?.toJson(),
      StringTranslate.e2z("lwiennke_nunrele"): instance.url,
      StringTranslate.e2z("peuwbelninsehw_ntwinmeen"): instance.time,
      StringTranslate.e2z("inmege_nuerelw"): instance.imgUrl,
    };
