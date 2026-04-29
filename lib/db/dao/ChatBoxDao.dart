

import 'package:drift/drift.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/data/chat/ChatBox.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/db/database/ChatDB.dart';
import 'package:wenan/db/entity/WenanCodeChatBoxEntities.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/utils/WenanCodelog.dart';

import '../../data/chat/ChatSnap.dart';
import 'ChatBoxMemberDao.dart';
import 'SnapDao.dart';
import 'UserDao.dart';

part 'ChatBoxDao.g.dart';

@DriftAccessor(tables: [ChatBoxEntities])
class ChatBoxDao extends DatabaseAccessor<ChatDB> with _$ChatBoxDaoMixin {
  static int retrievalByType = 1 << 0;
  static int retrievalByWeight = 1 << 1;
  static int retrievalByHasSnap = 1 << 2;
  static int retrievalByOrderWeight = 1 << 3;
  static int retrievalByOrderTime = 1 << 4;

  ChatBoxDao(ChatDB db, this._snapDao, this._userDao, this._chatBoxMemberDao) : super(db);

  static const String _lastSyncStoreKey = 'chatBox_lastSyncKey';

  int get lastSyncKey => SpHelper.getCurrUserInt(_lastSyncStoreKey, defaultValue: 0)!;

  set lastSyncKey(int key) => SpHelper.putCurrUserInt(_lastSyncStoreKey, key);

  final SnapDao _snapDao;
  final UserDao _userDao;
  final ChatBoxMemberDao _chatBoxMemberDao;

  Future<ChatBoxEntity?> _entityById(int id) {
    final query = select(chatBoxEntities)..where((e) => e.id.equals(id));
    return query.getSingleOrNull();
  }

  Future<ChatBox?> _modelByEntity(ChatBoxEntity? e) async {
    if (e == null) return null;
    final m = _modelFromEntity(e);
    List<ChatBoxMemberEntity> memberIds = await _chatBoxMemberDao.entitiesForChatBox(e.id);
    List<int> ids = memberIds.map((e) => e.uid).toList();
    m?.members = await _userDao.modelsByIds(ids);
    m?.unreadCount = await _snapDao.countOfNewModelsForChatBox(m.id, m.lastReadSnapTime);
    return m;
  }

  Future<List<ChatBox>?> _modelsByEntities(List<ChatBoxEntity>? es) async {
    if (es == null || es.isEmpty) return null;
    List<ChatBox> ms = [];
    for (final e in es) {
      final m = await _modelByEntity(e);
      if (m != null) ms.add(m);
    }
    return ms;
  }

  Future<ChatBox?> modelById(int? id) async {
    if (id == null || id == 0) return null;
    return _modelByEntity(await _entityById(id));
  }

  Future<ChatBox?> serviceModel() async {
    final query = select(chatBoxEntities)..where((e) => e.serviceChat.equals(true));
    return _modelByEntity(await query.getSingleOrNull());
  }

  Future<List<ChatBox>?> modelsByIds(List<int>? ids) async {
    if (ids == null || ids.isEmpty) return null;
//    final query = select(chatBoxEntities)..where((e) {
//      return e.id.isIn(ids);
//    });
//    final result = await query.get();
//    return modelsByEntities(result);
    return transaction(() async {
      List<ChatBox> models = [];
      for (final id in ids) {
        final m = await modelById(id);
        if (m != null) models.add(m);
      }
      return models;
    });
  }

  Future<bool> canDeleteChatBoxMember(int uid) async {
    return _chatBoxMemberDao.hasMemberChatBox(uid);
  }
  Future<ChatBox?> getChatBox(int uid) async {
    ChatBoxMemberEntity? entity = await _chatBoxMemberDao.getMemberChatBoxByUid(uid);
    if(entity != null){
      return modelById(entity.cid);
    }
    return null;
  }

