import 'dart:convert';
import 'dart:io';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/PaymentMethod.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';

part 'PaymentOption.g.dart';

enum PaymentOptionType { coin, vip, popup }

extension PaymentOptionTypeExtension on PaymentOptionType {
  int get accountType {
    int ret = 0;
    switch (this) {
      case PaymentOptionType.coin:
        ret = 1;
        break;
      case PaymentOptionType.vip:
        ret = 9;
        break;
      default:
        break;
    }
    return ret;
  }
}


class PaymentOption {
  
  int id = 0;
  String? name;
  
  int name_amount = 0;
  String? name_title;
  
  int group_id = 0;
  
  int account_type = 0;
  
  double value = 0;
  
  double extra_value = 0;
  String? tip;
  String? app_store_prod_id;
  String? google_prod_id;
  
  double price = 0;
  String? currency;
  String? base_currency;
  
  double base_currency_price = 0;
  
  double discount_rate = 0;
  
  PaymentOptionInfo? info;

  List<PaymentMethod>? pay_mode_prices;

  
  ProductDetails? productDetails;

  PaymentOption();

  bool get _showSKPrice {
    return (productDetails?.rawPrice != null &&
        productDetails!.rawPrice > 0 &&
        (!Utils.isEmptyString(productDetails?.currencyCode) ||
            !Utils.isEmptyString(productDetails?.currencySymbol)));
  }

  String get _skCurrency {
    return (Utils.isEmptyString(productDetails?.currencySymbol)
        ? productDetails!.currencyCode
        : productDetails!.currencySymbol);
  }

  String get priceStr {
    if (_showSKPrice) {
      return "$_skCurrency ${_priceStringAsFixed(productDetails!.rawPrice)}";
    } else {
      return "$currency ${_priceStringAsFixed(price)}";
    }
  }

  String _priceStringAsFixed(double price) {
    String pStr = price.toStringAsFixed(2);
    if (pStr.length > 7 && pStr.endsWith('.00')) {
      pStr = pStr.substring(0, pStr.length - 3);
    }
    return pStr;
  }

  String get originalPriceStr {
    if (discount_rate <= 0) return '';
    if (_showSKPrice) {
      return _skCurrency +
          ' ' +
          (productDetails!.rawPrice / discount_rate).toStringAsFixed(2);
    } else {
      return currency! + ' ' + (price / discount_rate).toStringAsFixed(2);
    }
  }

  String get unitTitle {
    if (Utils.isEmpty(name_title) || isLifetime) return "";
    if (name_title == "week") {
      return StringTranslate.e2z(AppLocalizations.of(Application.appContext!)!.wenan_string_week);
    }
    if (name_title == "month") {
      return StringTranslate.e2z(AppLocalizations.of(Application.appContext!)!.wenan_string_month);
    }
    if (name_title == "months") {
      return StringTranslate.e2z(AppLocalizations.of(Application.appContext!)!.wenan_string_months);
    }
    if (name_title == "days") {
      return StringTranslate.e2z(AppLocalizations.of(Application.appContext!)!.wenan_string_days);
    }
    if (name_title == "year") {
      return StringTranslate.e2z(AppLocalizations.of(Application.appContext!)!.wenan_string_year);
    }
    if (name_title == "years") {
      return StringTranslate.e2z(AppLocalizations.of(Application.appContext!)!.wenan_string_years);
    }
    return name_title!;
  }

  String get unitPriceStr {
    String unit = !name_title!.endsWith('s')
        ? name_title!
        : name_title!.substring(0, name_title!.length - 1);
    if (_showSKPrice) {
      return _skCurrency +
          (productDetails!.rawPrice / name_amount).toStringAsFixed(2) +
          '/' +
          unit;
    } else {
      return currency! + (price / name_amount).toStringAsFixed(2) + '/' + unit;
    }
  }

  bool get showDiscount {
    return discount_rate != 0 && discount_rate < 1;
  }

  String get discountStr {
    if (showDiscount) {
      int dis = (discount_rate * 100).toInt();
      return "$dis%";
    }
    return "";
  }

  bool get isBestOffer {
    return info?.best_discount ?? false;
  }

  bool get isLifetime {
    return value == 999999;
  }

  bool get isFirstRecharge {
    return group_id == 1;
  }

  bool get isVip {
    return account_type == 9;
  }

  String? get detailName {
    if (isVip) {
      if (isLifetime) {
        return StringTranslate.e2z(Application.appLocalizations!.wenan_string_lifetime);
      } else {
        return "$name_amount";
      }
    }
    return name;
  }

  String? get platformProdId {
    return Platform.isAndroid ? google_prod_id : app_store_prod_id;
  }

  factory PaymentOption.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOptionToJson(this);
}


class PaymentOptionInfo {
  
  bool best_discount = false;

  PaymentOptionInfo();

  static PaymentOptionInfo? fromJsonString(String? source) {
    if (Utils.isEmptyString(source)) return null;
    Map<String, dynamic> json = jsonDecode(source!);
    return PaymentOptionInfo.fromJson(json);
  }

  factory PaymentOptionInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOptionInfoToJson(this);
}
