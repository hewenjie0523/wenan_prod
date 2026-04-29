import 'dart:convert';
import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/db/database/ChatDB.dart';
import 'package:wenan/db/entity/WenanCodeSnapEntities.dart';
import 'package:wenan/utils/WenanCodelog.dart';


part 'SnapDao.g.dart';

@DriftAccessor(
  tables: [SnapEntities],
)
class SnapDao extends DatabaseAccessor<ChatDB> with _$SnapDaoMixin {
  SnapDao(ChatDB db, this.mainUserId) : super(db);

  final int mainUserId;

  static const String _lastSyncStoreKey = 'snap_lastSyncKey';

  int get lastSyncKey => SpHelper.getCurrUserInt(_lastSyncStoreKey, defaultValue: 0)!;

  set lastSyncKey(int key) => SpHelper.putCurrUserInt(_lastSyncStoreKey, key);

  Future<SnapEntity?> _entityById(int? id) async {
    if (id == null || id == 0) return null;
    final query = select(snapEntities)..where((e) => e.id.equals(id));
    return query.getSingleOrNull();
  }

  Future<SnapEntity?> _entityByLocalId(int? id) async {
    if (id == null || id == 0) return null;
    final query = select(snapEntities)..where((e) => e.localId.equals(id) & e.owner.equals(mainUserId));
    return query.getSingleOrNull();
  }

  Future<ChatSnap?> _modelByEntity(SnapEntity? e) async {
    if (e == null) return null;
    Future future = Future.value(Void);
    bool isRepliedIdValid = e.repliedSnapId != null && e.repliedSnapId > 0;
    if (isRepliedIdValid) {
      future = future.then((value) => _entityById(e.repliedSnapId));
    }
    return future.then((value) {
      final m = _modelFromEntity(e);
      if (isRepliedIdValid) m?.repliedSnap = _modelFromEntity(value);
      return m;
    });

    // final m = _modelFromEntity(e);
    // if (m.isRepliedIdValid) {
    //   m.repliedSnap = _modelFromEntity(await _entityById(m.repliedSnapId));
    // }
    // return m;
  }

  Future<ChatSnap?> modelById(int? id) async {
    if (id == null || id == 0) return null;
    return _entityById(id).then((e) => _modelByEntity(e));
  }

  Future<List<ChatSnap>?> modelsByEntities(List<SnapEntity>? es) async {
    if (es == null || es.isEmpty) return null;
    List<ChatSnap> ms = [];
    for (final e in es) {
      final m = await _modelByEntity(e);
      if (m != null) ms.add(m);
    }
    return ms;
  }

  Future<List<ChatSnap>?> allSearchableChatSnapForChatBox(int? cid) async {
    if (cid == null) return null;

    final query = select(snapEntities)
      ..where((e) => e.cid.equals(cid))
      ..orderBy([
            (e) =>
            OrderingTerm(expression: e.createTime, mode: OrderingMode.asc),
      ]);
    return modelsByEntities(await query.get());
  }

  Future<List<ChatSnap>?> allSearchableModelsForChatBox(int? cid) async {
    if (cid == null) return null;

    final query = select(snapEntities)
      ..where((e) => e.cid.equals(cid) & e.type.equals(1))
      ..orderBy([
        (e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.asc),
      ]);
    return modelsByEntities(await query.get());

    /// TODO: 内联查询 ？
//    final snaps = alias(snapEntities, 'snap');
//    final repliedSnaps = alias(snapEntities, 'replied');
//
//    final query = select(snaps)
//      .join([
//        innerJoin(
//          repliedSnaps,
//          repliedSnaps.id.equalsExp(snaps.repliedSnapId),
//        ),
//      ]);
//      query..where((e) => e.cid.equals(cid) & e.type.equals(1))
//      ..orderBy([
//        (e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.asc),
//      ]);
//    final results = await query.get();
//    return results.map((row) {
//      final entry = row.readTable(snaps);
//      final category = row.readTable(categories);
//      return EntryWithCategory(entry, category);
//     }).toList();
  }

