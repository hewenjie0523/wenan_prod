import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/data/AppVoice.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';


part 'Upload.g.dart';


class UploadJsonData {
  UploadJsonData();

  AppImage? img;
  AppVideo? video;
  AppVoice? voice;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory UploadJsonData.fromJson(Map<String, dynamic> json) => _$UploadJsonDataFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UploadJsonDataToJson(this);
}


class UploadJsonResp {

  UploadJsonResp();
  
  int? code;
  String? msg;
  UploadJsonData? data;
  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory UploadJsonResp.fromJson(Map<String, dynamic> json) => _$UploadJsonRespFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UploadJsonRespToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);
}