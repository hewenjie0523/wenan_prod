import 'dart:math';

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatBox.dart';
import 'package:wenan/data/chat/ChatDraft.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/db/dao/ChatBoxDao.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/proto/we_ps_im_object.pbenum.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';



class ChatListModule {
  int _chatCount = 0;

  int get chatCount => _chatCount;

  bool _hasChatUnread = false;

  bool get hasChatUnread => _hasChatUnread;

  List<ChatBox> _chatBoxes = [];

  List<ChatBox> get chatBoxes => _chatBoxes;

  int _compareChatBox(ChatBox a, ChatBox b) {
    int weightA = a.weight == -1 ? 0 : a.weight??0;
    int weightB = b.weight == -1 ? 0 : b.weight??0;
    if (weightA != weightB) {
      return weightB.compareTo(weightA);
    } else {
      return b.displayTime?.compareTo(a.displayTime??0)??0;
    }
  }

  Future _updateChatBoxInfoForListDisplay(ChatBox chatBox) async {
    if (chatBox.id == Application.chatContext.currentChatId) {
      chatBox.unreadCount = 0;
      updateChatBoxLastReadTime(chatBox.id!);
      AuvChatLog.d('_updateChatBoxInfoForListDisplay');
    }
    ChatSnap? snap = await Application.chatContext.dbService.snapDao
        .lastModelForChatBox(chatBox.id);
    ChatDraft? draft =
        Application.chatContext.draftManager.chatDraftForChatBox(chatBox.id);
    if (draft != null) {
      chatBox.lastContent =
          ChatUtils.convertChatListDraftContent(draft.content!);
      chatBox.lastSnapSendStatus = ChatSnapSendStatus.success.index;
      if (snap != null) {
        chatBox.updateTime = max(chatBox.updateTime!, snap.createTime!);
      }
      chatBox.displayTime = max(chatBox.updateTime!, draft.createTime!);
    } else {
      if (snap != null) {
        chatBox.lastContent = ChatUtils.convertChatListContent(
            snap, chatBox.unreadCount??0, chatBox.isSingle);
        chatBox.updateTime = max(chatBox.updateTime!, snap.createTime!);
      }
      chatBox.displayTime = chatBox.updateTime;
    }
  }

  void _updateChatBoxUnreadCount() {
    int unreadCount = 0;
    bool hasUnread = false;
    for (final c in _chatBoxes) {
      hasUnread = hasUnread || (c.unreadCount??0) > 0;
      unreadCount += (c.muted??false) ? 0 : c.unreadCount??0;
    }
    _chatCount = unreadCount;
    _hasChatUnread = hasUnread;
  }

  Future<bool> _loadChatBoxesByIds(List<int> ids) async {
    final cbs =
        await Application.chatContext.dbService.chatBoxDao.modelsByIds(ids);
    if (Utils.isEmptyList(cbs)) return false;
    for (final c in cbs!) {
      await _updateChatBoxInfoForListDisplay(c);
    }
    _chatBoxes.removeWhere((element) => cbs.contains(element));
    cbs.removeWhere((element) => element.hasChat!=true);
    _chatBoxes.addAll(cbs);
    _chatBoxes.sort(_compareChatBox);
    return true;
  }

  Future<bool> reloadChatBoxes() async {
    int unreadCount = 0;
    bool hasChatUnread = false;
    List<ChatBox> cbs = [];

    int types = ChatBoxDao.retrievalByType |
        ChatBoxDao.retrievalByWeight |
        ChatBoxDao.retrievalByHasSnap;
    final dbCbs = await Application.chatContext.dbService.chatBoxDao
        .modelsByRetrieval(Chatbox_Type.SINGLE.value, 0, types);
    AuvChatLog.d('ChatListModule - reloadChatBoxes: $dbCbs');
    if (dbCbs != null) {
      for (final e in dbCbs) {
        hasChatUnread = hasChatUnread || (e.unreadCount??0) > 0;
        unreadCount += (e.muted??false) ? 0 : Utils.parseInt(e.unreadCount)??0;
        await _updateChatBoxInfoForListDisplay(e);
        cbs.add(e);
      }
    }

    cbs.sort(_compareChatBox);

    _chatBoxes = cbs;
    _chatCount = unreadCount;
    _hasChatUnread = hasChatUnread;

    return true;
  }

  Future<bool> reloadChatBoxByIds(List<int>? ids) async {
    AuvChatLog.d(
        'ChatListModule - reloadChatBoxByAffectChatBoxes: ${ids.toString()}');
    if(ids==null){
      return false;
    }
    if (ids.isNotEmpty && await _loadChatBoxesByIds(ids)) {
      _updateChatBoxUnreadCount();
      return true;
    }
    return false;
  }

  Future<bool> reloadChatBoxByAffectChatBoxes(Map<String, List>? affects) async {
    AuvChatLog.d(
        'ChatListModule - reloadChatBoxByAffectChatBoxes: ${affects.toString()}');
    if (affects==null||affects.isEmpty) return false;
    bool ret = false;
    final deletions = affects[ChatEvent.AFFECT_DELETE];
    if (deletions != null && deletions.isNotEmpty) {
      ret = true;
      _chatBoxes.removeWhere((element) => deletions.contains(element));
    }
    Set<int> reloadIds = {};
    if (affects[ChatEvent.AFFECT_ADD] != null) {
      affects[ChatEvent.AFFECT_ADD]?.forEach((e) {
        reloadIds.add(e.id);
      });
    }
    if (affects[ChatEvent.AFFECT_UPDATE] != null) {
      affects[ChatEvent.AFFECT_UPDATE]?.forEach((e) {
        reloadIds.add(e.id);
      });
    }
    if (await _loadChatBoxesByIds(reloadIds.toList())) ret = true;
    if (ret) _updateChatBoxUnreadCount();
    return ret;
  }

  void updateChatBoxLastReadTime(int? id) async {
    if (id == null) return;
    final lastSnap =
        await Application.chatContext.dbService.snapDao.lastModelForChatBox(id);
    if (lastSnap != null) {
      Application.chatContext.dbService.chatBoxDao
          .updateModelLastReadSnapTime(id, lastSnap.createTime!)
          .then((ret) {
        if (ret) {
          Application.eventBus.fire(ChatEvent(
            ChatEventType.chatBoxReloadByIds,
            chatIds: [id],
          ));
        }
      });
    }
  }
}