  Future<int> countOfModelsForChatBox(int? cid, [int? fromTime, int? toTime]) async {
    if (cid == null) return 0;
//    final data = await customSelect(
//      'SELECT COUNT(*) FROM snap_entities WHERE cid = ?',
//      variables: [Variable(cid)],
//      readsFrom: {snapEntities},
//    ).get();
//    return data.length;

    final query = select(snapEntities)
      ..where((e) {
        Expression<bool> ret = e.cid.equals(cid);
        if (fromTime != null) {
          ret = ret & e.createTime.isBiggerOrEqualValue(fromTime);
        }
        if (toTime != null) {
          ret = ret & e.createTime.isSmallerThanValue(toTime);
        }
        return ret;
      });
    final result = await query.get();
    return result.length;
  }

  Future<int> countOfNewModelsForChatBox(int? cid, int? fromTime) async {
    if (cid == null) return 0;
    fromTime ??= 0;

    final query = select(snapEntities)
      ..where((e) => e.cid.equals(cid) & e.owner.equals(mainUserId).not() & e.createTime.isBiggerThanValue(fromTime??0));
    final result = await query.get();
    return result.length;
  }

  Future<ChatSnap?> firstModelForChatBox(int? cid, int? fromTime) async {
    if (cid == null) return null;
    fromTime ??= 0;

    final query = select(snapEntities)
      ..where((e) => e.cid.equals(cid) & e.owner.equals(mainUserId).not() & e.createTime.isBiggerThanValue(fromTime??0))
      ..orderBy([(e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.asc)])
      ..limit(1);
    final result = await query.get();
    return result.isEmpty ? null : _modelByEntity(result.first);
  }

  Future<ChatSnap?> lastModelForChatBox(int? cid) async {
    if (cid == null) return null;

    final query = select(snapEntities)
      ..where((e) => e.cid.equals(cid))
      ..orderBy([(e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.desc)])
      ..limit(1);
    final result = await query.get();
    return  result.isEmpty ? null : _modelByEntity(result.first);
  }

  Future<List<ChatSnap>?> modelsByTimeDescForChatBox(int? cid, [int page = 1, int size = 20]) async {
    assert(page > 0);
    AuvChatLog.d("modelsByTimeDescForChatBox cid=$cid,size=$size",tag: "SnapDao");
    if (cid == null || size <= 0) return null;

    final query = select(snapEntities)
      ..where((e) => e.cid.equals(cid))
      ..orderBy([(e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.desc)])
      ..limit(size, offset: (page - 1) * size);
    var result = await query.get();
    // AuvChatLog.d("modelsByTimeDescForChatBox result=$result",tag: "SnapDao");
    return modelsByEntities(result.reversed.toList());
  }

  /// time <= toTime
  Future<List<ChatSnap>?> modelsByToTimeForChatBox(int? cid, int? toTime, [int size = 20]) async {
    if (cid == null || toTime == null || toTime <= 0 || size <= 0) return null;

    final query = select(snapEntities)
      ..where((e) => e.cid.equals(cid) & e.createTime.isSmallerOrEqualValue(toTime))
      ..orderBy([(e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.desc)])
      ..limit(size);
    return modelsByEntities((await query.get()).reversed.toList());
  }

  /// time >= fromTime && time < toTime，当 toTime 指定时，size 无用
  Future<List<ChatSnap>?> modelsByTimeForChatBox(int? cid, [int? fromTime, int? toTime, int size = 20]) async {
    if (cid == null || size <= 0) return null;
    if (fromTime == null || fromTime < 0) fromTime = 0;
    final query = select(snapEntities)
      ..where((e) {
        if (toTime == null) {
          return e.cid.equals(cid) & e.createTime.isBiggerOrEqualValue(fromTime??0);
        } else {
          return e.cid.equals(cid) &
              e.createTime.isBiggerOrEqualValue(fromTime??0) &
              e.createTime.isSmallerThanValue(toTime);
        }
      })
      ..orderBy([(e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.asc)]);
    if (toTime == null) query.limit(size);
    return modelsByEntities(await query.get());
  }

