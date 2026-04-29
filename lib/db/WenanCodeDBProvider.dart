import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

import 'WenanCodeDBManager.dart';

abstract class DBProvider {
  bool isTableExits = false;

  final DBManager dbManager;

  DBProvider(this.dbManager)
      : assert(dbManager != null, "dbManager should have value!");

  Future<Database> getDataBase() async {
    return await open();
  }

  @mustCallSuper
  Future<void> prepare(String name, String createSql) async {
    isTableExits = await dbManager.isTableExits(name)??false;
    if (!isTableExits) {
      Database db = await dbManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  @mustCallSuper
  Future<Database> open() async {
    if (!isTableExits) {
      await prepare(tableName(), createTableString());
    }
    return await dbManager.getCurrentDatabase();
  }

  String tableName();

  String createTableString();

  String tableBaseString(
    String tableName, {
    String autoIncrementPrimaryKey = 'pk',
  }) {
    return '''
      CREATE TABLE IF NOT EXISTS $tableName (
      $autoIncrementPrimaryKey INTEGER PRIMARY KEY AUTOINCREMENT,
     ''';
  }

  Map<String, dynamic> daoFromModel(Object model);

  Object? modelFromDao(Map<String, dynamic> dao);

  List modelsFromDaos(List<Map<String, dynamic>>? daos) {
    List models =[];
    if (daos != null && daos.isNotEmpty) {
      daos.map((e) {
        final object = modelFromDao(e);
        if (object != null) daos.add(object as Map<String, dynamic>);
      });
    }
    return models;
  }
}
