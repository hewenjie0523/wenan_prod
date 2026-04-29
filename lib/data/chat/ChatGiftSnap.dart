
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'ChatGiftSnap.g.dart';


class ChatGiftSnap {
  ChatGiftSnap();


  ///礼物消息
  ////**
  //  *  /*
  //     8. im送礼
  //     Key	Description
  //     category	8
  //     id	礼物id
  //     to_uid	对方uid
  //     quantity	数量
  //     icon	图标
  //     name	礼物名称
  //     value	礼物的价值
  //     min_duration	最小显示秒
  //     max_duration	最大显示秒
  //     animation_type	动画类型 0:小 1:中 2:大
  //     animation_url	动画url
  //     */
  //  */
////var category: Int,
//     var id: Long,
//     var to_uid: Long,
//     var quantity: Int,
//     var min_duration: Int = 500,
//     var max_duration: Int = 2000,
//     var name: String?,
//     var icon: String?,
//     var animation_type: Int,
//     var animation_url: String?,
//     var price: Int,
//     var value: Int,
//     var gift_type:Int = 0, //0,im;1,feed
//     var feed_id:Long = 0
  
  int? category;
  
  int? id;
  
  int? to_uid;
  
  int? quantity;
  String? icon;
  String? name;
  
  int? price;    //	礼物的价值
  
  int? value;
  
  int? min_duration;
  
  int? max_duration;
  
  int? animation_type;
  String? animation_url;
  
  int? gift_type;////0,im;1,feed

  factory ChatGiftSnap.fromJson(Map<String, dynamic> json) =>
      _$ChatGiftSnapFromJson(json);

  Map<String, dynamic> toJson() => _$ChatGiftSnapToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static bool? _dynamicToBool(dynamic number) => Utils.parseBool(number);
}
