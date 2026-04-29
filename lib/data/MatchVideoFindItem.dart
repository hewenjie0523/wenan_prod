


import 'package:wenan/data/user/CommonUser.dart';

import '../StringTranslate.dart';
import '../utils/WenanCodeutils.dart';
import 'AppVideo.dart';

part 'MatchVideoFindItem.g.dart';


class MatchVideoFindItem {
  MatchVideoFindItem();


  int? id;
  CommonUser? user ;
  AppVideo? video;

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case User.
  factory MatchVideoFindItem.fromJson(Map<String, dynamic> json) => _$FeedItemFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$FeedItemToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static String? _stringFromInt(int? number) => number?.toString();

}