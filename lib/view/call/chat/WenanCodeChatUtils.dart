import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/proto/we_ps_im_object.pbenum.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodePathUtils.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:wenan/view/call/chat/WenanCodeChatSnapJsonContentUtils.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/view/widgets/RichText/WenanCodeRichTextUtil.dart';
import 'package:path/path.dart' as Path;
import 'package:date_format/date_format.dart' as DateFormat;
import 'package:wenan/StringTranslate.dart';

class ChatUtils {


  static TextStyle ListUnreadVoiceTextStyle = AppTextStyle.style(
    color: Color(0xFFFF5252),
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    fontFamily: AppText.fontFamily,
  );


  static TextStyle outgoingTextStyle = AppTextStyle.style(
    color: ImColors.color_snap_text_me,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    fontFamily: AppText.fontFamily,
  );

  static TextStyle incomingTextStyle = AppTextStyle.style(
    color: ImColors.color_snap_text_other,
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    fontFamily: AppText.fontFamily,
  );


  static TextStyle timeTextStyle = AppTextStyle.style(
    color: AppColor.b3,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    fontFamily: AppText.fontFamily,
  );

  static TextStyle ListTextStyle = AppTextStyle.style(
    color: AppColor.b3,
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    fontFamily: AppText.fontFamily,
  );

  static List<InlineSpan> convertChatListDraftContent(String draft) {
    List<InlineSpan> texts = [];
    texts.add(TextSpan(text: StringTranslate.e2z(Application.appLocalizations?.wenan_string_drafts)));
    texts.addAll(RichTextUtil.getRichText(draft, style: ListTextStyle));
    return texts;
  }

  static List<InlineSpan> convertChatListContent(
      ChatSnap snap, int unreadCount, bool isSingleChat) {
    List<InlineSpan> texts = [];
    if (!snap.isSupportType) {
      texts.add(TextSpan(text: StringTranslate.e2z(Application.appLocalizations?.wenan_string_chat_unknown_type), style: ListTextStyle));
      return texts;
    }

    var snapType = Snap_SnapType.valueOf(snap.type!);

    if (snapType == Snap_SnapType.TXT_SNAP || snapType == Snap_SnapType.WEAK_SNAP) {
      final copyText = RichTextUtil.getCopyText(snap.textContent!);
      texts.add(TextSpan(text: copyText, style: ListTextStyle));
    } else if (snapType == Snap_SnapType.IMG_SNAP || snapType == Snap_SnapType.MULTI_IMG_SNAP) {
      texts.add(TextSpan(text: StringTranslate.e2z(Application.appLocalizations?.wenan_string_msg_image), style: ListTextStyle));
    } else if (snapType == Snap_SnapType.VOICE_SNAP) {
      if (snap.isUnread) {
        texts.add(TextSpan(text: StringTranslate.e2z(Application.appLocalizations?.wenan_string_msg_voice), style: ListUnreadVoiceTextStyle));
      } else {
        texts.add(TextSpan(text: StringTranslate.e2z(Application.appLocalizations?.wenan_string_msg_voice), style: ListTextStyle));
      }
    } else if (snapType == Snap_SnapType.VIDEO_SNAP) {
      texts.add(TextSpan(text: StringTranslate.e2z(Application.appLocalizations?.wenan_string_msg_video), style: ListTextStyle));
    } else if (snapType == Snap_SnapType.JSON_SNAP) {
      String text = ChatSnapJsonContentUtils.jsonContentListMessage(snap.jsonContentObj);
      texts.add(TextSpan(text: text, style: ListTextStyle));
    }


    if (!isSingleChat && snap.type != Snap_SnapType.WEAK_SNAP.value) {
      texts.insert(
          0, TextSpan(text: snap.ownerName??': ', style: ListTextStyle));
    }
    // if (unreadCount > 0) {
    //   texts.insert(0, TextSpan(text: '[$unreadCount] ', style: ListTextStyle));
    // }
    return texts;
  }

  static String formatListTime(int? milliSeconds, [String? locale]) {
    if (milliSeconds == null || milliSeconds == 0) return '';
    String ret;
    final now = DateTime.now();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(milliSeconds);
    if (dateTime.isAfter(now) || dateTime.year < now.year) {
      ret = StringUtils.getFormartDateTime(dateTime,formats: const [DateFormat.yyyy, '-', DateFormat.mm, '-', DateFormat.dd]);
    } else if (dateTime.month < now.month || dateTime.day <= now.day - 1) {
      ret = StringUtils.getFormartDateTime(dateTime,formats:const [DateFormat.mm,'-',DateFormat.dd]);
    }  else {
      ret = StringUtils.getFormartDateTime(dateTime,formats:const[DateFormat.am,' ',DateFormat.hh,':',DateFormat.nn]);
    }

    // AuvChatLog.d("formatListTime:$milliSeconds,$ret");
    return ret;
  }

