
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';

class ChatDateItem {
  final int milliSeconds;

  ChatDateItem(this.milliSeconds);

  String get showText => ChatUtils.formatMessageTime(milliSeconds);
}