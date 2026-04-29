import 'package:flutter/cupertino.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/proto/we_ps_im_object.pbenum.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ChatBox.g.dart';


class ChatBox {
  ChatBox();

  
  int? id;
  
  int? type; // ChatBox 类型 Chatbox_Type values
  String? name;
  String? coverURL;
  
  int? owner;
  List<CommonUser>? members;
  String? qrCodeURL;
  
  int? weight; // ChatBox 显示权重, 第一排序为 weight 从大到小排序, weight 相同时, 使用第二排序 update_time 倒序排列
  
  bool? muted; // 是否免打扰
  
  int? unreadCount; // ChatBox 中未读 snap 数量 (对于本地存储聊天消息，在读取的时候会重新计算)
  
  int? updateTime; // 最后更新时间
  String? additionalInfo; // 附加信息, 暂时只用在标识陌生人 ChatBox 来源
  String? desc; // 描述信息

  /// Added Properties
  
  bool? serviceChat = false;

  
  bool? hasChat;
  
  int? lastReadSnapTime; // 计算“更多 snap 数目”
  
  int? clearCacheTime; // 判断 snap 中 media 资源是否过期

  
  int? displayTime; // 展示和排序时间，MAX(updateTime, 最新一条 snap createTime, draftTime)
  
  int? lastSnapSendStatus; // ChatSnapSendStatus
  
  List<InlineSpan>? lastContent;

  @override
  int get hashCode => id??0;

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is ChatBox && id == other.id;
  }

  bool get isTop => (weight??0) > 0;

  set isTop(bool isTop) => weight = isTop ? 1 : 0;

  bool get isSingle => type == Chatbox_Type.SINGLE.value;

  bool get isGroup => type == Chatbox_Type.GROUP.value;

  bool get hasSnap => lastReadSnapTime != null && lastReadSnapTime! > 0;

  List<CommonUser>? get chatUsers => members?.where((user) => !user.isMainUser).toList();

  void replaceMember(CommonUser user) {
    final index = members?.indexOf(user)??-1;
    if (index > -1) {
      members?.removeAt(index);
      members?.insert(index, user);
    }
  }

  CommonUser? get chatUser => (chatUsers?.isNotEmpty==true)?chatUsers?.first:null;

  String? get showName {
    if (isSingle) {
      return Utils.isEmpty(chatUsers) ? null : chatUsers!.first.showName;
    } else {
      if (!Utils.isEmptyString(name)) {
        return name;
      } else {
        List<String?>? names = chatUsers?.map((e) => e.showName).toList();
        return names?.join('、');
      }
    }
  }

  String? get showCoverURL {
    if (!Utils.isEmptyString(coverURL)) {
      return coverURL;
    } else {
      if (isSingle) {
        return Utils.isEmpty(chatUsers) ? null : chatUsers!.first.avatar_url;
      }
    }
    return null;
  }

  String? get cachePath {
    return id==null?null:ChatUtils.chatBoxCachePath(id!);
  }

  factory ChatBox.fromJson(Map<String, dynamic> json) => _$ChatBoxFromJson(json);

  Map<String, dynamic> toJson() => _$ChatBoxToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number) ?? 0;

  static bool? _dynamicToBool(dynamic number) => Utils.parseBool(number);

  @override
  String toString() {
    return "id:$id,hasChat=$hasChat,hasSnap:$hasSnap,user:${chatUser?.nick_name}";
  }
}
