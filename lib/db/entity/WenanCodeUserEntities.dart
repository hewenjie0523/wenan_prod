
import 'package:drift/drift.dart';

@DataClassName('UserEntity')
class UserEntities extends Table {
  IntColumn get uid => integer()();

  TextColumn get nick_name => text().nullable()();

  TextColumn get avatar_url => text().nullable()();

  //用户状态 ： 0，未完善信息；1，默认状态；2，封禁状态
  IntColumn get status => integer().withDefault(const Constant(1))();

  TextColumn get ucode => text().nullable()();

  TextColumn get birthday => text().nullable()();

  //性别 男为1，女为2，0为未知
  IntColumn get gender => integer().withDefault(const Constant(0))();

  TextColumn get constellation => text().nullable()();

  TextColumn get mobile => text().nullable()();

  TextColumn get cover_url => text().nullable()();

  TextColumn get signature => text().nullable()();

  TextColumn get area => text().nullable()();

  TextColumn get display_name => text().nullable()();

  // TextColumn get namePinyin => text().nullable()();
  //
  // TextColumn get nameFirstLetters => text().nullable()();
  //
  // TextColumn get showNamePinyin => text().nullable()();
  //
  // TextColumn get showNameFirstLetters => text().nullable()();

  IntColumn get follow => integer().withDefault(const Constant(0))();

  IntColumn get black => integer().withDefault(const Constant(0))();

  IntColumn get black_me => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {uid};
}
