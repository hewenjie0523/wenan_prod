enum ChatListOtherItemType {
  // order,
  notify,
  // activity,
  feedback
}

class ChatListOtherItem {
  ChatListOtherItemType type = ChatListOtherItemType.notify;
  String? icon;
  String? name;
  String? content;
  int? count;
  int? time;

  @override
  int get hashCode => type.index;

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is ChatListOtherItem && type == other.type;
  }
}
