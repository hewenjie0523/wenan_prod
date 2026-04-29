import 'package:wenan/utils/WenanCodePathUtils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'AppVideo.g.dart';


class AppVideo {
  AppVideo();

  
  int? id;
  
  int? duration;
  String? video_url;
  String? cover_url;
  
  int? width;
  
  int? height;

  
  double? progress;
  String? relativePath;

  String? gif_url;
  String? url;

  bool get isIdValid => (id??0) > 0;

  String? get absolutePath => PathUtils.absolutePathFromRelative(relativePath);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory AppVideo.fromJson(Map<String, dynamic> json) =>
      _$AppVideoFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AppVideoToJson(this);

  static int? _stringToInt(dynamic number) => Utils.parseInt(number);

  static String? _stringFromInt(int? number) => number?.toString();

  static double? _dynamicToDouble(dynamic number) => Utils.parseDouble(number);

  @override
  String toString() {
    return 'AppVideo{id: $id, duration: $duration, video_url: $video_url, cover_url: $cover_url, width: $width, height: $height, progress: $progress, relativePath: $relativePath, gif_url: $gif_url}';
  }
}