  /// time < time
  Future<List<ChatSnap>?> modelsByTypeBeforeTimeForChatBox(int? cid, int? type, int? time, [int size = 20]) async {
    if (cid == null || size <= 0) return null;
    final query = select(snapEntities)
      ..where((e) {
        var ret = e.cid.equals(cid) & e.type.equals(type?? 0);
        if (time != null) ret = ret & e.createTime.isSmallerThanValue(time);
        return ret;
      })
      ..orderBy([(e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.desc)])
      ..limit(size);
    return modelsByEntities((await query.get()).reversed.toList());
  }

  /// time > time
  Future<List<ChatSnap>?> modelsByTypeAfterTimeForChatBox(int? cid, int? type, int? time, [int size = 20]) async {
    if (cid == null || size <= 0) return null;
    final query = select(snapEntities)
      ..where((e) {
        var ret = e.cid.equals(cid) & e.type.equals(type??0);
        if (time != null) ret = ret & e.createTime.isBiggerThanValue(time);
        return ret;
      })
      ..orderBy([(e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.asc)])
      ..limit(size);
    return modelsByEntities(await query.get());
  }

  Future<List<ChatSnap>?> sendingOrFailedSnapsForChatBox(int? cid) async {
    if (cid == null) return null;

//    final query = await customSelect(
//      'SELECT * FROM snap_entities WHERE cid = ? AND (send_status = ? OR send_status = ?) ORDER BY create_time ASC',
//      variables: [Variable(cid), Variable(ChatSnapSendStatus.sending.index), Variable(ChatSnapSendStatus.failed),],
//      readsFrom: {snapEntities},
//    );
//    final rows = await query.get();
//    final entities = rows.map((e) => SnapEntity.fromData(e.data, this.db)).toList();
//  return modelsByEntities(entities);

    final query = select(snapEntities)
      ..where((e) =>
          e.cid.equals(cid) &
          (e.sendStatus.equals(ChatSnapSendStatus.sending.index) |
              e.sendStatus.equals(ChatSnapSendStatus.failed.index)))
      ..orderBy([(e) => OrderingTerm(expression: e.createTime, mode: OrderingMode.asc)]);
    return modelsByEntities(await query.get());
  }

  Future saveOrUpdateModels(List<ChatSnap>? models) async {
    if (models == null || models.isEmpty) return;
    return transaction(() async {
      for (final m in models) {
        SnapEntity? e;
        if (m.isIdValid) {
          e = await _entityById(m.id);
        }
        if (e == null && m.isLocalIdValid) {
          e = await _entityByLocalId(m.localId);
        }
        if (e == null) {
          var toSave = _modelToEntityCompanion(m);
          if(toSave!=null){
            await into(snapEntities).insert(toSave);
          }

        } else {
          var toSave = _modelToEntityCompanion(m, e);
          if(toSave!=null){
            await update(snapEntities).replace(toSave);
          }

        }
      }
    });
  }

  /// dynamic is int or ChatSnap
  Future deleteModels(List<dynamic>? models) async {
    if (models == null || models.isEmpty) return;

    return transaction(() async {
      for (final m in models) {
        final id = (m is int) ? m : (m.isIdValid() ? m.id : null);
        final del = delete(snapEntities);
        if (id != null) {
          del.where((e) => e.id.equals(id));
        } else if (m.isLocalIdValid()) {
          del.where((e) => e.localId.equals(m.localId) & e.owner.equals(mainUserId));
        }
        await del.go();
      }
    });
  }

  Future deleteModel(dynamic model) async {
    if (model == null) return;
    return deleteModels([model]);
  }

  Future deleteModelsForChatBox(int? cid) async {
    if (cid == null) return;
    return transaction(() async {
      final del = delete(snapEntities)..where((e) => e.cid.equals(cid));
      await del.go();
    });
  }

