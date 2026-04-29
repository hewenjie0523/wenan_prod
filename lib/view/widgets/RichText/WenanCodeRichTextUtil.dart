import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/utils/WenanCodeChatEmojiManager.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

const String kRichTextATRegular = "@[\\s\\S]{1,}?\\([0-9]:[\\s\\S]{1,}?\\) ";

const String kEmojiRegular = "\\[[\\s\\S]{1,}?\\](\\(http[s]{0,1}[\\s\\S]{1,}?\\)|\\(\\))";
const String kEmojiIconRegular = "\\[[\\s\\S]{1,}?\\]\\(\\)";
const String kEmojiNameRegular = "\\[[\\s\\S]{1,}?\\]";

enum WERichTextAtType {
  TTRichTextAtTypeUser,
  TTRichTextAtTypeRole,
  TTRichTextAtTypeAll,
}

enum WERichTextAtParamType {
  TTRichTextAtParamTypeType,
  TTRichTextAtParamTypeTargetID,
  TTRichTextAtParamTypeShowAT,
  TTRichTextAtParamTypeShowSpace,
  TTRichTextAtParamTypeBold,
  TTRichTextAtParamTypeColor,
  TTRichTextAtParamTypePerson,
}

class RichTextUtil {
  static String getCopyText(String? text) {

    if(text==null){
      return "";
    }
    String ret = text;
    ret = _simplifyATText(ret);
    ret = _simplifyEmojiText(ret);
    return ret;
  }

  static List<InlineSpan> getRichText(String? text, {TextStyle? style, Color? atColor}) {
    AuvChatLog.d("getRichText,text=$text",tag: "chat");
    style ??= const TextStyle(fontSize: 15, color: Color(0xFF666666));
    List<InlineSpan> texts = <InlineSpan>[];
    if(text!=null){
      List<dynamic> atList = RichTextUtil.matchATText(text,
          style: TextStyle(color: Color(0xFF3CC1F6), fontSize: style.fontSize, fontWeight: style.fontWeight),
          atColor: atColor);
      AuvChatLog.d("getRichText,atList=$atList",tag: "chat");
      for (dynamic atObj in atList) {
        if (atObj is String) {
          List<dynamic> emojiList = RichTextUtil.matchEmojiText(atObj, style: style);
          for (dynamic emojiObj in emojiList) {
            if (emojiObj is String) {
              texts.add(TextSpan(text: emojiObj, style: style));
            } else if (emojiObj is InlineSpan) {
              texts.add(emojiObj);
            }
          }
        } else if (atObj is InlineSpan) {
          texts.add(atObj);
        }
      }
    }
    AuvChatLog.d("getRichText,texts=$texts",tag: "chat");
    return texts;
  }

  static List<dynamic> matchATText(String text, {TextStyle? style, Color? atColor}) {
    style ??= const TextStyle(fontSize: 15, color: Color(0xFF666666));
    List atTextsList = [];

    Iterable<RegExpMatch> matches = RegExp(kRichTextATRegular).allMatches(text);

    int start = 0;
    for (Match m in matches) {
      String match = m.group(0)??"";
      if (m.start > start) {
        String tempText = text.substring(start, m.start);
        atTextsList.add(tempText);
      }

      List matchList = match.split('(');
      String atString = matchList.first;
      String atInfo = matchList.last;
      atInfo.replaceAll(')', '');
      List atInfoList = atInfo.split(':');
      if (atInfoList.length > 0) {
        WERichTextAtType atType = WERichTextAtType.TTRichTextAtTypeUser;
        String targetID = "";
        bool showAt = true;
        bool showSpace = true;
        bool isBold = true;
        String colorStr = "";
        bool isPerson = true;
        for (int i = 0; i < atInfoList.length && i < WERichTextAtParamType.values.length; i++) {
          String configStr = atInfoList[i];
          switch (WERichTextAtParamType.values[i]) {
            case WERichTextAtParamType.TTRichTextAtParamTypeType:
              int atTypeIndex = Utils.stringToInt(configStr)??0;
              if (atTypeIndex < WERichTextAtType.values.length) {
                atType = WERichTextAtType.values[atTypeIndex];
              }
              break;
            case WERichTextAtParamType.TTRichTextAtParamTypeTargetID:
              targetID = configStr;
              break;
            case WERichTextAtParamType.TTRichTextAtParamTypeShowAT:
              if (configStr.length > 0) {
                showAt = configStr != '0';
              }
              break;
            case WERichTextAtParamType.TTRichTextAtParamTypeShowSpace:
              if (configStr.length > 0) {
                showSpace = configStr != '0';
              }
              break;
            case WERichTextAtParamType.TTRichTextAtParamTypeBold:
              if (configStr.length > 0) {
                isBold = configStr != '0';
              }
              break;
            case WERichTextAtParamType.TTRichTextAtParamTypeColor:
              colorStr = configStr;
              break;
            case WERichTextAtParamType.TTRichTextAtParamTypePerson:
              if (configStr.length > 0) {
                isPerson = configStr != '0';
              }
              break;

            default:
              break;
          }
        }

        if (atType == WERichTextAtType.TTRichTextAtTypeAll) {
          atTextsList.add(TextSpan(
              text: atString,
              style: TextStyle(
                  fontSize: style.fontSize,
                  color: atColor != null ? atColor : Color(0xFF333333),
                  fontWeight: FontWeight.w600)));
        } else {
          if (isPerson &&
              atType == WERichTextAtType.TTRichTextAtTypeUser &&
              Utils.stringToInt(targetID) == Application.currUserId()) {
            atString = "@你";
          }
          if (showSpace) {
            atString += ' ';
          }
          if (!showAt) {
            atString = atString.replaceFirst('@', '');
          }

          atColor ??= colorStr.isNotEmpty ? Utils.parseColor(colorStr) : style.color;
          atTextsList.add(TextSpan(
              text: atString,
              style: TextStyle(
                  fontSize: style.fontSize, color: atColor, fontWeight: isBold ? FontWeight.w600 : style.fontWeight)));
        }
      }

      start = m.end;
    }

    if (text.length > start) {
      String tempText = text.substring(start, text.length);
      atTextsList.add(tempText);
    }

    return atTextsList;
  }

