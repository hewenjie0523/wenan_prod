import 'package:wenan/utils/WenanCodelog.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {
  final int _version;
  final String _name;
  final int _mainUserId;

  Database? _database;

  DBManager(this._version, this._name, this._mainUserId);

  Future<void> init() async {
    var databasesPath = await getDatabasesPath();

    String path = join(databasesPath, _mainUserId.toString(), _name);
    AuvChatLog.d("databasesPath:$path",tag: "DBManager");

    _database = await openDatabase(path, version: _version);
  }

  Future<bool?> isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _database!.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res.isNotEmpty;
  }

  Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await init();
    }
    return _database!;
  }

  Future<void> close() async {
    await _database?.close();
    _database = null;
  }
}