  ChatSnap? _modelFromEntity(SnapEntity? e) {
    if (e == null) return null;
    return ChatSnap()
      ..id = e.id
      ..chatBoxId = e.cid
      ..owner = e.owner
      ..ownerName = e.ownerName
      ..ownerHead = e.ownerHead
      ..unread = e.unread
      ..createTime = e.createTime
      ..prevSnapId = e.prevSnapId
      ..type = e.type
      ..textContent = e.textContent
      ..image = e.image
      ..video = e.video
      ..voice = e.voice
      ..images = e.images
      ..jsonContent = e.jsonContent
      ..localId = e.localId
      ..extensions = e.extensions == null ? null : jsonDecode(e.extensions!)
      ..redPacketId = e.redPacketId
      ..repliedSnapId = e.repliedSnapId
      ..status = e.status
      ..sendStatus = e.sendStatus
      ..redPacketStatus = e.redPacketStatus
      ..redPacketType = e.redPacketType
      ..redPacketAmount = e.redPacketAmount
      ..redPacketTotalCount = e.redPacketTotalCount
      ..redPacketMessage = e.redPacketMessage;
  }

  SnapEntitiesCompanion? _modelToEntityCompanion(ChatSnap? m, [SnapEntity? e]) {
    if (m == null) return null;
    int? pk;
    if (e != null) {
      pk = e.pk;
      if (m.image != null && e.image?.relativePath != null) {
        m.image!.relativePath = e.image?.relativePath;
      }
      if (m.video != null && e.video?.relativePath != null) {
        m.video!.relativePath = e.video?.relativePath;
      }
      if (m.voice != null && e.voice?.relativePath != null) {
        m.voice!.relativePath = e.voice?.relativePath;
      }
      if (e.images != null && m.images != null) {
        m.images!.forEach((img) {
          final index = e.images?.indexOf(img);
          if (index == -1||index==null) return;
          final eImg = e.images![index];
          if (eImg.relativePath != null) {
            img.relativePath = eImg.relativePath;
          }
        });
      }
    }
    return SnapEntitiesCompanion(
      pk: pk != null ? Value(pk) : Value.absent(),
      id: m.id != null ? Value(m.id!) : Value.absent(),
      cid: m.chatBoxId != null ? Value(m.chatBoxId!) : Value.absent(),
      owner: m.owner != null ? Value(m.owner) : Value.absent(),
      ownerName: m.ownerName != null ? Value(m.ownerName) : Value.absent(),
      ownerHead: m.ownerHead != null ? Value(m.ownerHead) : Value.absent(),
      unread: m.unread != null ? Value(m.unread!) : Value.absent(),
      createTime: m.createTime != null ? Value(m.createTime!) : Value.absent(),
      prevSnapId: m.prevSnapId != null ? Value(m.prevSnapId!) : Value.absent(),
      type: m.type != null ? Value(m.type!) : Value.absent(),
      textContent: m.textContent != null ? Value(m.textContent) : Value.absent(),
      image: m.image != null ? Value(m.image) : Value.absent(),
      video: m.video != null ? Value(m.video) : Value.absent(),
      voice: m.voice != null ? Value(m.voice) : Value.absent(),
      images: m.images != null ? Value(m.images) : Value.absent(),
      jsonContent: m.jsonContent != null ? Value(m.jsonContent) : Value.absent(),
      localId: m.localId != null ? Value(m.localId!) : Value.absent(),
      extensions: m.extensions != null ? Value(jsonEncode(m.extensions)) : Value.absent(),
      redPacketId: m.redPacketId != null ? Value(m.redPacketId!) : Value.absent(),
      repliedSnapId: m.repliedSnapId != null ? Value(m.repliedSnapId!) : Value.absent(),
      status: m.status != null ? Value(m.status!) : Value.absent(),
      sendStatus: m.sendStatus != null ? Value(m.sendStatus!) : Value.absent(),
      redPacketStatus: m.redPacketStatus != null ? Value(m.redPacketStatus!) : Value.absent(),
      redPacketType: m.redPacketType != null ? Value(m.redPacketType!) : Value.absent(),
      redPacketAmount: m.redPacketAmount != null ? Value(m.redPacketAmount!) : Value.absent(),
      redPacketTotalCount: m.redPacketTotalCount != null ? Value(m.redPacketTotalCount!) : Value.absent(),
      redPacketMessage: m.redPacketMessage != null ? Value(m.redPacketMessage) : Value.absent(),
    );
  }
}
