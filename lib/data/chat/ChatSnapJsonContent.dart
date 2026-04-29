import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeBaseEnum.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'ChatSnapJsonContent.g.dart';

class ChatSnapJsonContentCategory extends BaseEnum {
  static const orderCate = ChatSnapJsonContentCategory._(1, 'orderCate');
  static const liveVideoCate = ChatSnapJsonContentCategory._(2, 'liveVideoCate');
  static const feedCate = ChatSnapJsonContentCategory._(3, 'feedCate');
  static const cardCate = ChatSnapJsonContentCategory._(4, 'cardCate');
  static const skillCate = ChatSnapJsonContentCategory._(5, 'skillCate');
  static const callCate = ChatSnapJsonContentCategory._(6, 'callCate');
  static const liveVoiceCate = ChatSnapJsonContentCategory._(7, 'liveVoiceCate');
  static const imGiftCate = ChatSnapJsonContentCategory._(8, 'imGiftCate');

  /// public static final int CATEGORY_PHONE_CALL = 6;
  //     public static final int CATEGORY_IM_GIFT = 8;

  static final Map<int, ChatSnapJsonContentCategory> _byValue =
      BaseEnum.initByValue(<ChatSnapJsonContentCategory>[
        orderCate,
        liveVideoCate,
        feedCate,
        cardCate,
        skillCate,
        callCate,
        liveVoiceCate,
        imGiftCate,
  ]);

  static ChatSnapJsonContentCategory? valueOf(int? value) => _byValue[value];

  const ChatSnapJsonContentCategory._(int value, String name)
      : super(value, name);
}

class ChatSnapJsonContentType {
  /// Call Types
  static const int callAudio = 1;
  static const int callVideo = 2;
  static const int callRating = 3;

  /// Feed Types
  static const int feedText = 1; // Feed.TXT_FEED_TYPE
  static const int feedImage = 2; // Feed.IMG_FEED_TYPE
  static const int feedVideo = 3; // Feed.VIDEO_FEED_TYPE

  /// LiveVideo Types
  static const int LiveVideoDefault = 0;

  /// LiveVoice Types
  static const int LiveVoiceDefault = 0;
}

class ChatSnapJsonContentStatus {
  /// Call Status
  static const int callDone = 1;
  static const int callCanceled = 2;
  static const int callRefused = 3;
  static const int callNoReply = 4;
  static const int callBusy = 5;
  static const int connectFailed = 6;
}

/// http://redmine.9apples.com/projects/flash/wiki/聊天_Snap_的_Json_字段

class ChatSnapJsonContent {
  ChatSnapJsonContent();

  /// 必有字段

  
  int? category;

  /// 通用字段（可使用，也可不使用）

  
  int? type;
  String? title;
  String? desc;
  String? cover;
  
  int? count;
  
  int? status;
  
  int? userId;
  
  String? userName;
  
  String? userHead;
  
  int? gender; //性别 男为1，女为2，0为未知
  
  int? userLevel;
  String? constellation;
  int? age;
  String? area;

  /// 各类型相关字段 Start

  // Order 相关字段 (通用字段 + 以下)
  
  int? orderId;
  
  int? evaluateId;
  
  int? star;
  
  int? orderUserType;
  
  String? starText;

  bool get isSeller => orderUserType == 1;

  // 直播 相关字段 (通用字段 + 以下)
  
  int? roomId;
  
  bool? isPrivate;
  String? password;

  // feed 相关字段 (通用字段 + 以下)
  
  int? feedId;

  // 名片 相关字段 (都在 通用字段 中)

  // 技能 相关字段 (通用字段 + 以下)
  
  int? skillId;
  
  String? skillDesc;
  
  String? skillUnitPrice;

  // 语音/视频通话 相关字段 (都在 通用字段 中)

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


  /// 各类型相关字段 End

  bool get isUserIdMine => userId == Application.currUserId();

  factory ChatSnapJsonContent.fromJson(Map<String, dynamic> json) =>
      _$ChatSnapJsonContentFromJson(json);

  Map<String, dynamic> toJson() => _$ChatSnapJsonContentToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static bool? _dynamicToBool(dynamic number) => Utils.parseBool(number);
}
