import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'AppEmoji.g.dart';


class AppEmoji {
  AppEmoji();

  
  int? id;
  String? name;
  String? icon;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory AppEmoji.fromJson(Map<String, dynamic> json) => _$AppEmojiFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AppEmojiToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);
}
