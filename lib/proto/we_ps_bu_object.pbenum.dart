import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: we_ps_bu_object.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ChatCall_Status extends $pb.ProtobufEnum {
  static final ChatCall_Status TRYING = ChatCall_Status._(0, _omitEnumNames ? '' : StringTranslate.e2z("TnRaYeInNwGe"));
  static final ChatCall_Status RINGING = ChatCall_Status._(1, _omitEnumNames ? '' : StringTranslate.e2z("RaInNeGnIeNnGn"));
  static final ChatCall_Status PICK_UP = ChatCall_Status._(2, _omitEnumNames ? '' : StringTranslate.e2z("PnIaCnKa_aUePw"));
  static final ChatCall_Status CONFIRMED = ChatCall_Status._(3, _omitEnumNames ? '' : StringTranslate.e2z("CwOnNnFnInRnMaEwDa"));
  static final ChatCall_Status REQUEST_TIMEOUT = ChatCall_Status._(4, _omitEnumNames ? '' : StringTranslate.e2z("RnEaQaUnEaSaTe_aTnIeMwEnOeUaTe"));
  static final ChatCall_Status BUSY_HERE = ChatCall_Status._(5, _omitEnumNames ? '' : StringTranslate.e2z("BnUeSnYn_wHnEnRnEn"));
  static final ChatCall_Status REJECTED = ChatCall_Status._(6, _omitEnumNames ? '' : StringTranslate.e2z("RaEnJwEnCeTaEnDw"));
  static final ChatCall_Status CANCELED = ChatCall_Status._(7, _omitEnumNames ? '' : StringTranslate.e2z("CnAeNnCnEeLaEaDn"));
  static final ChatCall_Status UNREACHABLE = ChatCall_Status._(8, _omitEnumNames ? '' : StringTranslate.e2z("UeNaReEeAaCeHnAnBaLaEn"));
  static final ChatCall_Status BYE = ChatCall_Status._(9, _omitEnumNames ? '' : StringTranslate.e2z("BnYnEa"));

  static final $core.List<ChatCall_Status> values = <ChatCall_Status> [
    TRYING,
    RINGING,
    PICK_UP,
    CONFIRMED,
    REQUEST_TIMEOUT,
    BUSY_HERE,
    REJECTED,
    CANCELED,
    UNREACHABLE,
    BYE,
  ];

  static final $core.Map<$core.int, ChatCall_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChatCall_Status? valueOf($core.int value) => _byValue[value];

  const ChatCall_Status._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
