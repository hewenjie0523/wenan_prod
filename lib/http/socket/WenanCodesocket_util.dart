
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/data/AppVoice.dart';
import 'package:wenan/data/chat/ChatBox.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/proto/we_ps_common.pb.dart';
import 'package:wenan/proto/google/protobuf/any.pbserver.dart';
import 'package:wenan/proto/we_ps_im_object.pb.dart';
import 'package:wenan/proto/we_ps_message.pb.dart';
import 'package:wenan/proto/we_ps_object.pb.dart';
import 'package:wenan/http/socket/WenanCodesocket_rsp.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:protobuf/protobuf.dart';
import 'package:wenan/proto/we_ps_im_message.pb.dart' as IM;
import 'package:wenan/proto/we_ps_bu_message.pb.dart' as Flash;

import '../../data/call/AppChatCall.dart';
import '../../data/call/AppChatCallRating.dart';
import '../../data/call/AppChatCallRatingTag.dart';
import '../../data/call/WenanCodeAppCheckCallRsp.dart';
import '../../proto/we_ps_bu_call.pb.dart';
import '../../proto/we_ps_bu_object.pb.dart';
import 'WenanCodesocket_manager.dart';

class SocketUtil{

  static Message packMessage(int messageCate, int messageType, GeneratedMessage messageBody){
    Message message = Message.create();
    message.messageObject = Any.pack(messageBody);
    message.messageType = messageType;
    message.messageCate = messageCate;
    message.seqno = SocketManager.getRequestSeqNo();
    return message;
  }

  static T? unpackMessage<T extends GeneratedMessage>(T instance,Any? any) {
    if(any==null){
      return null;
    }
    try {
      T unPacked = any.unpackInto(instance);
      return unPacked;
    } catch (e) {
      AuvChatLog.e('unpackMessage error $e');
      return null;
    }
  }

  static List<T>? unpackMessageList<T extends GeneratedMessage>(List<Any>? anyList, T g()) {
    if(anyList==null){
      return null;
    }

    try {
      List<T> resultList = [];
      for(Any elem in anyList){
        var elemT = unpackMessage(g(), elem);
        if(elemT!=null){
          resultList.add(elemT);
        }
      }
      return resultList;
    } catch (e) {
      AuvChatLog.e('unpackMessageList:${e.toString()}');
      return null;
    }
  }

  static CommonUser convertUserProto(User p) {
    CommonUser l = CommonUser();
    l.uid = p.uid.toInt();
    l.ucode = p.ucode;
    l.nick_name = p.nickName;
    l.avatar_url = p.avatarUrl;
    l.signature = p.signature;
    l.mobile = p.mobile;
    l.gender = p.gender;
    l.constellation = p.constellation;
    l.birthday = p.birthday;
    l.status = p.status;
    l.extend?.display_name = p.displayName;
    return l;
  }

  static ChatBox convertChatBoxProto(Chatbox p) {
    ChatBox l = ChatBox();
    l.id = p.id.toInt();
    l.type = p.type.value;
    l.name = p.name;
    l.coverURL = p.coverUrl;
    l.owner = p.owner.toInt();
    l.qrCodeURL = p.qrcodeUrl;
    l.weight = p.weight;
    l.muted = p.muted;
    l.unreadCount = p.unreadCount;
    l.updateTime = p.updateTime.toInt();
    l.additionalInfo = p.additionalInfo;
    l.desc = p.description;
    l.hasChat = p.weight > 0;

    l.members = [];
    p.members.forEach((e) {
      l.members?.add(convertUserProto(e));
    });
    return l;
  }

  static ChatSnap convertChatSnapProto(Snap p) {
    ChatSnap l = ChatSnap();
    l.id = p.id.toInt();
    l.chatBoxId = p.chatboxId.toInt();
    l.owner = p.owner.toInt();
    l.ownerName = p.ownerName;
    l.ownerHead = p.ownerHead;
    l.unread =  p.unread != 0;
    l.createTime = p.createTime.toInt();
    l.prevSnapId = p.prevSnapId.toInt();
    l.type = p.type.value;
    l.textContent = p.textContent;
    l.jsonContent = p.jsonContent;
    l.localId = p.localId.toInt();
    l.redPacketId = p.redPacketId.toInt();
    l.repliedSnapId = p.repliedSnapId.toInt();
    l.status = p.status;
    if (p.repliedSnapId != null && p.repliedSnapId > 0) {
      l.repliedSnap = convertChatSnapProto(p.repliedSnap);
    }

    if (p.type == Snap_SnapType.IMG_SNAP || p.type == Snap_SnapType.STICKER_SNAP) {
      l.image = convertImageProto(p.image);
    } else if (p.type == Snap_SnapType.VIDEO_SNAP) {
      l.video = convertVideoProto(p.video);
    } else if (p.type == Snap_SnapType.VOICE_SNAP) {
      l.voice = convertVoiceProto(p.voice);
      l.unread = true;
    } else if (p.type == Snap_SnapType.MULTI_IMG_SNAP) {
      l.images = [];
      p.multiImages.map((e) => l.images?.add(convertImageProto(e)));
    }

    return l;
  }