  static String formatMessageTime(int? milliSeconds, [String? locale]) {
    if (milliSeconds == null) return '';
    String ret;
    final now = DateTime.now();
    final dateTime = DateTime.fromMillisecondsSinceEpoch(milliSeconds);
    if (dateTime.isAfter(now) || dateTime.year < now.year) {
      ret = StringUtils.getFormartDateTime(dateTime,formats:StringUtils.FORMAT_YYYY_MM_DD_HH_MM_SS);
    } else if (dateTime.month < now.month || dateTime.day <= now.day - 1) {
      ret = StringUtils.getFormartDateTime(dateTime,formats:const [DateFormat.mm,'-',DateFormat.dd,' ',DateFormat.am,' ', DateFormat.hh,':', DateFormat.nn]);
    } else {
      ret = StringUtils.getFormartDateTime(dateTime,formats:const [DateFormat.am,' ', DateFormat.hh,':', DateFormat.nn]);
    }
    return ret;
  }

  static String chatBoxCachePath(int id) {
    var path = Path.join(Application.userPath, 'chat');
    path = Path.join(path, id.toString());
    PathUtils.makeSureDirectory(path);
    return path;
  }

  static void deleteSnapResources(ChatSnap snap) async {
    if(snap.type!=null){
      var snapType = Snap_SnapType.valueOf(snap.type!);
      if (snapType == Snap_SnapType.IMG_SNAP) {
        PathUtils.removeDirectory(snap.image?.relativePath);
      } else if (snapType == Snap_SnapType.VIDEO_SNAP) {
        PathUtils.removeDirectory(snap.video?.relativePath);
      } else if (snapType == Snap_SnapType.VOICE_SNAP) {
        PathUtils.removeDirectory(snap.voice?.relativePath);
      } else if (snapType == Snap_SnapType.MULTI_IMG_SNAP) {
        snap.images?.forEach((element) {
          PathUtils.removeDirectory(element.relativePath);
        });
      }

    }

  }


  static void deleteChatsResources(List<dynamic> chatBoxes) async {
    chatBoxes.forEach((c) {
      final id = c is int ? c : c.id;
      deleteChatResources(id);
    });
  }


  static void deleteChatResources(int id) async {
    PathUtils.removeDirectory(chatBoxCachePath(id), true);
  }

  static void deleteSnapsResources(List<ChatSnap> snaps) async {
    snaps.forEach((s) => deleteSnapResources(s));
  }

  static Size imageVideoContainerSize(
    bool isImage,
    double w,
    double h,
    double containWidth,
  ) {
    Size defaultSize = const Size(146, 146);

    if (w <= 0 || h <= 0) {
      return defaultSize;
    }

    double width = min(w, containWidth);
    double height = h / w * width;

    double ratio = w / h;
    if (ratio < 0.4) {
      width = 204;
      height = 510;
    } else if (ratio >= 0.4 && ratio <= 0.5) {
      width = 204;
      height = 204 / ratio;
    } else if (ratio > 0.5 && ratio < 1) {
      width = 405 * ratio;
      height = 405;
    } else if (ratio >= 1 && ratio < 1 / 0.5) {
      height = 405 * (1 / ratio);
      width = 405;
    } else if (ratio >= 1 / 0.5 && ratio < 1 / 0.4) {
      height = 204;
      width = 204 / (1 / ratio);
    } else if (ratio >= 1 / 0.4) {
      height = 204;
      width = 510;
    }
    width /= 2;
    height /= 2;

    return Size(width.round().toDouble(), height.round().toDouble());
  }

  static Size stickerContainerSize(double width, double height) {
    Size size = Size.zero;
    const double kMaxEdge = 180;
    if (width <= 0 || height <= 0) {
      size = Size(kMaxEdge, kMaxEdge);
    } else {
      if (width < height)
        size = Size(kMaxEdge * width / height, kMaxEdge);
      else
        size = Size(kMaxEdge, kMaxEdge * height / width);
    }
    return size;
  }

  static BorderRadius chatCellRadiusMine() {
    return Application.isARLanguage()
        ? const BorderRadius.only(
            topLeft: Radius.circular(ChatCellLayouts.cellRadius),
            topRight: Radius.circular(ChatCellLayouts.cellRadius),
            bottomRight: Radius.circular(ChatCellLayouts.cellRadius),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(ChatCellLayouts.cellRadius),
            topRight: Radius.circular(ChatCellLayouts.cellRadius),
            bottomLeft: Radius.circular(ChatCellLayouts.cellRadius),
          );
  }


  static String chatUnreadCount(int? unreadCount) {
    return unreadCount == null || unreadCount == 0
        ? ''
        : (unreadCount > 99 ? '99+' : unreadCount.toString());
  }


  static BorderRadius chatCellRadiusOther() {
    return Application.isARLanguage()
        ? const BorderRadius.only(
            topLeft: Radius.circular(ChatCellLayouts.cellRadius),
            topRight: Radius.circular(ChatCellLayouts.cellRadius),
            bottomLeft: Radius.circular(ChatCellLayouts.cellRadius),
          )
        : const BorderRadius.only(
            topLeft: Radius.circular(ChatCellLayouts.cellRadius),
            topRight: Radius.circular(ChatCellLayouts.cellRadius),
            bottomRight: Radius.circular(ChatCellLayouts.cellRadius),
          );
  }
}
