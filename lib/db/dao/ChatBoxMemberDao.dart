

import 'package:drift/drift.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/db/database/ChatDB.dart';
import 'package:wenan/db/entity/WenanCodeChatBoxMemberEntities.dart';

part 'ChatBoxMemberDao.g.dart';

@DriftAccessor(
  tables: [ChatBoxMemberEntities],
)
class ChatBoxMemberDao extends DatabaseAccessor<ChatDB> with _$ChatBoxMemberDaoMixin {
  ChatBoxMemberDao(ChatDB db) : super(db);

  Future<bool> hasMemberChatBox(int uid) async {
    final query = select(chatBoxMemberEntities)..where((e) => e.uid.equals(uid));
    final ret = await query.get();
    return ret.isNotEmpty;
  }

  Future<ChatBoxMemberEntity?> getMemberChatBoxByUid(int uid) async {
    final query = select(chatBoxMemberEntities)..where((e) => e.uid.equals(uid));
    final ret = await query.get();
    if(ret.isEmpty){
      return null;
    }
    return ret.first;
  }

  Future<List<ChatBoxMemberEntity>> entitiesForChatBox(int cid) async {
    final query = select(chatBoxMemberEntities)..where((e) => e.cid.equals(cid));
    return await query.get();
  }

  Future saveEntitiesForChatBox(int cid, List<CommonUser> members) async {
    if (members.isEmpty) return;
    return transaction(() async {
      for (final m in members) {
        final query = select(chatBoxMemberEntities)..where((e) => e.cid.equals(cid) & e.uid.equals(m.uid??0));
        final result = await query.get();
        if (result.isEmpty&&m.uid!=null) {
          // final e = ChatBoxMemberEntity(pk:result[0].pk,cid: cid, uid: m.uid!);
          final ec = ChatBoxMemberEntitiesCompanion(pk:const Value.absent(),cid: Value(cid),uid:Value(m.uid!));
          await into(chatBoxMemberEntities).insert(ec);
        }
      }
    });
  }

  Future deleteEntitiesForChatBox(int cid, [List<CommonUser>? members]) async {
    return transaction(() async {
      if (members == null || members.isEmpty) {
        final del = delete(chatBoxMemberEntities)..where((e) => e.cid.equals(cid));
        await del.go();
      } else {
        for (final m in members) {
          final query = select(chatBoxMemberEntities)..where((e) => e.cid.equals(cid) & e.uid.equals(m.uid??0));
          final result = await query.get();
          if (result.isNotEmpty&&m.uid!=null) {
            final e = ChatBoxMemberEntity(pk: result[0].pk,cid: cid, uid: m.uid!);
            await delete(chatBoxMemberEntities).delete(e);
          }
        }
      }
    });
  }
}
