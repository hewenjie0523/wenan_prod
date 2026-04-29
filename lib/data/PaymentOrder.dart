import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

part 'PaymentOrder.g.dart';


class PaymentOrder {
  String? order_id;
  String? app_store_prod_id;
  String? google_prod_id;
  String? check_page_url;
  String? jump_type;

  PaymentOrder();

  factory PaymentOrder.fromJson(Map<String, dynamic> json) => _$PaymentOrderFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOrderToJson(this);
}

