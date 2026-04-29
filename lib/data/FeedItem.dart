// data class FeedItem(var id: Long = 0, var user: User, var files:List<FeedMedia>? = null, var text: String = "")
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'FeedItem.g.dart';


class FeedItem {
  FeedItem();

  
  int? id;
  CommonUser? user ;
  String? text;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory FeedItem.fromJson(Map<String, dynamic> json) => _$FeedItemFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$FeedItemToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static String? _stringFromInt(int? number) => number?.toString();

}