
import 'package:wenan/utils/wenan_lru_map.dart';
import 'package:wenan/utils/wenan_user_online_status_enum.dart';


/// 主播在线状态更新
class AuvUserOnlineStatusUpdateEvent {
  late int uid;
  late WenanUserOnlineStatusEnum status;

  AuvUserOnlineStatusUpdateEvent(this.uid, this.status);
}

/// 用户状态, 0: 离线， 1：在线， 2：忙线

///用户在线状态管理，包含了一个LruMap, 存储最近访问过的用户的在线状态
class WenanUserOnlineStatusManager {
  ///存储最多500个主播的实时状态
  final WenanLruMap<int, WenanUserOnlineStatusEnum> _lruMap = WenanLruMap(500);

  static final WenanUserOnlineStatusManager _instance = WenanUserOnlineStatusManager._();

  ///单例
  factory WenanUserOnlineStatusManager() {
    return _instance;
  }

  WenanUserOnlineStatusManager._();


  ///获取用户状态
  WenanUserOnlineStatusEnum? getStatus(int uid) {
   return _lruMap.get(uid);
  }

  ///保存用户状态
  ///服务端返回的所有报文中， 如果包含了用户状态，那么存储到这里，确保前台显示都能够获得最新的用户状态
  ///原有的基于主动刷新的逻辑，在页面停留时，只能依靠定时刷新策略，并且

  WenanUserOnlineStatusEnum save(int uid, WenanUserOnlineStatusEnum status) {
    WenanUserOnlineStatusEnum? prev = _lruMap.get(uid);
    if (prev == null) {
      saveStatus(uid, status);
      return status;
    } else {
      prev = status;
      saveStatus(uid, prev);
      return prev;
    }
  }

  void saveStatus(int uid, WenanUserOnlineStatusEnum status) {
    _lruMap.put(uid, status);
  }
}
