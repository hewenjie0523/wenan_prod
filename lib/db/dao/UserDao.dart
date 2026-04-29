
import 'package:drift/drift.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/db/database/ChatDB.dart';
import 'package:wenan/db/entity/WenanCodeUserEntities.dart';

part 'UserDao.g.dart';

@DriftAccessor(
  tables: [UserEntities],
)
class UserDao extends DatabaseAccessor<ChatDB> with _$UserDaoMixin {
  UserDao(ChatDB db) : super(db);

  static const String _lastSyncStoreKey = 'buddy_lastSyncKey';

  int get lastSyncKey => SpHelper.getCurrUserInt(_lastSyncStoreKey) ?? 0;

  set lastSyncKey(int key) => SpHelper.putCurrUserInt(_lastSyncStoreKey, key);

  Future<UserEntity?> _entityById(int? id) async {
    if (id == null || id == 0) return null;
    final query = select(userEntities)..where((e) => e.uid.equals(id));
    return query.getSingleOrNull();
  }

  Future<CommonUser?> modelById(int? id) async {
    return _modelFromEntity(await _entityById(id));
  }

  Future<List<CommonUser?>> allModels() async {
    final result = await select(userEntities).get();
    return result.map((e) => _modelFromEntity(e)).toList();
  }

  Future<List<CommonUser>> modelsByIds(List<int> ids) async {
    return transaction(() async {
      List<CommonUser> models = [];
      for (final id in ids) {
        final m = await modelById(id);
        if (m != null) models.add(m);
      }
      return models;
    });
  }

  Future saveOrUpdateModels(List<CommonUser>? models) async {
    if (models == null || models.isEmpty) return;
    return transaction(() async {
      for (final m in models) {
        final e = _modelToEntityCompanion(m);
        if (e != null) {
          if ((await _entityById(m.uid)) != null) {
            await update(userEntities).replace(e);
          } else {
            await into(userEntities).insert(e);
          }
        }
      }
    });
  }

  /// dynamic is int or CommonUser
  Future deleteModels(List<dynamic>? models) async {
    if (models == null || models.isEmpty) return;
    return transaction(() async {
      for (final m in models.toSet()) {
        final uid = (m is int) ? m : m.uid;
        final del = delete(userEntities)..where((entity) => entity.uid.equals(uid));
        await del.go();
      }
    });
  }

  CommonUser? _modelFromEntity(UserEntity? e) {
    if (e == null) return null;
    return CommonUser()
      ..uid = e.uid
      ..ucode = e.ucode
      ..nick_name = e.nick_name
      ..avatar_url = e.avatar_url
      ..birthday = e.birthday
      ..gender = e.gender
      ..mobile = e.mobile
      ..status = e.status
      ..extend?.profile?.area = e.area
      ..constellation = e.constellation
      ..cover_url = e.cover_url
      ..signature = e.signature
      ..extend?.display_name = e.display_name
      ..extend?.profile?.follow = e.follow
      ..extend?.profile?.black = e.black
      ..extend?.profile?.black_me = e.black_me;
  }

  UserEntity? _modelToEntity(CommonUser? m) {
    if (m == null||m.uid==null) return null;
    return UserEntity(
      uid: m.uid!,
      ucode: m.ucode,
      nick_name: m.nick_name,
      avatar_url: m.avatar_url,
      birthday: m.birthday,
      gender: m.gender??0,
      mobile: m.mobile,
      status: m.status??0,
      area: m.extend?.profile?.area,
      constellation: m.constellation,
      cover_url: m.cover_url,
      signature: m.signature,
      display_name: m.extend?.display_name,
      follow: m.extend?.profile?.follow??0,
      black: m.extend?.profile?.black??0,
      black_me: m.extend?.profile?.black_me??0,
    );
  }

  UserEntitiesCompanion? _modelToEntityCompanion(CommonUser? m) {
    if (m == null) return null;
    return UserEntitiesCompanion(
      uid: m.uid != null ? Value(m.uid!) : const Value.absent(),
      ucode: m.ucode != null ? Value(m.ucode) : Value.absent(),
      nick_name: m.nick_name != null ? Value(m.nick_name) : Value.absent(),
      avatar_url: m.avatar_url != null ? Value(m.avatar_url) : Value.absent(),
      birthday: m.birthday != null ? Value(m.birthday) : Value.absent(),
      gender: m.gender != null ? Value(m.gender!) : Value.absent(),
      mobile: m.mobile != null ? Value(m.mobile!) : Value.absent(),
      status: m.status != null ? Value(m.status!) : Value.absent(),
      area: m.extend?.profile?.area != null ? Value(m.extend!.profile!.area!) : Value.absent(),
      constellation: m.constellation != null ? Value(m.constellation) : Value.absent(),
      cover_url: m.cover_url != null ? Value(m.cover_url) : Value.absent(),
      signature: m.signature != null ? Value(m.signature) : Value.absent(),
      display_name: m.extend?.display_name != null ? Value(m.extend!.display_name) : Value.absent(),
      follow: m.extend?.profile?.follow != null ? Value(m.extend!.profile!.follow!) : Value.absent(),
      black: m.extend?.profile?.black != null ? Value(m.extend!.profile!.black!) : Value.absent(),
      black_me: m.extend?.profile?.black_me != null ? Value(m.extend!.profile!.black_me!) : Value.absent(),
    );
  }
}
