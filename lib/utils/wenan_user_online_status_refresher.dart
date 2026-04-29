import 'dart:async';

import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/wenan_user_online_status_enum.dart';
import 'package:wenan/utils/wenan_user_online_status_manager.dart';

import '../base/WenanCodeApplication.dart';
import '../base/router/WenanCodePageRouter.dart';
import '../data/user/CommonUserOnlineStatus.dart';
import '../http/socket/WenanCodeflash_api.dart';

///用户状态主动刷新器
///原文翰写的manager， 因增加服务端主动推送用户状态机制，故本类更名为Refresher
class WenanUserOnlineStatusRefresher {
  static WenanUserOnlineStatusRefresher get instance => _instance;
  static final WenanUserOnlineStatusRefresher _instance = WenanUserOnlineStatusRefresher();

  bool _isForeground = true;
  bool isWorking = false;
  Timer? _workTimer;

  int _lastRegisterOneTime = 0;

  bool canWorkPage = true;

  /// Map<uid, 引用计数>
  final Map<int, int> _userObserverCounter = {};

  ///app前后台切换
  void onAppForegroundChange(bool isForegroundValue) {
    _isForeground = isForegroundValue;
    if (_isForeground) {
      _start();
    } else {
      _stop();
    }
  }

  ///开始工作
  void _start() {
    if (isWorking || !_shouldStartWork()) {
      return;
    }

    isWorking = true;
    _startTimer();
  }

  ///停止工作
  void _stop() {
    isWorking = false;
    _stopTimer();
  }

  ///是否能够工作
  bool _shouldStartWork() {
    return _isForeground && _userObserverCounter.isNotEmpty == true && Application.isLogin();
  }

  ///可以刷新的页面
  bool _isInCanWorkPage() {
    String topPage = PageRouter.instance.topPage;
    if (canWorkPage || topPage.contains(PageRouter.UserMediaPage) || topPage.contains(PageRouter.PageChatDetail) || topPage.contains(PageRouter.MatchingPage)) {
      return true;
    }
    return false;
  }

  ///请求在线状态
  void _requestOnlineStatus() async {
    try {
      if (!_isInCanWorkPage()) {
        return;
      }
      if (!_shouldStartWork()) {
        _stop();
        return;
      }
      List<int> uIds = _userObserverCounter.keys.toList();
      List<CommonUserOnlineStatus> result = await FlashApi.getUserOnlineTimeReq(uIds).first;
      AuvChatLog.d("getUserOnlineTimeReq:$result");
      if (result.isNotEmpty) {
        for (CommonUserOnlineStatus element in result) {
          updateUserStatus(element);
        }
      }
    } catch (e, stack) {}
  }

  WenanUserOnlineStatusEnum updateUserStatus(CommonUserOnlineStatus element) {
    WenanUserOnlineStatusEnum status = WenanUserOnlineStatusEnum.offline;
    if (element.uid != null) {
      //0:离线，1：在线空闲，2：忙碌或勿扰
      if (element.isBusy) {
        status = WenanUserOnlineStatusEnum.on_call;
      } else if (element.isOnline) {
        status = WenanUserOnlineStatusEnum.online;
      } else {
        status = WenanUserOnlineStatusEnum.offline;
      }
      //保存到状态管理器中
      WenanUserOnlineStatusManager().saveStatus(element.uid!, status);
      //发送更新通知
      Application.eventBus.fire(AuvUserOnlineStatusUpdateEvent(element.uid!, status));
    }
    return status;
  }

  ///注册主播id
  void register(int uid) {
    if (uid <= 0) return;
    _registerOne(uid);
    //如果已经停止就启动
    _start();
    //0.5s内有新的uid，统一刷新
    _delayRefresh();
  }

  void registerList(List<int> uids) {
    for (var element in uids) {
      _registerOne(element);
    }
    //如果已经停止就启动
    _start();
    //0.5s内有新的uid，统一刷新
    _delayRefresh();
  }

  void _registerOne(int uid) {
    int? observerCount = _userObserverCounter[uid];
    observerCount ??= 0;
    //observerCount 加 1, unRegister时候-1，等于0从onlineMap里移除
    _userObserverCounter[uid] = observerCount + 1;
  }

  //0.5s内有新的uid，统一刷新
  void _delayRefresh() {
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    if (nowTime - _lastRegisterOneTime > 500) {
      _lastRegisterOneTime = nowTime;
      Future.delayed(const Duration(milliseconds: 500), () {
        _requestOnlineStatus();
      });
    }
  }

  ///解除主播id
  void unRegister(int uid) {
    int? observerCount = _userObserverCounter[uid];
    if (observerCount == null) {
      return;
    }

    observerCount = observerCount - 1;
    //等于0从onlineMap里移除
    if (observerCount <= 0) {
      _userObserverCounter.remove(uid);
    } else {
      _userObserverCounter[uid] = observerCount;
    }

    if (!_shouldStartWork()) {
      _stop();
    }
  }

  void _stopTimer() {
    if (_workTimer?.isActive ?? false) {
      _workTimer?.cancel();
    }
  }

  void _startTimer() {
    _stopTimer();
    //请求时间间隔 app配置项里
    _workTimer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      _requestOnlineStatus();
    });
    //直接发起一次请求，timer的第一次触发在5s后
    _requestOnlineStatus();
  }
}
