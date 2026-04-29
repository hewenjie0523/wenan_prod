

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/utils/WenanCodelog.dart';

import 'dao/ChatBoxDao.dart';
import 'dao/ChatBoxMemberDao.dart';
import 'dao/SnapDao.dart';
import 'dao/UserDao.dart';
import 'database/ChatDB.dart';

class ChatDBService {
  late ChatDB _chatDB;

  late UserDao _userDao;

  UserDao get userDao => _userDao;

  late SnapDao _snapDao;

  SnapDao get snapDao => _snapDao;

  late ChatBoxMemberDao _chatBoxMemberDao;

  late ChatBoxDao _chatBoxDao;

  ChatBoxDao get chatBoxDao => _chatBoxDao;

  Future<void> init() async {
    _chatDB = ChatDB.database();

    _userDao = UserDao(_chatDB);
    _snapDao = SnapDao(_chatDB, Application.currUserId());
    _chatBoxMemberDao = ChatBoxMemberDao(_chatDB);
    _chatBoxDao = ChatBoxDao(_chatDB, _snapDao, _userDao, _chatBoxMemberDao);
  }

  Future<void> dispose() async {
    try {
      await _chatDB.close();
    } catch (e,stack) {
      AuvChatLog.printE(e,error:stack);
    }
  }
}
