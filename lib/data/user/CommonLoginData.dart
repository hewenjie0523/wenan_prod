

import 'package:json_annotation/json_annotation.dart';
import 'package:wenan/StringTranslate.dart';

import 'CommonUser.dart';

part 'CommonLoginData.g.dart';


class CommonLoginData{
  CommonUser? user;
  String? secret;
  String? session;

  CommonLoginData();

  factory CommonLoginData.fromJson(Map<String, dynamic> json) {
    final u = _$CommonLoginDataFromJson(json);
    return u;
  }

  Map<String, dynamic> toJson() => _$CommonLoginDataToJson(this);
}