enum ChatListOtherEventType {
  orderMessageChanged,
  notifyMessageChanged,
  activityMessageChanged,
  updateCompleted,
}

class ChatListOtherEvent {
  final ChatListOtherEventType type;

  ChatListOtherEvent(this.type);
}
