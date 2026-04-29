enum ChatListOtherItemType {
  order,
  notify,
  activity,
}

class ChatListOtherItem {
  ChatListOtherItemType type;
  String icon;
  int count;
  int? time;
  String name;
  String? content;

  ChatListOtherItem(this.type,this.icon,this.name,{this.content,this.count =0,this.time});

  @override
  int get hashCode => this.type.index;

  @override
  bool operator ==(other) {
    if (identical(this, other)) return true;
    return other is ChatListOtherItem && this.type == other.type;
  }
}
