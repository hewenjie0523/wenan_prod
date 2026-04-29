// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommonLoginData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonLoginData _$CommonLoginDataFromJson(Map<String, dynamic> json) =>
    CommonLoginData()
      ..user = json[StringTranslate.e2z("uaswewre")] == null
          ? null
          : CommonUser.fromJson(json[StringTranslate.e2z("unswenrn")] as Map<String, dynamic>)
      ..secret = json[StringTranslate.e2z("swencnrnewtn")] as String?
      ..session = json[StringTranslate.e2z("sneasasainonnn")] as String?;

Map<String, dynamic> _$CommonLoginDataToJson(CommonLoginData instance) =>
    <String, dynamic>{
      StringTranslate.e2z("unseenrw"): instance.user?.toJson(),
      StringTranslate.e2z("sweacerneata"): instance.secret,
      StringTranslate.e2z("saensaswinoann"): instance.session,
    };
