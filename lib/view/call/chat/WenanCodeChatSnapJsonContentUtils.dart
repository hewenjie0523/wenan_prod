import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/data/chat/ChatSnapJsonContent.dart';
import 'package:wenan/view/call/chat/detail/views/jsonContentView/WenanCodeChatCellJsonCallView.dart';
import 'package:wenan/view/call/chat/detail/views/jsonContentView/WenanCodeChatCellJsonGiftView.dart';
import 'package:wenan/StringTranslate.dart';

class ChatSnapJsonContentUtils {


  static bool isOrderCategory(ChatSnapJsonContent content) {
    return content.category != null &&
        content.category == ChatSnapJsonContentCategory.orderCate.value;
  }


  static bool isGiftCategory(ChatSnapJsonContent? content) {
    return content?.category != null &&
        content?.category == ChatSnapJsonContentCategory.imGiftCate.value;
  }

  static bool isUserRelated(ChatSnapJsonContent? content) {
    bool ret = false;
    if(content==null){
      return ret;
    }
    if (content.category != null) {
      switch (ChatSnapJsonContentCategory.valueOf(content.category)) {
        case ChatSnapJsonContentCategory.orderCate:
          // ret = ChatOrderJsonContentUtils.isUserRelated(content.type);
          break;
        case ChatSnapJsonContentCategory.liveVideoCate:
          // isLiveVideoUserRelated(content.type);
          break;
        case ChatSnapJsonContentCategory.liveVoiceCate:
          // isLiveVoiceUserRelated(content.type);
          break;
        case ChatSnapJsonContentCategory.feedCate:
        case ChatSnapJsonContentCategory.cardCate:
        case ChatSnapJsonContentCategory.skillCate:
          break;
        case ChatSnapJsonContentCategory.callCate:
        case ChatSnapJsonContentCategory.imGiftCate:
          ret = true;
          break;

        default:
          break;
      }
    }
    return ret;
  }


  static bool isCallCategory(ChatSnapJsonContent? content) {
    return content?.category != null &&
        content?.category == ChatSnapJsonContentCategory.callCate.value;
  }


  static bool isSupported(ChatSnapJsonContent? content) {
    bool ret = false;
    if(content==null){
      return ret;
    }
    if (content.category != null) {
      switch (ChatSnapJsonContentCategory.valueOf(content.category)) {
        case ChatSnapJsonContentCategory.orderCate:
          // ret = ChatOrderJsonContentUtils.isTypeSupported(content.type);
          break;
        case ChatSnapJsonContentCategory.liveVideoCate:
          // ret = isLiveVideoSupported(content.type);
          break;
        case ChatSnapJsonContentCategory.liveVoiceCate:
          // ret = isLiveVoiceSupported(content.type);
          break;
        case ChatSnapJsonContentCategory.cardCate:
        case ChatSnapJsonContentCategory.skillCate:
          ret = true;
          break;
        case ChatSnapJsonContentCategory.feedCate:
          if (content.type != null) {
            switch (content.type) {
              case ChatSnapJsonContentType.feedText:
              case ChatSnapJsonContentType.feedImage:
              case ChatSnapJsonContentType.feedVideo:
                // ret = true;
                break;
              default:
                break;
            }
          }
          break;
        case ChatSnapJsonContentCategory.callCate:
          if (content.type != null) {
            switch (content.type) {
              case ChatSnapJsonContentType.callAudio:
              case ChatSnapJsonContentType.callVideo:
              case ChatSnapJsonContentType.callRating:
                ret = true;
                break;
              default:
                break;
            }
          }
          break;
        case ChatSnapJsonContentCategory.imGiftCate:
          ret = true;
          break;
        default:
          break;
      }
    }
    return ret;
  }



  static bool hasReadFlag(ChatSnapJsonContent? content) {
    bool ret = false;
    if (content?.category != null) {
      switch (ChatSnapJsonContentCategory.valueOf(content!.category)) {
        case ChatSnapJsonContentCategory.liveVideoCate:
          ret = isLiveVideoHasReadFlag(content.type!);
          break;
        case ChatSnapJsonContentCategory.liveVoiceCate:
          ret = isLiveVoiceHasReadFlag(content.type!);
          break;
        case ChatSnapJsonContentCategory.feedCate:
        case ChatSnapJsonContentCategory.cardCate:
        case ChatSnapJsonContentCategory.skillCate:
          ret = true;
          break;

        default:
          break;
      }
    }
    return ret;
  }

