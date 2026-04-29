import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/data/AppVoice.dart';
import 'package:wenan/data/chat/ChatSnapJsonContent.dart';
import 'package:wenan/proto/we_ps_im_object.pbenum.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/view/call/chat/WenanCodeChatSnapJsonContentUtils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ChatSnap.g.dart';

enum ChatSnapSendStatus {
  success,
  failed,
  sending,
}

enum ChatSnapRedPackageStatus {
  valid,
  robOut,
  outOfDate,
  got,
}

enum ChatSnapMenuType {
  Copy,
  AddToSticker,
  Recall,
  Resend,
}


class ChatSnap {
  ChatSnap();

  
  int? id;
  
  int? chatBoxId;
  
  int? owner;
  String? ownerHead;
  String? ownerName;
  
  bool? unread;
  
  int? createTime;
  
  int? prevSnapId;
  
  int? type; // Snap_SnapType values
  String? textContent; // 文本内容TXT_SNAP,图片IMG_SNAP 和 WEAK_SNAP 类型消息有效
  AppVoice? voice;
  AppImage? image;
  AppVideo? video;
  List<AppImage>? images;
  String? jsonContent;
  
  int? localId;
  Map? extensions;
  
  int? redPacketId;
  
  int? repliedSnapId;
  
  ChatSnap? repliedSnap;
  
  int? status; // 0:正常状态 1:已经撤回
//  String? blocks; // JSON BLOCK ARRAYS

  /// Added Properties

  
  int? sendStatus; // ChatSnapSendStatus values
  
  int? redPacketStatus; // ChatSnapRedPackageStatus values
  
  int? redPacketType; // RedPacket_PacketType values
  
  double? redPacketAmount;
  
  int? redPacketTotalCount;
  String? redPacketMessage;
  
  List<InlineSpan>? richTexts;
  
  ChatSnapJsonContent? _jsonContentObj;
  
  int? clearCacheTime; // 判断 media 资源是否过期

