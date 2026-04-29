
import 'package:wenan/utils/WenanCodeutils.dart';

class OverdueSession {
  final String? message;

  OverdueSession(this.message);
}

class KeyBoardEvent {
  bool get isShow=>_height!=null&&_height!>0;

  int get height=>_height??0;

  final int? _height;

  KeyBoardEvent(this._height);
}

class PushOpenEvent{
  final String url;
  String? chatBoxId;

  PushOpenEvent(this.url,this.chatBoxId);
}

class FollowEvent{
  final int uid;
  FollowEvent(this.uid);
}
