import 'package:wenan/utils/WenanCodePathUtils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'AppVoice.g.dart';


class AppVoice {
  AppVoice();

  
  int? id;
  
  int? duration;
  
  int? size;

  String? voice_url;
  String? mime_type;

  
  double? progress;
  String? relativePath;

  bool get isIdValid => (id??0) > 0;

  String? get absolutePath => PathUtils.absolutePathFromRelative(relativePath);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory AppVoice.fromJson(Map<String, dynamic> json) =>
      _$AppVoiceFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AppVoiceToJson(this);

  static int? _stringToInt(dynamic number) => Utils.parseInt(number);

  static String? _stringFromInt(int? number) => number?.toString();

  static double? _dynamicToDouble(dynamic number) => Utils.parseDouble(number);
}
