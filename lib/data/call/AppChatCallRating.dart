import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';

import 'AppChatCallRatingTag.dart';

part 'AppChatCallRating.g.dart';


class AppChatCallRating {
  AppChatCallRating();

  
  int? callId;
  
  int? snapId;
  List<AppChatCallRatingTag>? tags;

  factory AppChatCallRating.fromJson(Map<String, dynamic> json) => _$AppChatCallRatingFromJson(json);

  Map<String, dynamic> toJson() => _$AppChatCallRatingToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);
}
