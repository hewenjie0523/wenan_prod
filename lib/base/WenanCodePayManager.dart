import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_event.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/base/cache/WenanCodeAppCache.dart';
import 'package:wenan/data/PaymentMethod.dart';
import 'package:wenan/data/PaymentOption.dart';
import 'package:wenan/data/PaymentOrder.dart';
import 'package:wenan/http/PaymentApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeAppCacheKeys.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/view/WenanCodemark_view.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart';

typedef PaySuccessCallback = void Function();
typedef PayFailureCallback = void Function(String? message);

class PayManager {
  static const int  PAY_WAY_SOURCE_FFPAY = 19;

  static PayManager get instance => _instance;
  static final PayManager _instance = PayManager();

  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  final PaymentApi _paymentApi = PaymentApi(DioHelper.getInstance());

  int _payMode = 0;
  PaymentOrder? _order;
  PaymentOption? _option;
  PaySuccessCallback? _onPaySuccess;
  PayFailureCallback? _onPayFailure;

  void register() {
    final Stream<List<PurchaseDetails>> purchaseUpdated = _inAppPurchase.purchaseStream;
    _subscription = purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      AuvChatLog.d("purchaseDetailsList:$purchaseDetailsList",tag: "Pay");
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      AuvChatLog.d("onDone:",tag: "Pay");
      _subscription.cancel();
    }, onError: (Object error) {
      AuvChatLog.printE(error,error: error);
      // handle error here.
    });
  }

  void unregister() {
    _subscription.cancel();
  }

  Future<PaymentOptionRsp> options(PaymentOptionType type) async {
    PaymentOptionRsp optionRsp;
    if (type == PaymentOptionType.popup) {
      optionRsp = await _paymentApi.popupOptions(0);
    } else {
      optionRsp = await _paymentApi.options(0, type.accountType);
    }

    if (optionRsp.getCodeInt() == 0) {
      if (optionRsp.data?.options != null && optionRsp.data!.options!.isNotEmpty) {
        IAPError? error = await _getStoreProducts(optionRsp.data!.options!);
        if (error != null) {
          optionRsp.code = -1;
          optionRsp.msg = error.message;
        }
      }
    }

    return optionRsp;
  }

  Future? payOptionCommon(PaymentOption option,BuildContext buildContext,int fromType,PaymentMethod paymentMethod,
      {PaySuccessCallback? onSuccess, PayFailureCallback? onFailure}) async{
    PaymentOrderRsp orderRsp = await _paymentApi.optionOrderWithExtra(paymentMethod.pay_mode, option.id,"{\"source_type\":$fromType}");
    if (orderRsp.getCodeInt() != 0) {
      onFailure == null ? null : onFailure(orderRsp.msg!);
      return;
    }
    //apple or google
    if(paymentMethod.pay_mode==3||paymentMethod.pay_mode==4){
      List<PaymentOption> options = [option];
      IAPError? error = await _getStoreProducts(options);
      if (error != null) {
        onFailure == null ? null : onFailure(error.message);
        return;
      }
      if (option.productDetails == null) {
        onFailure == null ? null : onFailure(StringTranslate.e2z(Application.appLocalizations!.wenan_string_product_get_failed));
        return;
      }

      _payMode = paymentMethod.pay_mode;
      _option = option;
      _order = orderRsp.data?.order;
      _onPaySuccess = onSuccess;
      _onPayFailure = onFailure;

      if (option.account_type == 1) {
        _inAppPurchase.buyConsumable(purchaseParam: PurchaseParam(
            productDetails: option.productDetails!,
            // 1.0.2(3) fixed
            androidProfileId: _order!.order_id!,
            applicationUserName: "${Application.commonUser?.uid}"));
      } else {
        _inAppPurchase.buyNonConsumable(purchaseParam: PurchaseParam(
            productDetails: option.productDetails!,
            androidProfileId: _order!.order_id!,
            applicationUserName:"${Application.commonUser?.uid}"));
      }
      return null;
    } else {
      addThirdPayCachedOrder(Utils.dynamicToIntNotNull(orderRsp.data?.order?.order_id), paymentMethod.pay_mode);
      AuvChatLog.d("addThirdPayCachedOrder:${orderRsp.data?.order?.check_page_url}");
      if (!Utils.isEmptyString(orderRsp.data?.order?.check_page_url)) {
        _payMode = paymentMethod.pay_mode;
        _option = option;
        _order = orderRsp.data?.order;
        _onPaySuccess = onSuccess;
        _onPayFailure = onFailure;
        if (_order?.jump_type=="1") {
          //TODO: make sure it's same as Intent.parseUri(url, Intent.URI_INTENT_SCHEME)
          return PageRouter.startBrowserWeb(buildContext, _order!.check_page_url!);
          // H5PageAc.startAppRoot(this, payInfo.check_page_url)
        } else if (_order?.jump_type=="2") {
          return PageRouter.startBrowserWeb(buildContext, _order!.check_page_url!);
        } else {
          if (paymentMethod.source_mode == PAY_WAY_SOURCE_FFPAY) {
            //针对FFPAY 进行定制
            return PageRouter.startBrowserWeb(buildContext, _order!.check_page_url!);
          } else {
            AuvChatLog.d("startWebview:${_order!.check_page_url}");
            return PageRouter.startWebview(buildContext, _order!.check_page_url!);
          }
        }
      }
    }
  }


  // Future<bool> verifyThirdPayOrder() async {
  //   String? orderId = _order?.order_id;
  //   if (orderId == null) return false;
  //   PaymentCheckResultRsp rsp = await _paymentApi.payCheck(_payMode, orderId, "");
  //   if (rsp.data?.result == 1) {
  //     sendAdjustTrack();
  //     _finishPayOrder(true, null);
  //     return true;
  //   }
  //   return false;
  // }

  Future<PaymentOption?> optionDetail(int optionId) async {
    PaymentOptionDetailRsp optionRsp = await _paymentApi.optionDetail(optionId);

    if (optionRsp.getCodeInt() == 0) {
      try {
        if(Platform.isAndroid){
          // AuvChatLog.d("ngc=${AppConfig.getCachedAppConfig()?.data?.extensions?.ngc}");
          Set<String> productIds = <String>{};
          if(!Utils.isEmptyString(optionRsp.data?.option?.platformProdId)){
            productIds.add(optionRsp.data!.option!.platformProdId!);
          }

          if (productIds.isNotEmpty) {
            final ProductDetailsResponse rsp = await _inAppPurchase.queryProductDetails(productIds);
            bool removeGooglePay = false;
            if (rsp.error != null||rsp.productDetails.isEmpty) {
              removeGooglePay = false;
            } else {
              removeGooglePay = AppConfig.hasNgc(rsp.productDetails.first.currencyCode);
            }
            if(removeGooglePay){
              optionRsp.data?.option?.pay_mode_prices?.removeWhere((element) => element.pay_mode==4);
            }
          }
        }
      } catch (e) {
        AuvChatLog.printE(e);
      }
      return optionRsp.data?.option;
    }

    return null;
  }

  Future<void> _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) async {
    bool hasError = false;
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      AuvChatLog.d("purchaseDetails:${purchaseDetails.status},${purchaseDetails.productID},${purchaseDetails.purchaseID},${purchaseDetails.verificationData}",tag: "Pay");
      switch (purchaseDetails.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          {
            final bool valid = await _verifyPurchase(purchaseDetails);
            if (valid) {
              _deliverProduct(purchaseDetails);
            } else {
              _handleInvalidPurchase(purchaseDetails);
              return;
            }
            break;
          }
        case PurchaseStatus.error:
          _handleError(purchaseDetails.error?.message);
          hasError = true;
          break;
        case PurchaseStatus.canceled:
          _handleError(StringTranslate.e2z(Application.appLocalizations!.wenan_string_canceled));
          break;
        default:
          break;
      }

      if (purchaseDetails.pendingCompletePurchase) {
        await _inAppPurchase.completePurchase(purchaseDetails);
      }
    }
    //query if there is any vip order(NonConsumable ones) that hasn't been consumed
    AuvChatLog.d("hasError=$hasError");
    if(hasError){
      AuvChatLog.d("start restorePurchases");
      _inAppPurchase.restorePurchases();
    }
  }

  void _handleError(String? message) {
    AuvChatLog.e('IAP Error ${!Utils.isEmptyString(message) ? message! : 'purchase error'}',tag: "Pay");
    _finishPayOrder(false, message);
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    String key = 'purchase_${purchaseDetails.purchaseID!}';
    String? orderId = SpHelper.getString(key);
    AuvChatLog.d("orderId:$orderId",tag: "Pay");
    orderId ??= _order?.order_id;
    AuvChatLog.d("orderId.real:$orderId",tag: "Pay");

    String receiptInfo = purchaseDetails.verificationData.serverVerificationData;
    if (purchaseDetails is GooglePlayPurchaseDetails) {
      PurchaseWrapper billingClientPurchase = purchaseDetails.billingClientPurchase;
      receiptInfo = billingClientPurchase.originalJson;
      orderId = billingClientPurchase.obfuscatedProfileId??orderId;
      AuvChatLog.d("orderId=${billingClientPurchase.obfuscatedProfileId},originalJson:$receiptInfo",tag: "Pay");
    }
    if (orderId == null) return false;
    SpHelper.putString(key, orderId);
    PaymentCheckResultRsp rsp = await _paymentApi.payCheck(4, orderId, Utils.base64UrlEncode(receiptInfo));
    if (rsp.data?.result == 1) {
      SpHelper.remove(key);
      //_option?.base_currency_price??0, _option?.base_currency??""
      num totalPrice = _option?.base_currency_price??0;
      String currency = _option?.base_currency??"";
      if(!Utils.isEmptyString(rsp.data?.order)){
        try {
          PayedOrderInfo payedOrderInfo = PayedOrderInfo.fromJson(json.decode(rsp.data!.order!));
          totalPrice = payedOrderInfo.base_total_price;
          currency = payedOrderInfo.base_currency;
          orderId = payedOrderInfo.id.toString();

          ///记录支付成功的订单数量
          SpHelper.incrPayCount(totalPrice);
        } catch (e) {
          AuvChatLog.printE(e);
        }
      }
      sendAdjustTrackData(totalPrice, currency,orderId);
      return true;
    }
    return false;
  }

  Future<void> _deliverProduct(PurchaseDetails purchaseDetails) async {
    _finishPayOrder(true, null);
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    _finishPayOrder(false, StringTranslate.e2z(Application.appLocalizations!.wenan_string_payment_verify_failed));
  }

  Future<IAPError?> _getStoreProducts(List<PaymentOption> options) async {
    final bool valid = await _inAppPurchase.isAvailable();
    if (!valid) {
      IAPError error = IAPError(source: "null", code: "-1", message: StringTranslate.e2z(Application.appLocalizations!.wenan_string_product_get_failed));
      return error;
    }
    Set<String> productIds = <String>{};
    for (var option in options) {
      if (!Utils.isEmptyString(option.platformProdId)) {
        productIds.add(option.platformProdId!);
      }
    }
    if (productIds.isNotEmpty) {
      final ProductDetailsResponse rsp = await _inAppPurchase.queryProductDetails(productIds);
      if (rsp.error != null) {
        return rsp.error;
      } else if (rsp.productDetails.isNotEmpty) {
        for (var option in options) {
          if (!Utils.isEmptyString(option.platformProdId)) {
            for (var details in rsp.productDetails) {
              if (option.platformProdId!.compareTo(details.id) == 0) {
                option.productDetails = details;
                break;
              }
            }
          }
        }
      }
    }
    return null;
  }

  void _finishPayOrder(bool success, String? message) {
    if (success) {
      _onPaySuccess == null ? null : _onPaySuccess!();
      MarkView.show(50);
    } else {
      _onPayFailure == null ? null : _onPayFailure!(message);
    }
    _payMode = 0;
    _order = null;
    _option = null;
    _onPaySuccess = null;
    _onPayFailure = null;
  }

  void sendAdjustTrackData(num price, String currency,String? orderId) {
    AdjustEvent adjustEvent =  AdjustEvent(AppConfig.adjustPayEvent);
    adjustEvent.setRevenue(price, currency);
    adjustEvent.transactionId = orderId;
    Adjust.trackEvent(adjustEvent);
  }

  void addThirdPayCachedOrder(int orderId, int payMode) {
    AuvChatLog.d('addThirdPayCachedOrder orderId:$orderId payMode:$payMode');
    ThirdPayCachedOrder order = ThirdPayCachedOrder();
    order.orderId = orderId;
    order.payMode = payMode;
    order.time = DateTime.now().millisecondsSinceEpoch;
    List<ThirdPayCachedOrder> orders = getThirdPayCachedOrders()??[];
    orders.add(order);
    saveThirdPayCachedOrders(orders);
  }

  List<ThirdPayCachedOrder>? getThirdPayCachedOrders(){
    String? cachedString = SpHelper.getThirdPayOrdersString();
    if(Utils.isEmptyString(cachedString)){
      return null;
    }
    List<String> cachedList = cachedString!.split("##");
    List<ThirdPayCachedOrder> orders = [];
    for(String cached in cachedList){
      var item = ThirdPayCachedOrder.fromJson(cached);
      if(item != null){
        orders.add(item);
      }
    }
    //清理过期订单
    orders.removeWhere((element) => element.time < DateTime.now().millisecondsSinceEpoch - 1000 * 60 * 60 * 24*2);
    saveThirdPayCachedOrders(orders);
    return orders;
  }

  void saveThirdPayCachedOrders(List<ThirdPayCachedOrder>? orders){
    if(Utils.isEmptyList(orders)){
      SpHelper.setThirdPayOrdersString("");
      return;
    }
    List<String> cachedList = [];
    for(ThirdPayCachedOrder order in orders!){
      cachedList.add(order.json);
    }
    SpHelper.setThirdPayOrdersString(cachedList.join("##"));
  }

  void removeThirdPayCachedOrder(List<int> orderIds) {
    AuvChatLog.d("removeThirdPayCachedOrder");
    if(orderIds.isEmpty) return;
    List<ThirdPayCachedOrder>? orders = getThirdPayCachedOrders();
    orders?.removeWhere((element) => orderIds.contains(element.orderId));
    saveThirdPayCachedOrders(orders);
  }

  void batchCheckThirdPayCachedOrders({bool showToast = false}){
    List<ThirdPayCachedOrder>? orders = getThirdPayCachedOrders();
    AuvChatLog.d("batchCheckThirdPayCachedOrders,orders=$orders");
    if(orders == null || orders.isEmpty) return;
    String json = "[${orders.map((e) => e.json).join(",")}]";
    bool toast = false;
    _paymentApi.batchPayCheck(json).then((value) {
      if(value.getCodeInt() == 0){
        List<int> orderIds = [];
        value.data?.orders?.where((element) => element.result == 1&&element.order!=null).forEach((element) {
          //删除本地记录
          orderIds.add(element.order!.id);
          //toast
          toast = true;
          //上报adjust
          sendAdjustTrackData(element.order!.base_total_price, element.order!.base_currency,element.order!.id.toString());
        });
        removeThirdPayCachedOrder(orderIds);
        if(toast && showToast) {
          Fluttertoast.showToast(msg: StringTranslate.e2z(Application.appLocalizations!.wenan_string_payment_successful));
        }
      }
    });
  }
}


///PayCheckOrder(var order_id : Long = 0L, var time :Long = 0L, var pay_mode :Int = 0)
class ThirdPayCachedOrder{
  int orderId =0;
  int payMode =0;
  int time =0;

  String get json => '{"order_id":$orderId,"pay_mode":$payMode,"time":$time}';
  @override
  toString() => json;


  static ThirdPayCachedOrder? fromJson(String? jsonStr) {
    if (Utils.isEmptyString(jsonStr)) return null;
    Map<String, dynamic> json = jsonDecode(jsonStr!);
    ThirdPayCachedOrder order = ThirdPayCachedOrder()..orderId = json['order_id']..payMode = json['pay_mode']..time = json['time'];
    return order;
  }
}
