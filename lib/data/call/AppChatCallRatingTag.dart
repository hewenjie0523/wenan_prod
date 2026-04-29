import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';

part 'AppChatCallRatingTag.g.dart';


class AppChatCallRatingTag {
  AppChatCallRatingTag();

  
  int? id;
  String? tag;

  factory AppChatCallRatingTag.fromJson(Map<String, dynamic> json) => _$AppChatCallRatingTagFromJson(json);

  Map<String, dynamic> toJson() => _$AppChatCallRatingTagToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);
}
