import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'AppSticker.g.dart';


class AppSticker {
  static const ADD_STICKER_ID = 1;
  static final addStickerItem = AppSticker()..id = ADD_STICKER_ID;

  AppSticker();

  
  int? id;
  
  int? width;
  
  int? height;
  
  String? url;

  @override
  int get hashCode => id??0;

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is AppSticker && id == other.id;
  }

  bool get isIdValid => (id??0) > 0;

  bool get isAddStickerItem => id == ADD_STICKER_ID;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory AppSticker.fromJson(Map<String, dynamic> json) => _$AppStickerFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AppStickerToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static double? _dynamicToDouble(dynamic number) => Utils.parseDouble(number);
}
