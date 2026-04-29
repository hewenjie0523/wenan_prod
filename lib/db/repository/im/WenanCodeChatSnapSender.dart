

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/db/repository/im/WenanCodeChatSnapCreator.dart';

class ChatSnapSender {

  static void sendJsonSnap(int chatBoxId, String jsonContent,{Function(bool sended)? sendCallback}) {
    final snap = ChatSnapCreator.createJsonSnap(chatBoxId, jsonContent);
    Application.chatContext.sendQueue.sendSnap(snap).then((value){
      sendCallback?.call(value);
    });
  }
}