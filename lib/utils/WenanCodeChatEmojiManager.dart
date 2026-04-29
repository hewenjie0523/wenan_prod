import 'dart:convert';
import 'dart:io';


import 'package:archive/archive.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/data/AppEmoji.dart';
import 'package:wenan/data/AppEmojiCategory.dart';
import 'package:wenan/utils/WenanCodePathUtils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:path/path.dart' as Path;

import 'WenanCodelog.dart';
import 'package:flutter/services.dart' show rootBundle;

//{id: 113, icon: 100/113.png, name: [鄙视]}
///chat_emoji_res 不再使用
/// emojiTextList 仍在使用

class ChatEmojiManager {
  final String kEmojiNameRegular = "\\[[\\s\\S]{1,}?\\]";

  String basePath = "";
  List<AppEmojiCategory> list = [];
  Map<String, AppEmoji> dic = {};

  static ChatEmojiManager get instance => _getInstance();
  static ChatEmojiManager? _instance;

  static ChatEmojiManager _getInstance() {
    return _instance ??= ChatEmojiManager._internal();
  }

  ChatEmojiManager._internal(){
    basePath = chatEmojiPath();
  }

  void dispose() => _instance = null;

  void getEmojiInfoList() {
    _checkVersion();
    if(list.isEmpty){
      AuvChatLog.d("getEmojiInfoList:${File(chatEmojiPath()).path}");
     var listJson = File(chatEmojiPath()+kChatEmojiResArrayName).readAsStringSync();
     AuvChatLog.d("listJson=$listJson",tag:"ChatEmojiManager");
     var tempList =(jsonDecode(listJson) as List<dynamic>?)
         ?.map((e) => AppEmojiCategory.fromJson(e as Map<String, dynamic>))
         .toList();
     Utils.nullSafe<List<AppEmojiCategory>>(tempList,notNullBlock: (notNullList){
       // notNullList.sort((o1,o2){
       //   return o2.id!-o1.id!;
       // });
       list.addAll(notNullList);
     });
     var dictJson = File(chatEmojiPath()+kChatEmojiResDicName).readAsStringSync();
     var tempMap = (jsonDecode(dictJson) as Map<String,dynamic>?);
     Utils.nullSafe<Map<String,dynamic>>(tempMap,notNullBlock: (notNull){
       for (var element in notNull.keys) {
         dic[element] = AppEmoji.fromJson(notNull[element]);
       }
     });
    }
    AuvChatLog.d("list=$list",tag:"ChatEmojiManager");
    AuvChatLog.d("dic=$dic",tag:"ChatEmojiManager");
    // Application.callPlatformMethodSafely(
    //   'getChatEmojiIconInfo',
    // ).then((data) {
    //   if (!Utils.isEmpty(data)) {
    //     try {
    //       Map<String, dynamic> json = jsonDecode(data);
    //       final cateList = json['list'] as List;
    //       final emojiDic = json['dic'] as Map;
    //       basePath = json['basePath'] as String;
    //       list.addAll(cateList.map((e) => AppEmojiCategory.fromJson(e)).toList());
    //       dic.addAll(emojiDic.map((key, value) => MapEntry(key, AppEmoji.fromJson(value))));
    //       AuvChatLog.d('ChatEmojiManager basePath = $basePath');
    //       AuvChatLog.d('ChatEmojiManager list = $cateList');
    //       AuvChatLog.d('ChatEmojiManager dic = $emojiDic');
    //     } catch (e) {
    //       print(e);
    //     }
    //   }
    // });
  }

  String checkEmojiText(String? text) {
    if (text == null || text.length == 0) {
      return "";
    }
    String returnText = '';
    Iterable<RegExpMatch> matches = RegExp(kEmojiNameRegular).allMatches(text);
    int start = 0;
    for (Match m in matches) {
      String? match = m.group(0);
      if (m.start > start) {
        String tempText = text.substring(start, m.start);
        returnText += tempText;
      }
      Utils.nullSafe<String>(match,notNullBlock: (obj)=>returnText += obj);
      if (dic[match] != null) {
        returnText += '()';
      }
      start = m.end;
    }
    if (text.length > start) {
      String tempText = text.substring(start, text.length);
      returnText += tempText;
    }
    return returnText;
  }

  static final List<String> emojiTextList = [
    '🙂',
    '😀',
    '😁',
    '😉',
    '😍',
    '😘',
    '😜',
    '🤑',
    '🤗',
    '😚',
    '😇',
    '😎',
    '🤓',
    '😔',
    '☹️',
    '😁',
    '😡',
    '😭',
    '😓',
    '😪',
    '😳',
    '😱',
    '😰',
    '😴',
    '🤔',
    '🙄️',
    '😬',
    '🤒',
    '🤖️',
    '😈',
    '💩',
    '👻',
    '👽',
    '🛀',
    '👯',
    '🙏',
    '👏',
    '🙌',
    '👍',
    '👎',
    '✌️',
    '🤘',
    '👌',
    '👈',
    '👉',
    '👆',
    '👇',
    '👋',
    '💪',
    '🖕',
    '💋',
    '👄',
    '❤️',
    '💔',
    '💓',
    '💘',
    '🎉',
    '🎁',
    '🌹',
    '💣',
    '🦄️',
    '🐶',
    '🐯',
    '🐷',
    '🍏',
    '🍉',
    '🍗',
    '🍭',
    '🎂',
    '🍩',
    '🍾️',
    '🍺',
    '☕️',
    '👑',
    '💰',
    '🕶',
    '🔥',
    '☀️',
    '🌙',
    '🌈',
    '☁️',
    '⛈',
    '❄️',
    '🌫',
    '☔️',
    '💨',
    '☘️',
    '☮️',
    '💢',
  ];



  static String kAppConfigPathResourcePath = "unzip_resource";

  static String kChatEmojiResVersionKey = "kChatEmojiResVersionKey";
  static String kChatEmojiResName = "chat_emoji_res";
  static String kChatEmojiResArrayName = "chat_emoji_array.json";
  static String kChatEmojiResDicName = "chat_emoji_dic.json";

  int chatEmojiResourcesVersion() {
    /**
     * 1 : 初始
     */
    return 1;
  }

  _checkVersion() async{
    if(_shouldUnzipChatEmojiResources()){
      await _unzipChatEmojiResource();
      _updateChatEmojiResourcesUnzipFlag();
      list.clear();
      dic.clear();
    }
  }

  bool _shouldUnzipChatEmojiResources() {
    return SpHelper.getInt(kChatEmojiResVersionKey) !=
        chatEmojiResourcesVersion();
  }

  _updateChatEmojiResourcesUnzipFlag() {
    SpHelper.putInt(kChatEmojiResVersionKey,
        chatEmojiResourcesVersion());
  }

   String chatEmojiPath() {
    return Path.join(Application.appRootPath,'$kAppConfigPathResourcePath/$kChatEmojiResName/');
  }

  _unzipChatEmojiResource() async{
    AuvChatLog.d("_unzipChatEmojiResource:${chatEmojiPath()}",tag: "ChatEmojiManager");
    PathUtils.makeSureDirectory(chatEmojiPath());
    // Read the Zip file from disk.
    final bytes = await rootBundle.load('assets/$kChatEmojiResName.zip');
    // Decode the Zip file
    final archive = ZipDecoder().decodeBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
    // Extract the contents of the Zip archive to disk.
    for (final file in archive) {
      final filename = file.name;
      if (file.isFile) {
        final data = file.content as List<int>;
        File(chatEmojiPath() + filename)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory(chatEmojiPath() + filename).create(recursive: true);
      }
    }
  }
}
