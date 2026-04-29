
import 'package:wenan/data/chat/WenanCodeChatDateItem.dart';
import 'package:wenan/data/chat/WenanCodeChatNewItem.dart';
import 'package:wenan/data/chat/ChatSnap.dart';

class ChatSnapSortGroup {
  static const int GROUP_MAX_CAPACITY = 10;
  static const int GROUP_INTERVAL_IN_MILLISECONDS = 60 * 5 * 1000;

  /// lastGroup using when ChatLoadDirection.backward
  static List<ChatSnapSortGroup>? sortSnaps(
    List<ChatSnap>? snaps, [
    ChatSnap? moreFirstSnap,
    ChatSnapSortGroup? lastGroup,
  ]) {
    if (snaps == null || snaps.isEmpty) return null;
    ChatSnapSortGroup? group = lastGroup;
    final ret = <ChatSnapSortGroup>[];
    for (final s in snaps) {
      if (s.isCallJsonSnap ||
          group == null ||
          group.isBeyondCapacity() ||
          group.isBeyondTimeInterval(s.createTime??0) ||
          (moreFirstSnap != null && s == moreFirstSnap)) {
        group = ChatSnapSortGroup(ChatDateItem(s.createTime??0), null);
        ret.add(group);
      }
      group.snaps.add(s);
    }
    return ret;
  }

  final ChatDateItem dateItem;
  final ChatNewItem? newItem;
  List<ChatSnap> snaps = [];

  ChatSnapSortGroup(this.dateItem, this.newItem);

  bool isEmpty() => snaps.isEmpty;

  bool isBeyondCapacity() => snaps.length >= GROUP_MAX_CAPACITY;

  bool isBeyondTimeInterval(int milliseconds) =>
      (dateItem.milliSeconds - milliseconds).abs() > GROUP_INTERVAL_IN_MILLISECONDS;
}
