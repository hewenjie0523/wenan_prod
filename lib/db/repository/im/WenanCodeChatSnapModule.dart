

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

class ChatSnapModule {
  List<ChatSnap>? _snapsByCheckingSendStatus(List<ChatSnap>? snaps) {
    if (Utils.isEmptyList(snaps)) return null;
    for (final s in snaps!.toList()) {
      if (s.sendStatus == ChatSnapSendStatus.sending.index) {
        final sending = Application.chatContext.sendQueue.sendingSnap(s);
        if (sending == null) {
          s.sendStatus = ChatSnapSendStatus.failed.index;
          s.sendStatus = ChatSnapSendStatus.failed.index;
        } else {
          final index = snaps.indexOf(s);
          if (index > -1) {
            snaps.removeAt(index);
            snaps.insert(index, sending);
          }
        }
      }
    }
    return snaps;
  }

  Future<ChatSnap?> lastSnapForChatBox(int cid) async {
    Future future =
        Application.chatContext.dbService.snapDao.lastModelForChatBox(cid);
    return future.then((snap) {
      return snap == null ? null : _snapsByCheckingSendStatus([snap])?.first;
    });
  }

  Future<List<ChatSnap>?> snapsForChatBoxByTimeDesc(int? cid,
      [int page = 1, int size = 20]) async {
    Future future = Application.chatContext.dbService.snapDao
        .modelsByTimeDescForChatBox(cid, page, size);
    return future.then((snaps) {
      return _snapsByCheckingSendStatus(snaps);
    });
  }

  /// time <= toTime
  Future<List<ChatSnap>?> snapsForChatBoxByToTime(int? cid, int? toTime,
      [int size = 20]) async {
    Future future = Application.chatContext.dbService.snapDao
        .modelsByToTimeForChatBox(cid, toTime, size);
    return future.then((snaps) {
      return _snapsByCheckingSendStatus(snaps);
    });
  }

  /// time >= fromTime && time < toTime，当 toTime 指定时，size 无用
  Future<List<ChatSnap>?> snapsForChatBoxByTime(int? cid,
      [int? fromTime, int? toTime, int size = 20]) async {
    Future future = Application.chatContext.dbService.snapDao
        .modelsByTimeForChatBox(cid, fromTime, toTime, size);
    return future.then((snaps) {
      return _snapsByCheckingSendStatus(snaps);
    });
  }

  Future<int> countOfModelsForChatBox(int cid) async {
    return Application.chatContext.dbService.snapDao
        .countOfModelsForChatBox(cid);
  }

  Future<int> countOfNewSnapsForChatBox(int cid, int fromTime) async {
    return Application.chatContext.dbService.snapDao
        .countOfNewModelsForChatBox(cid, fromTime);
  }

  Future<List<ChatSnap>?> sendingOrFailedSnapsForChatBox(int cid) async {
    Future future = Application.chatContext.dbService.snapDao
        .sendingOrFailedSnapsForChatBox(cid);
    return future.then((snaps) {
      return _snapsByCheckingSendStatus(snaps);
    });
  }

  Future deleteSnap(ChatSnap snap) async {
    return Application.chatContext.dbService.snapDao.deleteModel(snap);
  }

  Future saveLocalSnap(ChatSnap? snap) async {
    if (snap == null) return;
    return saveLocalSnaps([snap]);
  }

  Future saveLocalSnaps(List<ChatSnap>? snaps) async {
    if (snaps == null || snaps.isEmpty) return;

    for (var s in snaps) {
      s.sendStatus = ChatSnapSendStatus.sending.index;
      Application.eventBus
          .fire(ChatEvent(ChatEventType.snapSendStatus, object: s));
    }

    await Application.chatContext.dbService.snapDao.saveOrUpdateModels(snaps);
    await Application.chatContext.dbService.chatBoxDao
        .updateModelHasChatAndWeight(snaps.first.chatBoxId!, true, 0);
    Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadByIds,
        chatIds: [snaps.first.chatBoxId!]));
  }

  Future deleteLocalSnap(ChatSnap? snap, [bool sendNotification = false]) async {
    if (snap == null) return;
    await Application.chatContext.dbService.snapDao.deleteModel(snap);
    if (sendNotification) {
      Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadByIds,
          chatIds: [snap.chatBoxId!]));
    }
  }

  Future updateLocalSnap(ChatSnap snap) async {
    if (snap == null) return;
    return Application.chatContext.dbService.snapDao.saveOrUpdateModels([snap]);
  }

  Future updateLocalSnapWithServerId(ChatSnap snap, int serverId) async {
    snap.id = serverId;
    return updateLocalSnapWithSendStatus(snap, ChatSnapSendStatus.success);
  }

  Future updateLocalSnapWithSendStatus(
      ChatSnap snap, ChatSnapSendStatus status) async {
    snap.sendStatus = status.index;
    await updateLocalSnap(snap);
    Application.eventBus.fire(
        ChatEvent(ChatEventType.chatBoxReloadByIds, chatIds: [snap.chatBoxId!]));
    Application.eventBus
        .fire(ChatEvent(ChatEventType.snapSendStatus, object: snap));
  }
}
