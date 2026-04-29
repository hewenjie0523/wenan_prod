import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';


part 'NotifyItem.g.dart';


class NotifyItem {
  NotifyItem();

  
  int? id;
  
  int? cate; // 类型，1:系统通知；2:用户回复；
  
  int? type; // snap 类型，0：视频；1：纯文本；2：图片；3：语音；4：弱消息；5：语音；6：json；7：红包；8：多图；9：表情；
  String? title;
  String? content;
  AppImage? image;
  
  String? url;
  
  int? time;
  
  String? imgUrl;

  factory NotifyItem.fromJson(Map<String,dynamic> json) =>
      _$NotifyItemFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyItemToJson(this);

  static int _dynamicToInt(dynamic number) => Utils.parseInt(number)??0;
}
