import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';


part 'NotifyLatestItem.g.dart';


class NotifyLatestItem {
  NotifyLatestItem();

  
  String? content;
  
  int? unreadCount;
  
  int? time;

  factory NotifyLatestItem.fromJson(Map<String,dynamic> json) =>
      _$NotifyLatestItemFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyLatestItemToJson(this);

  static int _dynamicToInt(dynamic number) => Utils.parseInt(number)??0;

  @override
  String toString() {
    return "title:$content,unreadCount:$unreadCount";
  }
}
