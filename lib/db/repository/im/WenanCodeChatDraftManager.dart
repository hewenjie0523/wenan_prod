import 'dart:convert';
import 'dart:ffi';

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/data/chat/ChatDraft.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/utils/WenanCodeutils.dart';


class ChatDraftManager {
  static const String DRAFT_STORE_KEY = 'SharedPreferences_ChatDraftStoreKey';

  final Map<String, String> _chattingDrafts = {};
  Map<String, ChatDraft> _chatDrafts = {};

  String _saveKey(int id) => id.toString();

  void loadDrafts() {
    final draftInfo = SpHelper.getCurrUserString(DRAFT_STORE_KEY);
    if (draftInfo == null) return;
    final info = (jsonDecode(draftInfo) as Map<String, dynamic>).cast<String, Map<String, dynamic>>();
    _chatDrafts = info.map((key, value) => MapEntry(key, ChatDraft.fromJson(value)));
  }

  Future<bool> saveChatDrafts() {
    Future future = Future.value(Void);
    _chattingDrafts.forEach((key, value) {
      future = future.then((value) => _saveChatDraftContentForChatBox(Utils.parseInt(key)!, value));
    });
    return future.then((value) {
      _chattingDrafts.clear();
      final info = _chatDrafts.map((key, value) => MapEntry(key, value.toJson()));
      SpHelper.putCurrUserString(DRAFT_STORE_KEY, jsonEncode(info));
      return true;
    });
  }

  Future<bool> _saveChatDraftContentForChatBox(
    int id,
    String? draftContent,
  ) {
    Future future = Future.value(Void);
    final key = _saveKey(id);
    var draft = _chatDrafts[key];
    if ((draft == null && !Utils.isEmptyString(draftContent)) ||
        (draft != null &&
            (draft.content != draftContent || (Utils.isEmptyString(draft.content) != Utils.isEmptyString(draftContent))))) {
      if (Utils.isEmptyString(draftContent)) {
        _chatDrafts.remove(key);
      } else {
        if (draft == null) {
          draft = ChatDraft()..id = id;
          _chatDrafts[key] = draft;
        }
        draft
          ..content = draftContent
          ..createTime = DateTime.now().millisecondsSinceEpoch;
        future = future
            .then((value) => Application.chatContext.dbService.chatBoxDao.updateModelHasChatAndWeight(id, false, 0));
      }
      return future.then((value) => true);
    }
    return future.then((value) => false);
  }

  ChatDraft? chatDraftForChatBox(int? id) {
    if(id==null){
      return null;
    }
    String key = _saveKey(id);
    return _chatDrafts[key];
  }

  String? chatDraftContentForChatBox(int id) {
    String key = _saveKey(id);
    return _chattingDrafts[key] ?? _chatDrafts[key]?.content;
  }

  Future<bool> saveChattingDraftForChatBox(int? id) {
    if (id == null) return Future.value(false);
    Future future = Future.value(Void);
    String key = _saveKey(id);
    future = future.then((value) => _saveChatDraftContentForChatBox(id, _chattingDrafts[key]));
    future.then((value) {
      _chattingDrafts.remove(key);
      if (value) Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadByIds, chatIds: [id]));
    });
    return future.then((value) => true);
  }

  void saveChattingDraftContentForChatBox(int id, String draftContent) {
    String key = _saveKey(id);
    _chattingDrafts[key] = draftContent;
  }
}
