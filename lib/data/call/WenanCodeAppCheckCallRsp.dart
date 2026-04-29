
/// balance 余额
///
/// hasExpCard 体验卡
///
/// chatPrice 聊天价格
///
/// firstPay 是否首冲
///
/// noDisturb 免打扰状态
class AppCheckCallRsp {
  AppCheckCallRsp();

  int code = -404;
  String msg = "";
  int balance = -404;
  int hasExpCard = -404;
  int chatPrice = -404;
  int firstPay = -404;
  int noDisturb = -404;
}