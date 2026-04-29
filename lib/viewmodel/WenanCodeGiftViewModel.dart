import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/base/cache/WenanCodeAppCache.dart';
import 'package:wenan/state/call/WenanCodePhoneCallNotify.dart';
import 'package:wenan/data/Gift.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/data/user/UserAccount.dart';
import 'package:wenan/http/CommonApi.dart';
import 'package:wenan/http/ProfileApi.dart';
import 'package:wenan/http/UserApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/proto/we_ps_bu_call.pb.dart';
import 'package:wenan/http/socket/WenanCodecall_api.dart';
import 'package:wenan/http/socket/WenanCodesocket_rsp.dart';
import 'package:wenan/http/socket/WenanCodesocket_util.dart';
import 'package:wenan/utils/WenanCodelog.dart';

import '../utils/WenanCodeutils.dart';

final giftViewModel = Provider((ref) => GiftViewModel());
final selectedGiftIdProvider = StateProvider.autoDispose((ref) => ref.read(giftViewModel).selectedGiftId);

class GiftViewModel {
  CommonApi? _commonApi;

  CommonApi _getCommonApi() {
    return _commonApi ??= CommonApi(DioHelper.getInstance());
  }

  UserAccount? userAccount;

  int? _selectedGiftId ;

  int? get selectedGiftId=>_selectedGiftId;

  Future<String> getAccountCoins() async{
    AuvChatLog.d("getAccountCoins:${describeIdentity(this)}");
    try {
      var rsp = await _getCommonApi().walletAccount(1);
      userAccount = rsp.data?["account"];
      await PhoneCallNotify.coupons(true);
    } catch (e,stack) {
      AuvChatLog.printE(e,error: stack);
    }
    final amount = (userAccount?.amount ?? 0) + PhoneCallNotify.couponTotalValue();
    Application.commonUser?.extend?.balance = amount.toInt();
    var realBalance = Utils.parseInt(userAccount?.amount ?? 0);
    if (realBalance != null && Application.realBalance != realBalance) {
      Application.realBalance = realBalance;
      Application.updateHasRecharge();
    }
    return "$amount";
  }

  Future<String> getRealAccountCoins() async{
    AuvChatLog.d("getRealAccountCoins:${describeIdentity(this)}");
    try {
      var rsp = await _getCommonApi().walletAccount(1);
      userAccount = rsp.data?["account"];
      await PhoneCallNotify.coupons(true);
    } catch (e,stack) {
      AuvChatLog.printE(e,error: stack);
    }
    final amount = (userAccount?.amount ?? 0) + PhoneCallNotify.couponTotalValue();
    Application.commonUser?.extend?.balance = amount.toInt();
    var realBalance = Utils.parseInt(userAccount?.amount ?? 0);
    return "$realBalance";
  }

  Future<List<Gift>?> getGift() async{
    try {
      List<Gift>? result = AppCache.instance.getList("gift_list",convert: (json)=>Gift.fromJson(json));
      AuvChatLog.d("getGift,fromcCache:$result");
      if(result==null||result.isEmpty){
            var rsp = await _getCommonApi().gifts();
            result = rsp.data?.gifts;
            AppCache.instance.put("gift_list", result,validTimeInMills: 60*60*1000);
      }
      AuvChatLog.d("getGift:$result");
      return result;
    } catch (e,stack) {
      AuvChatLog.printE(e,error: stack);
    }
    return null;
  }

  bool preSendGift(BuildContext context,Gift gift){
    // AuvChatLog.d("preSendGift:$userAccount");
    AuvChatLog.d("preSendGift:${describeIdentity(this)}");
    return userAccount!=null&&((userAccount!.amount??0)>=(gift.price??0));
  }

  updateSelectGiftId(int selectedGiftId,WidgetRef ref){
    AuvChatLog.d("updateSelectGiftId:$selectedGiftId");
    _selectedGiftId = selectedGiftId;
    ref.refresh(selectedGiftIdProvider);
  }
}

