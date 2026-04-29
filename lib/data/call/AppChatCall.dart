import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';

import '../../base/WenanCodeApplication.dart';
import 'AppChatCallRating.dart';

part 'AppChatCall.g.dart';

enum ChatCallStatus {
  /// 呼叫中
  trying,

  /// 被叫振铃
  ringing,

  /// 被叫就绪
  pickup,

  /// 主叫OK进入通话状态
  confirmed,

  /// 请求超时
  requestTimeout,

  /// 被叫用户忙
  busyHere,

  /// 已经被被叫拒绝
  rejected,

  /// 已经被主叫取消
  canceled,

  /// 被叫不在线
  unreachable,

  /// BYE对方已挂断
  bye,
}

extension ChatCallStatusExtension on ChatCallStatus {
  ///拨号中
  bool isDialing() {
    return [ChatCallStatus.trying, ChatCallStatus.ringing].contains(this);
  }

  ///通话中
  bool isCalling() {
    return [ChatCallStatus.pickup, ChatCallStatus.confirmed].contains(this);
  }

  ///通话中
  bool isCallEnd() {
    return [ChatCallStatus.requestTimeout, ChatCallStatus.busyHere, ChatCallStatus.rejected, ChatCallStatus.canceled, ChatCallStatus.bye].contains(this);
  }
}

///电话来源
enum ChatCallSourceType {
  ///0:普通电话
  normal,

  ///1:随机匹配
  match,

  ///2:AICS
  aics,

  ///3:AIV
  aiv,

  ///4:AICF
  aicf,
}


class AppChatCall {
  static bool isCallEnd(ChatCallStatus? status) {
    return status == ChatCallStatus.requestTimeout ||
        status == ChatCallStatus.busyHere ||
        status == ChatCallStatus.rejected ||
        status == ChatCallStatus.canceled ||
        status == ChatCallStatus.bye;
  }

  static AppChatCall callInvite(int subscriberId, {int sourceType = 0, int sourceId = 0}) {
    final chatCall = AppChatCall();
    chatCall.status = ChatCallStatus.trying;
    chatCall.from = Application.currUserId();
    chatCall.subscriberId = subscriberId;
    chatCall.isInduce = false;
    chatCall.sourceType = sourceType;
    chatCall.sourceId = sourceId;
    return chatCall;
  }

  AppChatCall();

  
  int id = 0;
  
  int? chatId;
  
  int? from;
  
  int? subscriberId;

  //扣费时间
  
  int? deductionTime;
  
  int? duration;
  
  int? cost;
  
  int? income;
  
  int? balance;
  
  int? chatPrice;
  
  int? media;
  String? channelKey;
  
  ChatCallStatus status = ChatCallStatus.trying;
  
  bool? isInduce;
  String induceVideo = "";

  ///挂断原因 1:主叫第一帧超时 2:被叫第一帧超时 3:主叫心跳超时 4:被叫心跳超时 5:主叫挂断 6:被叫挂断 7:费用不够挂断 8:有一方开启新电话挂断
  
  int? byeReason;
  

  ///电话来源 0:普通电话 1:随机匹配 2:AICS 3:AIV 4:AICF
  int? sourceType;
  
  ///电话来源Id
  int? sourceId;
  
  AppChatCallRating? ratingCard;

  int? theOtherUid() {
    return isMeCalling() ? subscriberId : from;
  }

  ///余额大于1分钟
  bool balanceMoreThanOneMinute() {
    return (balance ?? 0) >= (chatPrice ?? 0);
  }

  bool isMeCalling() {
    return Application.currUserId() == from;
  }

  bool hasVideo() {
    return !Utils.isEmptyString(induceVideo);
  }

  bool showChatPrice() {
    return (sourceType == ChatCallSourceType.aics.index) | (sourceType == ChatCallSourceType.normal.index);
  }

  bool aivCall() {
    return sourceType == ChatCallSourceType.aiv.index;
  }

  bool aicsCall() {
    return sourceType == ChatCallSourceType.aics.index;
  }

  bool aicfCall() {
    return sourceType == ChatCallSourceType.aicf.index;
  }

  bool isEnd() {
    return status.isCallEnd();
  }

  ///开始计费
  bool billingStart() {
    return (deductionTime ?? 0) > 0;
  }

  factory AppChatCall.fromJson(Map<String, dynamic> json) => _$AppChatCallFromJson(json);

  Map<String, dynamic> toJson() => _$AppChatCallToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static int _dynamicToIntNotNull(dynamic number) {
    return Utils.parseInt(number) ?? 0;
  }

  static ChatCallStatus _dynamicToChatCallStatus(dynamic number) {
    final index = Utils.parseInt(number);
    return index == null ? ChatCallStatus.trying : ChatCallStatus.values[index];
  }

  static bool? _dynamicToBool(dynamic number) => Utils.parseBool(number);
}
