import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/data/AppEmoji.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';

part 'AppEmojiCategory.g.dart';


class AppEmojiCategory {
  static const int EMOJI_ID = 100;

  AppEmojiCategory();

  
  int? id;
  
  int? type;
  
  String? name;
  
  String? icon;
  
  String? selIcon;
  
  List<AppEmoji>? items;

  @override
  int get hashCode => id??0;

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is AppEmojiCategory && this.id == other.id;
  }

  bool get isEmoji => id == EMOJI_ID;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory AppEmojiCategory.fromJson(Map<String,dynamic> json) => _$AppEmojiCategoryFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AppEmojiCategoryToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);
}