  static String _simplifyEmojiText(String text) {
    List<String> texts = [];
    Iterable<RegExpMatch> matches = RegExp(kEmojiRegular).allMatches(text);

    int start = 0;
    for (Match m in matches) {
      String match = m.group(0)??"";
      if (m.start > start) {
        texts.add(text.substring(start, m.start));
      }

      RegExpMatch? expMatch = RegExp(kEmojiNameRegular).firstMatch(match);
      String? emojiName = expMatch?.group(0);
      if(emojiName!=null){
        texts.add(emojiName);
      }


      start = m.end;
    }

    if (text.length > start) {
      String tempText = text.substring(start, text.length);
      texts.add(tempText);
    }

    return texts.join();
  }

  static List<dynamic> matchEmojiText(String text, {TextStyle? style}) {
    style ??= const TextStyle(fontSize: 15, color: Color(0xFF666666));
    List texts = [];
    Iterable<RegExpMatch> matches = RegExp(kEmojiRegular).allMatches(text);

    int start = 0;
    for (Match m in matches) {
      String match = m.group(0)??"";
      if (m.start > start) {
        texts.add(text.substring(start, m.start));
      }


      Utils.nullSafe<RegExpMatch>(RegExp(kEmojiNameRegular).firstMatch(match),notNullBlock: (expMatch){
        if (RegExp(kEmojiIconRegular).hasMatch(match)) {
          String? emojiName = expMatch.group(0)??"";
          String? emojiIconPath;
          if (ChatEmojiManager.instance.dic[emojiName] != null) {
            emojiIconPath = ChatEmojiManager.instance.basePath + ChatEmojiManager.instance.dic[emojiName]!.icon!;
          }
          if (emojiIconPath != null && emojiIconPath.isNotEmpty) {
            double width = style!.fontSize ?? 15;
            width += 2;
            Image image = Image.file(
              File(emojiIconPath),
              fit: BoxFit.fitWidth,
              width: width,
              height: width,
            );
            texts.add(WidgetSpan(alignment: PlaceholderAlignment.middle, child: image));
          } else {
            texts.add(match);
          }
        } else if (match.length > expMatch.end + 1) {
          String urlString = match.substring(expMatch.end + 1, match.length - 1);
          if (urlString.isNotEmpty) {
            double width = style!.fontSize ?? 15;
            Image image = Image(
              image: CachedNetworkImageProvider(urlString),
              fit: BoxFit.fitWidth,
              width: width,
              height: width,
            );
            texts.add(WidgetSpan(alignment: PlaceholderAlignment.middle, child: image));
          } else {
            texts.add(match);
          }
        }
      });


      start = m.end;
    }

    if (text.length > start) {
      String tempText = text.substring(start, text.length);
      texts.add(tempText);
    }

    return texts;
  }

