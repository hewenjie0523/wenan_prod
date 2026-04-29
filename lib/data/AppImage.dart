import 'package:wenan/utils/WenanCodePathUtils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'AppImage.g.dart';


class AppImage {
  AppImage();

  
  int? id;
  
  int? width;
  
  int? height;
  String? img_url;
  String? url;
  String? mime_type;

  
  double? progress;
  String? relativePath;

  bool get isIdValid => id != null && id! > 0;

  bool get isGif => mime_type?.toLowerCase().contains('gif')??false;

  String? get absolutePath => PathUtils.absolutePathFromRelative(relativePath);

  String? get imageUrl=>img_url??url;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory AppImage.fromJson(Map<String, dynamic> json) => _$AppImageFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AppImageToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static String? _stringFromInt(int? number) => number?.toString();

  static double? _dynamicToDouble(dynamic number) => Utils.parseDouble(number);

  @override
  String toString() {
    return 'AppImage{id: $id, width: $width, height: $height, img_url: $img_url, url: $url, mime_type: $mime_type}';
  }
}