  static AppImage convertImageProto(Image p) {
    AppImage l = AppImage();
    l.id = p.id.toInt();
    l.img_url = p.imgUrl;
    l.width = p.weight;
    l.height = p.height;
    l.mime_type = p.mimeType;
    return l;
  }

  static AppVoice convertVoiceProto(Voice p) {
    AppVoice l = AppVoice();
    l.id = p.id.toInt();
    l.voice_url = p.voiceUrl;
    l.duration = p.duration;
    return l;
  }

  static AppVideo convertVideoProto(Video p) {
    AppVideo l = AppVideo();
    l.id = p.id.toInt();
    l.video_url = p.videoUrl;
    l.cover_url = p.coverUrl;
    l.duration = p.duration;
    l.width = p.width;
    l.height = p.height;
    return l;
  }

  static AppCheckCallRsp convertCheckCallRsp(CheckCallRsp p){
    AppCheckCallRsp l = AppCheckCallRsp();
    l.code = p.code;
    l.msg = p.msg;
    l.balance = p.balance.toInt();
    l.hasExpCard = p.hasExpCard;
    l.chatPrice = p.chatPrice.toInt();
    l.firstPay = p.firstPay;
    l.noDisturb = p.noDisturb;
    return l;
  }

  static AppChatCall convertChatCallProto(ChatCall p) {
    AppChatCall l = AppChatCall();
    l.id = p.id.toInt();
    l.chatId = p.chatId.toInt();
    l.from = p.from.toInt();
    l.deductionTime = p.deductionTime.toInt();
    l.duration = p.duration;
    l.cost = p.cost;
    l.income = p.income;
    l.balance = p.balance.toInt();
    l.chatPrice = p.chatPrice;
    l.media = p.media;
    l.channelKey = p.channelKey;
    final statusIndex = p.status.value;
    l.status = ChatCallStatus.values[statusIndex];
    l.isInduce = p.isInduce;
    l.induceVideo = p.induceVideo;
    l.byeReason = p.byeReason;
    l.sourceType = p.sourceType;
    l.ratingCard = convertChatCallRatingProto(p.ratingCard);
    l.cost = p.cost.toInt();
    return l;
  }

  static AppChatCallRating convertChatCallRatingProto(ChatCallRating p) {
    AppChatCallRating l = AppChatCallRating();
    l.callId = p.callId.toInt();
    l.snapId = p.snapId.toInt();
    l.tags = [];
    p.tags.map((tag) => l.tags?.add(convertAppChatCallRatingTagProto(tag)));
    return l;
  }

  static AppChatCallRatingTag convertAppChatCallRatingTagProto(ChatCallRatingTag p) {
    AppChatCallRatingTag l = AppChatCallRatingTag();
    l.id = p.id.toInt();
    l.tag = p.tag;
    return l;
  }

  static bool convertCommonRsp2Bool(CommonRsp? realRsp){
    if (realRsp != null) {
      if(realRsp.code == 0){
        return true;
      } else {
        throw SocketRspError(realRsp.code,errorMsg: realRsp.msg);
      }
    } else {
      throw SocketRspError.unknownError();
    }
  }

  static String? getMsgTypeName(Message? message){
    if(message==null){
      return "";
    }
    String? messageTypeName = "";
    int cate = message.messageCate;
    if ( cate == Message_Category.BASE.value) {
      try {
        messageTypeName = Message_Type.valueOf(message.messageType)?.name;
      } catch (e) {
        AuvChatLog.printE(e);
      }
    } else if (cate == Message_Category.IM.value) {
      try {
        messageTypeName = IM.Message_Type.valueOf(message.messageType)?.name;
      } catch (e) {
        AuvChatLog.printE(e);
      }
    } else {
      try {
      messageTypeName = Flash.Message_Type.valueOf(message.messageType)?.name;
      } catch (e) {
        AuvChatLog.printE(e);
      }
    }
    return messageTypeName;
  }

  //是否需要放入请求队列，需要返回true
  static bool requestQueueFilter(Message msg){
    int cate = msg.messageCate;
    int type = msg.messageType;
    if (cate == Message_Category.IM.value&&(type==IM.Message_Type.SYNC.value||type==IM.Message_Type.SYNCKEYCONFIRMNOTIFY.value)) {
      return false;
    }
    if (cate == Message_Category.BASE.value&&(type==Message_Type.COMMONACK.value||type==Message_Type.HEARTBEAT.value)) {
      return false;
    }
    return true;
  }

  static bool isMsgTypeCommonAck(Message msg){
    int cate = msg.messageCate;
    int type = msg.messageType;
    if (cate == Message_Category.BASE.value&&(type==Message_Type.COMMONACK.value)) {
      return true;
    }
    return false;
  }



}