  static Widget jsonContentView(
    ChatSnap snap,{
    Key? key,
  }) {
    Widget w = Container();
    if (snap.jsonContentObj?.category != null) {
      switch (ChatSnapJsonContentCategory.valueOf(snap.jsonContentObj!.category!)) {
        // case ChatSnapJsonContentCategory.orderCate:
        //   w = ChatOrderJsonContentUtils.orderJsonContentView(
        //     snapId,
        //     content,
        //     key: key,
        //   );
        //   break;
        // case ChatSnapJsonContentCategory.liveVideoCate:
        //   w = liveVideoJsonContentView(content, key: key);
        //   break;
        // case ChatSnapJsonContentCategory.liveVoiceCate:
        //   w = liveVoiceJsonContentView(content, key: key);
        //   break;
        // case ChatSnapJsonContentCategory.cardCate:
        //   w = ChatCellJsonCardView(key: key, content: content);
        //   break;
        // case ChatSnapJsonContentCategory.skillCate:
        //   w = ChatCellJsonSkillView(key: key, content: content);
        //   break;
        // case ChatSnapJsonContentCategory.feedCate:
        //   w = ChatCellJsonFeedView(key: key, content: content);
        //   break;
        case ChatSnapJsonContentCategory.callCate:
          w = ChatCellJsonCallView(key: key, content: snap.jsonContentObj!,chatSnap: snap,);
          break;
        case ChatSnapJsonContentCategory.imGiftCate:
          w = ChatCellJsonGiftView(key: key, content:snap.jsonContentObj!);
          break;
        default:
          break;
      }
    }
    return w;
  }

  static String jsonContentListMessage(ChatSnapJsonContent? content) {
    var ret;
    if (content?.category != null) {
      switch (ChatSnapJsonContentCategory.valueOf(content!.category)) {
        case ChatSnapJsonContentCategory.orderCate:
          // ret = ChatOrderJsonContentUtils.orderJsonContentListMessage(content);
          break;
        // case ChatSnapJsonContentCategory.liveVideoCate:
        //   ret = liveVideoJsonContentListMessage(content);
        //   break;
        // case ChatSnapJsonContentCategory.liveVoiceCate:
        //   ret = liveVoiceJsonContentListMessage(content);
        //   break;
        // case ChatSnapJsonContentCategory.cardCate:
        //   ret = '[名片分享]';
        //   break;
        // case ChatSnapJsonContentCategory.skillCate:
        //   ret = '[技能分享]';
        //   break;
        // case ChatSnapJsonContentCategory.feedCate:
        //   switch (content.type) {
        //     case ChatSnapJsonContentType.feedText:
        //       ret = '[文本分享]';
        //       break;
        //     case ChatSnapJsonContentType.feedImage:
        //       ret = '[图片分享]';
        //       break;
        //     case ChatSnapJsonContentType.feedVideo:
        //       ret = '[视频分享]';
        //       break;
        //     default:
        //       break;
        //   }
        //   break;
        case ChatSnapJsonContentCategory.callCate:
          switch (content.type) {
            case ChatSnapJsonContentType.callRating:
              ret = StringTranslate.e2z(Application.appLocalizations?.wenan_string_msg_rattings);
              break;
            case ChatSnapJsonContentType.callAudio:
            case ChatSnapJsonContentType.callVideo:
              ret = StringTranslate.e2z(Application.appLocalizations?.wenan_string_msg_call);
              break;
            default:
              break;
          }
          break;
        case ChatSnapJsonContentCategory.imGiftCate:
          ret = StringTranslate.e2z(Application.appLocalizations?.wenan_string_msg_gift);
          break;
        default:
          break;
      }
    }
    return ret ?? '';
  }

  static bool isLiveVoiceSupported(int? type) {
    bool ret = false;
    if (type != null) {
      switch (type) {
        case ChatSnapJsonContentType.LiveVoiceDefault:
          ret = true;
          break;
      }
    } else {
      ret = true;
    }
    return ret;
  }

  static bool isLiveVideoUserRelated(int? type) {
    bool ret = false;
    if (type != null) {
      switch (type) {
        case ChatSnapJsonContentType.LiveVideoDefault:
          ret = true;
          break;
      }
    } else {
      ret = true;
    }
    return ret;
  }


  static bool isLiveVideoHasReadFlag(int? type) {
    bool ret = false;
    if (type != null) {
      switch (type) {
        case ChatSnapJsonContentType.LiveVideoDefault:
          ret = true;
          break;
      }
    } else {
      ret = true;
    }
    return ret;
  }


  static bool isLiveVideoSupported(int type) {
    // if (!AppIavUtils.hasLive) return false;
    //
    // bool ret = false;
    // if (type == null) {
    //   ret = true;
    // } else {
    //   switch (type) {
    //     case ChatSnapJsonContentType.LiveVideoDefault:
    //       ret = true;
    //       break;
    //   }
    // }
    // return ret;
    return false;
  }


  static bool isLiveVoiceHasReadFlag(int? type) {
    bool ret = false;
    if (type != null) {
      switch (type) {
        case ChatSnapJsonContentType.LiveVideoDefault:
          ret = true;
          break;
      }

    } else {
      ret = true;
    }
    return ret;
  }


  static bool isLiveVoiceUserRelated(int? type) {
    bool ret = false;
    if (type != null) {

      switch (type) {
        case ChatSnapJsonContentType.LiveVoiceDefault:
          ret = true;
          break;
      }
    } else {
      ret = true;
    }
    return ret;
  }
}