  Future updateChatBoxUserInfo(int uid, String avatarUrl, String nickName) async{

    ChatBox? chatBox = await getChatBox(uid);
    if(chatBox != null){

      if(chatBox.name != nickName){
        chatBox.name = nickName;
        CommonUser? user = await _userDao.modelById(uid);
        if(user != null){
          user.avatar_url = avatarUrl;
          user.nick_name = nickName;
          _userDao.saveOrUpdateModels([user]);
        }
      }

      if(chatBox.coverURL != avatarUrl){
        chatBox.coverURL = avatarUrl;

        final snapList = await _snapDao.allSearchableChatSnapForChatBox(chatBox.id);
        if(snapList != null){
          final changedSnapList = <ChatSnap>[];
          for(var snap in snapList){
            if(snap.owner == uid){
              snap.ownerName = nickName;
              snap.ownerHead = avatarUrl;
              changedSnapList.add(snap);
            }
          }
          if(changedSnapList.isNotEmpty){
            await _snapDao.saveOrUpdateModels(changedSnapList);
            Map<String, List<ChatSnap>> affects = {};
            affects[ChatEvent.AFFECT_UPDATE] = changedSnapList;
            Application.eventBus.fire(ChatEvent(ChatEventType.snapSync, affects: affects));
          }
        }

        await saveOrUpdateModels([chatBox]);
        await updateModelHasChatAndWeight(chatBox.id!, true, 0);
        Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadByIds,
            chatIds: [chatBox.id!]));
      }

    }
  }

  Future<List<ChatBox>?> modelsByType(int type) async {
    int retrievalTypes = retrievalByType | retrievalByOrderWeight | retrievalByOrderTime;
    return modelsByRetrieval(type, 0, retrievalTypes);
  }

  Future<List<ChatBox>?> modelsByRetrieval(int type, int weight, int retrievalTypes) async {
    final query = select(chatBoxEntities)
      ..where((e) {
        Expression<bool>? ret;
        if ((retrievalTypes & retrievalByType) > 0) {
          ret = e.type.equals(type);
        }
        if ((retrievalTypes & retrievalByWeight) > 0) {
          final v = e.weight.isBiggerOrEqualValue(weight);
          ret = ret == null ? v : ret & v;
        }
        if ((retrievalTypes & retrievalByHasSnap) > 0) {
          final v = e.hasChat.equals(true);
          ret = ret == null ? v : ret & v;
        }
        return ret??e.id.isBiggerThanValue(-1);
      })
      ..orderBy([
        (e) => OrderingTerm(expression: e.weight, mode: OrderingMode.desc),
        (e) => OrderingTerm(expression: e.updateTime, mode: OrderingMode.desc),
      ]);
    final ret = await query.get();
    return _modelsByEntities(ret);
  }

  Future saveOrUpdateModels(List<ChatBox>? models) async {
    if (models == null || models.isEmpty) return;

    return transaction(() async {
      Set<CommonUser> usersWillDelete = {};
      for (final m in models) {
        final lastSnap = await _snapDao.lastModelForChatBox(m.id);
        m.hasChat = lastSnap != null;
        final e = await modelById(m.id);
        if (e == null) {
          var toSave = _modelToEntityCompanion(m);
          if(toSave!=null){
            await into(chatBoxEntities).insert(toSave);
          }

        } else {
          if (!m.isSingle) {
            e.members?.removeWhere((e) => m.members?.contains(e)??false);
            await _chatBoxMemberDao.deleteEntitiesForChatBox(e.id!, e.members);
            if(e.members!=null){
              usersWillDelete.addAll(e.members!);
            }

          }
          var updateVo = _modelToEntityCompanion(m, e);
          if(updateVo!=null){
            await update(chatBoxEntities).replace(updateVo);
          }

        }
        await _userDao.saveOrUpdateModels(m.members);
        if(m.id!=null&&!Utils.isEmpty(m.members)){
          await _chatBoxMemberDao.saveEntitiesForChatBox(m.id!, m.members!);
        }

      }

      List<CommonUser> usersToDelete = [];
      for (final u in usersWillDelete) {
        if (await canDeleteChatBoxMember(u.uid!)) {
          usersToDelete.add(u);
        }
      }
      await _userDao.deleteModels(usersToDelete);
    });
  }

  /// dynamic is int or ChatBox
  Future deleteModels(List<dynamic> models) async {
    if (models == null || models.isEmpty) return;

    return transaction(() async {
      Set<CommonUser> usersWillDelete = {};
      for (final m in models) {
        final id = (m is int) ? m : m.id;
        final mToDel = await modelById(id);
        if (mToDel != null&&mToDel.members!=null) {
          usersWillDelete.addAll(mToDel.members!);
          final del = delete(chatBoxEntities)..where((e) => e.id.equals(id));
          await del.go();
          await _chatBoxMemberDao.deleteEntitiesForChatBox(id);
          await _snapDao.deleteModelsForChatBox(id);
        }
      }

      List<CommonUser> usersToDelete = [];
      for (final u in usersWillDelete) {
        if (await canDeleteChatBoxMember(u.uid!)) {
          usersToDelete.add(u);
        }
      }
      await _userDao.deleteModels(usersToDelete);
    });
  }

  Future<bool> updateModelLastReadSnapTime(int id, int time) async {
    return transaction(() async {
      final e = await _entityById(id);
      if (e != null && e.lastReadSnapTime < time) {
        final updateSql = update(chatBoxEntities)..where((e) => e.id.equals(id));
        await updateSql.write(ChatBoxEntitiesCompanion(lastReadSnapTime: Value(time)));
        return true;
      }
      return false;
    });

//    return transaction(() async {
//      final e = await _entityById(id);
//      if (e != null && e.lastReadSnapTime < time) {
//        final j = e.toJson();
//        j['lastReadSnapTime'] = time;
//        final s = ChatBoxEntity.fromJson(j);
//        await update(chatBoxEntities).replace(s);
//      }
//    });
  }

  /// dynamic is int or ChatBox.
  Future updateModelsHasChat(List<dynamic>? models) async {
    if (models == null || models.isEmpty) return;
    List<int> ids;
    if (models.first is int) {
      ids = models.cast<int>();
    } else {
      ids = models.map((e) => e.id).toList().cast<int>();
    }
    return transaction(() async {
      final updateSql = update(chatBoxEntities)..where((e) => e.id.isIn(ids) & e.hasChat.equals(false));
      await updateSql.write(ChatBoxEntitiesCompanion(hasChat: Value(true)));
    });

//    return transaction(() async {
//      for (final m in models) {
//        final id = (m is int) ? m : m.id;
//        final e = await _entityById(id);
//        if (!e.hasChat) {
//          final j = e.toJson();
//          j['hasChat'] = true;
//          final s = ChatBoxEntity.fromJson(j);
//          await update(chatBoxEntities).replace(s);
//        }
//      }
//    });
  }

  Future updateModelHasChatAndWeight(int id, bool hasChat, int weight) async {
    return transaction(() async {
      final e = await _entityById(id);
      if (e == null || (!hasChat && e.weight >= weight)) return;
      final updateSql = update(chatBoxEntities)..where((e) => e.id.equals(id));
      await updateSql.write(ChatBoxEntitiesCompanion(
        hasChat: hasChat ? Value(true) : Value.absent(),
        weight: e.weight < weight ? Value(weight) : Value.absent(),
      ));
    });

//    return transaction(() async {
//      final e = await _entityById(id);
//      if (e != null) {
//        bool changed = false;
//        final j = e.toJson();
//        if (!e.hasChat && hasChat) {
//          j['hasChat'] = true;
//          changed = true;
//        }
//        if (e.weight < weight) {
//          j['weight'] = weight;
//          changed = true;
//        }
//        if (changed) {
//          final s = ChatBoxEntity.fromJson(j);
//          await update(chatBoxEntities).replace(s);
//        }
//      }
//    });
  }

  ChatBox? _modelFromEntity(ChatBoxEntity? e) {
    if (e == null) return null;
    return ChatBox()
      ..id = e.id
      ..type = e.type
      ..name = e.name
      ..coverURL = e.coverURL
      ..owner = e.owner
      ..qrCodeURL = e.qrCodeURL
      ..weight = e.weight
      ..muted = e.muted
      ..unreadCount = e.unreadCount
      ..updateTime = e.updateTime
      ..additionalInfo = e.additionalInfo
      ..desc = e.desc
      ..serviceChat = e.serviceChat
      ..hasChat = e.hasChat
      ..lastReadSnapTime = e.lastReadSnapTime
      ..clearCacheTime = e.clearCacheTime;
  }

  ChatBoxEntitiesCompanion? _modelToEntityCompanion(ChatBox? m, [ChatBox? e]) {
    if (m == null) return null;
    if (e != null) {
      if (m.lastReadSnapTime == null ||
          (e.lastReadSnapTime != null &&
              m.lastReadSnapTime! < (e.lastReadSnapTime??0))) {
        m.lastReadSnapTime = e.lastReadSnapTime;
      }
      if (m.clearCacheTime == null ||
          (e.clearCacheTime != null && m.clearCacheTime! < (e.clearCacheTime??0))) {
        m.clearCacheTime = e.clearCacheTime;
      }
      if (e.serviceChat != null && (e.serviceChat??false)) {
        m.serviceChat = e.serviceChat;
      }

    }
    return ChatBoxEntitiesCompanion(
      id: m.id != null ? Value(m.id!) : Value.absent(),
      type: m.type != null ? Value(m.type!) : Value.absent(),
      name: m.name != null ? Value(m.name) : Value.absent(),
      coverURL: m.coverURL != null ? Value(m.coverURL) : Value.absent(),
      owner: m.owner != null ? Value(m.owner!) : Value.absent(),
      qrCodeURL: m.qrCodeURL != null ? Value(m.qrCodeURL) : Value.absent(),
      weight: m.weight != null ? Value(m.weight!) : Value.absent(),
      muted: m.muted != null ? Value(m.muted!) : Value.absent(),
      unreadCount: m.unreadCount != null ? Value(m.unreadCount!) : Value.absent(),
      updateTime: m.updateTime != null ? Value(m.updateTime!) : Value.absent(),
      additionalInfo: m.additionalInfo != null ? Value(m.additionalInfo) : Value.absent(),
      desc: m.desc != null ? Value(m.desc) : Value.absent(),
      serviceChat: m.serviceChat != null ? Value(m.serviceChat!) : Value.absent(),
      hasChat: m.hasChat != null ? Value(m.hasChat!) : Value.absent(),
      lastReadSnapTime: m.lastReadSnapTime != null ? Value(m.lastReadSnapTime!) : Value.absent(),
      clearCacheTime: m.clearCacheTime != null ? Value(m.clearCacheTime!) : Value.absent(),
    );
  }
}
