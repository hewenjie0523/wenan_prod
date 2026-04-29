import 'dart:convert';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';

part 'PaymentMethod.g.dart';

/**
 *
    data class PayModePrice(var name: String = "", var pay_mode: Int = 0, var source_mode: Int = 0,var price: Float = 0F, var currency: String = "",var icon: String = "") : Parcelable{

    fun getConvertPrice(): String {
    if (TextUtils.isEmpty(currency) ||  price == 0F) return ""
    return "$currency ${CommonMethodsKt.formatFloatCoin(price)}"
    }
    }
 */

class PaymentMethod {
  
  int pay_mode = 0;
  String? name;
  
  int source_mode = 0;
  
  double price = 0;
  String? tip;
  String? currency;
  String? icon;

  PaymentMethod();


  String get priceStr {
    return "$currency ${price.toStringAsFixed(2)}";
  }


  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}