  @override
  int get hashCode => '$id$localId'.hashCode;

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other is! ChatSnap) return false;
    if (this.isIdValid && other.isIdValid) {
      return this.id == other.id;
    } else {
      return this.isMine && other.isMine && this.localId == other.localId;
    }
  }

  bool get isMine => this.owner == Application.currUserId();

  bool get isUserSnap {
    bool userRelated = true;
    if(type!=null){
      var snapType = Snap_SnapType.valueOf(type!);

      if (snapType == Snap_SnapType.WEAK_SNAP) {
        userRelated = false;
      } else if (snapType == Snap_SnapType.JSON_SNAP) {
        userRelated = ChatSnapJsonContentUtils.isUserRelated(jsonContentObj);
      } else {
        // 默认情况
      }

    }

    return userRelated;
  }

  bool get hasReadFlag {
    bool ret = false;
    if(type!=null){
      var snapType = Snap_SnapType.valueOf(type!);
      if (snapType == Snap_SnapType.VIDEO_SNAP ||
          snapType == Snap_SnapType.TXT_SNAP ||
          snapType == Snap_SnapType.IMG_SNAP ||
          snapType == Snap_SnapType.VOICE_SNAP ||
          snapType == Snap_SnapType.STICKER_SNAP ||
          snapType == Snap_SnapType.LOCATION_SNAP) {
        ret = true;
      } else if (snapType == Snap_SnapType.JSON_SNAP) {
        ret = ChatSnapJsonContentUtils.hasReadFlag(jsonContentObj);
      }

    }

    return ret;
  }

  bool get isIdValid => (id??0) > 0;

  bool get isLocalIdValid =>
      this.isMine && this.localId != null && this.localId! > 0;

  bool get isRepliedIdValid =>
      this.repliedSnapId != null && this.repliedSnapId! > 0;

  bool get hasRepliedSnap => isRepliedIdValid && repliedSnap != null;

  bool get isUnread => unread != null && unread!;

  bool get isResourceUploaded {
    bool? uploaded = true;
    if(type!=null){
      var snapType = Snap_SnapType.valueOf(type!);

      if (snapType == Snap_SnapType.IMG_SNAP) {
        uploaded = image?.isIdValid;
      } else if (snapType == Snap_SnapType.VIDEO_SNAP) {
        uploaded = video?.isIdValid;
      } else if (snapType == Snap_SnapType.VOICE_SNAP) {
        uploaded = voice?.isIdValid;
      } else if (snapType == Snap_SnapType.MULTI_IMG_SNAP) {
        images?.forEach((e) {
          uploaded = uploaded! && e.isIdValid;
        });
      }

    }

    return uploaded??false;
  }

  bool get isSupportType {
    bool support = false;
    if(type!=null){
      var snapType = Snap_SnapType.valueOf(type!);

      if (snapType == Snap_SnapType.VIDEO_SNAP ||
          snapType == Snap_SnapType.TXT_SNAP ||
          snapType == Snap_SnapType.IMG_SNAP ||
          snapType == Snap_SnapType.WEAK_SNAP ||
          snapType == Snap_SnapType.VOICE_SNAP) {
        support = true;
      } else if (snapType == Snap_SnapType.JSON_SNAP) {
        support = ChatSnapJsonContentUtils.isSupported(jsonContentObj);
      }

    }

    return support;
  }

  List<ChatSnapMenuType> get menuTypes {
    List<ChatSnapMenuType> types = [];
    if (isUserSnap) {
      /// Copy
      if (type == Snap_SnapType.TXT_SNAP.value) {
        types.add(ChatSnapMenuType.Copy);
      }

      /// Add to sticker
      {
        int? id;
        if (type == Snap_SnapType.STICKER_SNAP.value) {
          id = image?.id;
        }
//        if (type == Snap_SnapType.IMG_SNAP.value && image.isGif) {
//          id = image.id;
//        }
//        if (type == Snap_SnapType.MULTI_IMG_SNAP.value &&
//            images.length == 1 &&
//            images.first.isGif) {
//          id = images.first.id;
//        }
//         if (id != null && !StickerManager.isExists(id)) {
//           types.add(ChatSnapMenuType.AddToSticker);
//         }
      }

      /// Resend
      if (sendStatus == ChatSnapSendStatus.failed.index) {
        types.add(ChatSnapMenuType.Resend);
      }

      /// Recall
      if (isMine) {
        types.add(ChatSnapMenuType.Recall);
      }
    }
    return types;
  }

  bool get isCallJsonSnap {
    return type == Snap_SnapType.JSON_SNAP.value &&
        ChatSnapJsonContentUtils.isCallCategory(jsonContentObj);
  }

  bool get isGiftJsonSnap {
    return type == Snap_SnapType.JSON_SNAP.value &&
        ChatSnapJsonContentUtils.isGiftCategory(jsonContentObj);
  }


  ChatSnapJsonContent? get jsonContentObj {
    if (_jsonContentObj == null && type == Snap_SnapType.JSON_SNAP.value&&jsonContent!=null) {
      final jsonObj = (jsonDecode(jsonContent!) as Map).cast<String, dynamic>();
      if (jsonObj != null)
        _jsonContentObj = ChatSnapJsonContent.fromJson(jsonObj);
    }
    return _jsonContentObj;
  }

  bool get isLocalMediaNotOutOfDate =>
      clearCacheTime == null || (createTime!=null&&createTime! > clearCacheTime!);

  factory ChatSnap.fromJson(Map<String, dynamic> json) =>
      _$ChatSnapFromJson(json);

  Map<String, dynamic> toJson() => _$ChatSnapToJson(this);

  static int? _dynamicToInt(dynamic number) => Utils.parseInt(number);

  static double? _dynamicToDouble(dynamic number) => Utils.parseDouble(number);

  static bool? _dynamicToBool(dynamic number) => Utils.parseBool(number);
}
