

import 'package:wenan/data/user/CommonUser.dart';


enum DiscoverEventType {
  remove,
  changed
}
class DiscoverEvent {
  final CommonUser? user;
  final DiscoverEventType type;
  DiscoverEvent(this.type,this.user);
}