  static String _simplifyATText(String text) {
    List<String> atTextsList = [];

    Iterable<RegExpMatch> matches = RegExp(kRichTextATRegular).allMatches(text);

    int start = 0;
    for (Match m in matches) {
      String match = m.group(0)??"";
      if (m.start > start) {
        String tempText = text.substring(start, m.start);
        atTextsList.add(tempText);
      }

      List matchList = match.split('(');
      String atString = matchList.first;
      String atInfo = matchList.last;
      atInfo.replaceAll(')', '');
      List atInfoList = atInfo.split(':');
      if (atInfoList.length > 0) {
        WERichTextAtType atType = WERichTextAtType.TTRichTextAtTypeUser;
        String targetID = "";
        bool showAt = true;
        bool showSpace = true;
        bool isPerson = true;
        for (int i = 0; i < atInfoList.length && i < WERichTextAtParamType.values.length; i++) {
          String configStr = atInfoList[i];
          switch (WERichTextAtParamType.values[i]) {
            case WERichTextAtParamType.TTRichTextAtParamTypeType:
              int atTypeIndex = Utils.stringToInt(configStr)??0;
              if (atTypeIndex < WERichTextAtType.values.length) {
                atType = WERichTextAtType.values[atTypeIndex];
              }
              break;
            case WERichTextAtParamType.TTRichTextAtParamTypeTargetID:
              targetID = configStr;
              break;
            case WERichTextAtParamType.TTRichTextAtParamTypeShowAT:
              if (configStr.length > 0) {
                showAt = configStr != '0';
              }
              break;
            case WERichTextAtParamType.TTRichTextAtParamTypeShowSpace:
              if (configStr.length > 0) {
                showSpace = configStr != '0';
              }
              break;
            case WERichTextAtParamType.TTRichTextAtParamTypePerson:
              if (configStr.length > 0) {
                isPerson = configStr != '0';
              }
              break;

            default:
              break;
          }
        }

        if (atType != WERichTextAtType.TTRichTextAtTypeAll) {
          if (isPerson &&
              atType == WERichTextAtType.TTRichTextAtTypeUser &&
              Utils.stringToInt(targetID) == Application.currUserId()) {
            atString = "@你";
          }
          if (showSpace) {
            atString += ' ';
          }
          if (!showAt) {
            atString = atString.replaceFirst('@', '');
          }
        }

        atTextsList.add(atString);
      }

      start = m.end;
    }

    if (text.length > start) {
      String tempText = text.substring(start, text.length);
      atTextsList.add(tempText);
    }

    return atTextsList.join();
  }


  static List<InlineSpan> formatSearchTextInText(
    String text,
    String searchText,
    TextStyle style, {
    Color? searchColor,
    TextStyle? searchStyle,
  }) {
    List<InlineSpan> spans = [];
    if (Utils.isEmptyString(searchText) ||
        (searchColor == null && searchStyle == null) ||
        !text.contains(searchText)) {
      spans.add(TextSpan(text: text, style: style));
      return spans;
    }

    int start = 0;
    searchStyle = searchStyle ?? style.merge(TextStyle(color: searchColor));
    final RegExp keyPattern = RegExp(searchText);
    final allMatches = keyPattern.allMatches(text);
    for (final match in allMatches) {
      final searchedText = match.group(0);
      if (match.start > start) {
        final str = text.substring(start, match.start);
        spans.add(TextSpan(text: str, style: style));
      }
      spans.add(TextSpan(
          text: searchedText,
          style: searchStyle));
      start = match.end;
    }
    if (start < text.length) {
      final str = text.substring(start, text.length);
      spans.add(TextSpan(text: str, style: style));
    }

    return spans;
  }

  static List<InlineSpan> formatSearchFristTextInText(
    String text,
    String searchText,
    TextStyle style, {
    Color? searchColor,
    TextStyle? searchStyle,
  }) {
    List<InlineSpan> spans = [];
    if (Utils.isEmptyString(searchText) ||
        (searchColor == null && searchStyle == null) ||
        !text.contains(searchText)) {
      spans.add(TextSpan(text: text, style: style));
      return spans;
    }

    int start = 0;
    searchStyle = searchStyle ?? style.merge(TextStyle(color: searchColor));
    final RegExp keyPattern = RegExp(searchText);
    var matched = keyPattern.firstMatch(text);
    var searchedText = matched?.group(0);
    if ((matched?.start??0) > start) {
      final str = text.substring(start, matched!.start);
      spans.add(TextSpan(text: str, style: style));
    }
     spans.add(TextSpan(
          text: searchedText,
          style: searchStyle));
      start = matched?.end??0;
    if (start < text.length) {
      final str = text.substring(start, text.length);
      spans.add(TextSpan(text: str, style: style));
    }
    return spans;
  }


}
