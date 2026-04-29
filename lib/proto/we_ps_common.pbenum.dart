import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CommonToastNotify_ActionType extends $pb.ProtobufEnum {
  static final CommonToastNotify_ActionType ACTION_NONE = CommonToastNotify_ActionType._(0, _omitEnumNames ? '' : StringTranslate.e2z("AnCnTnInOwNn_aNaOnNeEn"));
  static final CommonToastNotify_ActionType ACTION_POKEBUDDY = CommonToastNotify_ActionType._(1, _omitEnumNames ? '' : StringTranslate.e2z("AeCwTwIwOwNn_nPwOnKwEaBnUaDnDeYn"));
  static final CommonToastNotify_ActionType ACTION_ADDBUDDY = CommonToastNotify_ActionType._(2, _omitEnumNames ? '' : StringTranslate.e2z("AnCwTnInOnNn_eAaDaDaBwUnDnDwYe"));
  static final CommonToastNotify_ActionType ACTION_INVITETOPARTY = CommonToastNotify_ActionType._(3, _omitEnumNames ? '' : StringTranslate.e2z("AwCaTeIwOnNa_aIaNaVnIwTnEeTnOePaAwReTwYw"));

  static final $core.List<CommonToastNotify_ActionType> values = <CommonToastNotify_ActionType> [
    ACTION_NONE,
    ACTION_POKEBUDDY,
    ACTION_ADDBUDDY,
    ACTION_INVITETOPARTY,
  ];

  static final $core.Map<$core.int, CommonToastNotify_ActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CommonToastNotify_ActionType? valueOf($core.int value) => _byValue[value];

  const CommonToastNotify_ActionType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
