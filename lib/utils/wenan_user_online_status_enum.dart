

enum WenanUserOnlineStatusEnum {
  ///离线
  offline,

  ///在线
  online,

  ///通话中
  on_call,

  ///勿扰
  no_disturb;

  ///是否忙
  bool isBusy() {
    return [WenanUserOnlineStatusEnum.on_call, WenanUserOnlineStatusEnum.no_disturb].contains(this);
  }

  ///解析成枚举类型
  static WenanUserOnlineStatusEnum valueOf(int? statusIndex) {
    try {
      return statusIndex == null ? WenanUserOnlineStatusEnum.offline : WenanUserOnlineStatusEnum.values[statusIndex];
    } catch (e, stack) {
    }
    return WenanUserOnlineStatusEnum.offline;
  }
}
