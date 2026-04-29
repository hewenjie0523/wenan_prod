import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/base/WenanCodePayManager.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/utils/WenanCodelog.dart';

import '../base/WenanCodeApplication.dart';
import '../base/WenanCodeSpHelper.dart';
import '../base/cache/WenanCodeAppCache.dart';
import '../data/Gift.dart';
import '../data/user/CommonLoginData.dart';
import '../http/PaymentApi.dart';
import '../utils/WenanCodeutils.dart';

final payModel = Provider((ref) => PayModelProvider());

class PayModelProvider {
  final PayManager _manager = PayManager();

  Future<List<PaymentOption>> getBalanceList({bool isForce = false}) async {
    List<PaymentOption>? result;
    if(!isForce) {
      try {
        result = AppCache.instance.getList(
            "recharge_balance_list",
            convert: (json) => PaymentOption.fromJson(json));
        AuvChatLog.d("getBalanceList,fromCache:$result");
      } catch (e, stack) {
        AuvChatLog.printE(e, error: stack);
      }
    }
    if(!Utils.isEmptyList(result)) return result!;

    try {
        var rsp = await _manager.options(PaymentOptionType.coin);
        result = rsp.data?.options ?? [];
        AppCache.instance.put("recharge_balance_list", result);
        AuvChatLog.d("getBalanceList,fromNet:$result");
        return result;
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
    }
    return result??[];
  }

  Future<PaymentOption?> getPaymentOptionDetail(int optionId) async {
    PaymentOption? result;
    try {
      result = await _manager.optionDetail(optionId);
      AuvChatLog.d("getPaymentOptionDetail,fromNet:$result");
      return result!;
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
    }
    return result;
  }


  Future<List<PaymentOption>> getFirstRechargeList(
      {bool isForce = false}) async {
    List<PaymentOption>? result;
    if(!isForce) {
      try {
        result = AppCache.instance.getList(
            "recharge_first_recharge_list",
            convert: (json) => PaymentOption.fromJson(json));
        AuvChatLog.d("getFirstRechargeList,fromCache:$result");
      } catch (e, stack) {
        AuvChatLog.printE(e, error: stack);
      }
    }
    if(!Utils.isEmptyList(result)) return result!;

    try {
      var rsp = await _manager.options(PaymentOptionType.popup);
      result = rsp.data?.options ?? [];
      AppCache.instance.put("recharge_first_recharge_list", result);
      AuvChatLog.d("getFirstRechargeList,fromNet:$result");
      return result;
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
    }
    return result??[];
  }


  Future<List<PaymentOption>> getVipList({bool isForce = false}) async {

    List<PaymentOption>? result;
    if(!isForce) {
      try {
        result = AppCache.instance.getList(
            "recharge_vip_list",
            convert: (json) => PaymentOption.fromJson(json));
        AuvChatLog.d("getVipList,fromCache:$result");
      } catch (e, stack) {
        AuvChatLog.printE(e, error: stack);
      }
    }
    if(!Utils.isEmptyList(result)) return result!;

    try {
      var rsp = await _manager.options(PaymentOptionType.vip);
      result = rsp.data?.options ?? [];
      AppCache.instance.put("recharge_vip_list", result);
      AuvChatLog.d("getVipList,fromNet:$result");
      return result;
    } catch (e, stack) {
      AuvChatLog.printE(e, error: stack);
    }
    return result??[];
  }

}
