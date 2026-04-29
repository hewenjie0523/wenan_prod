
import 'package:drift/drift.dart';

@DataClassName('ChatBoxMemberEntity')
class ChatBoxMemberEntities extends Table {
  IntColumn get pk => integer().autoIncrement()();

  IntColumn get cid => integer()();

  IntColumn get uid => integer()();
}
