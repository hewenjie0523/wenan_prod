import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/db/entity/WenanCodeChatBoxEntities.dart';
import 'package:wenan/db/entity/WenanCodeChatBoxMemberEntities.dart';
import 'package:wenan/db/entity/WenanCodeSnapEntities.dart';
import 'package:wenan/db/entity/WenanCodeUserEntities.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:path/path.dart' as Path;
import 'package:wenan/db/converter/WenanCodeDBConverters.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/data/AppVoice.dart';
import 'package:wenan/StringTranslate.dart';


part 'ChatDB.g.dart';

@DriftDatabase(tables: [UserEntities, SnapEntities,ChatBoxEntities,ChatBoxMemberEntities])
class ChatDB extends _$ChatDB {
  ChatDB._(QueryExecutor e) : super(e);

  factory ChatDB.database({bool logStatements = false}) {
    final executor = LazyDatabase(() async {
      final dbFile = File(Path.join(Application.userPath, 'soggy_const_db.dat'));
      AuvChatLog.d("dbFile:${dbFile.path}",tag: "ChatDB");
      return NativeDatabase(dbFile, logStatements: logStatements);
    });
    return ChatDB._(executor);
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) {
        return m.createAll();
      },
//      onUpgrade: (Migrator m, int from, int to) async {
//        if (from == 1) {
//          await m.addColumn(todos, todos.targetDate);
//        }
//      },
//      beforeOpen: (details) async {
//        if (details.wasCreated) {
//          // create default categories and entries
//          final workId = await into(categories)
//              .insert(const CategoriesCompanion(description: Value('Work')));
//
//          await into(todos).insert(TodosCompanion(
//            content: const Value('A first todo entry'),
//            targetDate: Value(DateTime.now()),
//          ));
//
//          await into(todos).insert(
//            TodosCompanion(
//              content: const Value('Rework persistence code'),
//              category: Value(workId),
//              targetDate: Value(
//                DateTime.now().add(const Duration(days: 4)),
//              ),
//            ),
//          );
//        }
//      },
    );
  }
}

//// This needs to be a top-level method because it's run on a background isolate
//DatabaseConnection _backgroundConnection() {
//  // construct the database. You can also wrap the VmDatabase in a "LazyDatabase" if you need to run
//  // work before the database opens.
//  final database = VmDatabase.memory();
//  return DatabaseConnection.fromExecutor(database);
//}
//
//Future<MoorIsolate> _createMoorIsolate() async {
//  // this method is called from the main isolate. Since we can't use
//  // getApplicationDocumentsDirectory on a background isolate, we calculate
//  // the database path in the foreground isolate and then inform the
//  // background isolate about the path.
//  final dbPath = Path.join(Application.userPath, 'flash.dat');
//  final receivePort = ReceivePort();
//  await Isolate.spawn(
//    _startBackground,
//    _IsolateStartRequest(receivePort.sendPort, dbPath),
//  );
//
//  // _startBackground will send the MoorIsolate to this ReceivePort
//  return (await receivePort.first as MoorIsolate);
//}
//
//void _startBackground(_IsolateStartRequest request) {
//  // this is the entry point from the background isolate! Let's create
//  // the database from the path we received
//  final executor = VmDatabase(File(request.targetPath));
//  // we're using MoorIsolate.inCurrent here as this method already runs on a
//  // background isolate. If we used MoorIsolate.spawn, a third isolate would be
//  // started which is not what we want!
//  final moorIsolate = MoorIsolate.inCurrent(
//        () => DatabaseConnection.fromExecutor(executor),
//  );
//  // inform the starting isolate about this, so that it can call .connect()
//  request.sendMoorIsolate.send(moorIsolate);
//}
//
//// used to bundle the SendPort and the target path, since isolate entry point
//// functions can only take one parameter.
//class _IsolateStartRequest {
//  final SendPort sendMoorIsolate;
//  final String targetPath;
//
//  _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);
//}
//
//void main() async {
//  // create a moor executor in a new background isolate. If you want to start the isolate yourself, you
//  // can also call MoorIsolate.inCurrent() from the background isolate
//  MoorIsolate isolate = await MoorIsolate.spawn(_backgroundConnection);
//
//  // we can now create a database connection that will use the isolate internally. This is NOT what's
//  // returned from _backgroundConnection, moor uses an internal proxy class for isolate communication.
//  DatabaseConnection connection = await isolate.connect();
//
//  final db = TodoDb.connect(connection);
//
//  // you can now use your database exactly like you regularly would, it transparently uses a
//  // background isolate internally
//}
