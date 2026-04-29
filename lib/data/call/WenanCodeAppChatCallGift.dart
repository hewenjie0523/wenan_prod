
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/Gift.dart';
import 'package:wenan/data/user/CommonUser.dart';

/// 聊天礼物
class AppChatCallGift {
  int callId = 0;
  CommonUser? from = Application.commonUser;
  CommonUser? to = Application.commonUser;
  Gift gift = Gift();

  AppChatCallGift();
}