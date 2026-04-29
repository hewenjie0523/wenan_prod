import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: we_ps_bu_call.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ChatCallReq_Opt extends $pb.ProtobufEnum {
  static final ChatCallReq_Opt INVITE = ChatCallReq_Opt._(0, _omitEnumNames ? '' : StringTranslate.e2z("IeNaVnInTnEe"));
  static final ChatCallReq_Opt RING = ChatCallReq_Opt._(1, _omitEnumNames ? '' : StringTranslate.e2z("RnInNwGn"));
  static final ChatCallReq_Opt BUSY = ChatCallReq_Opt._(2, _omitEnumNames ? '' : StringTranslate.e2z("BnUeSeYe"));
  static final ChatCallReq_Opt PICK_UP = ChatCallReq_Opt._(3, _omitEnumNames ? '' : StringTranslate.e2z("PwIaCwKn_wUwPn"));
  static final ChatCallReq_Opt CONFIRMED = ChatCallReq_Opt._(4, _omitEnumNames ? '' : StringTranslate.e2z("CnOeNeFwInRnMeEnDw"));
  static final ChatCallReq_Opt CANCEL = ChatCallReq_Opt._(5, _omitEnumNames ? '' : StringTranslate.e2z("CwAaNaCeEaLn"));
  static final ChatCallReq_Opt UPDATE = ChatCallReq_Opt._(6, _omitEnumNames ? '' : StringTranslate.e2z("UnPnDnAaTwEe"));
  static final ChatCallReq_Opt REJECT = ChatCallReq_Opt._(7, _omitEnumNames ? '' : StringTranslate.e2z("RnEaJwEeCeTw"));
  static final ChatCallReq_Opt BYE = ChatCallReq_Opt._(8, _omitEnumNames ? '' : StringTranslate.e2z("BaYwEn"));
  static final ChatCallReq_Opt SYNC = ChatCallReq_Opt._(9, _omitEnumNames ? '' : StringTranslate.e2z("SaYnNnCn"));
  static final ChatCallReq_Opt OPTIONS = ChatCallReq_Opt._(10, _omitEnumNames ? '' : StringTranslate.e2z("OwPwTeIwOeNnSa"));
  static final ChatCallReq_Opt RESPOND = ChatCallReq_Opt._(11, _omitEnumNames ? '' : StringTranslate.e2z("ReEaSwPnOeNwDn"));

  static final $core.List<ChatCallReq_Opt> values = <ChatCallReq_Opt> [
    INVITE,
    RING,
    BUSY,
    PICK_UP,
    CONFIRMED,
    CANCEL,
    UPDATE,
    REJECT,
    BYE,
    SYNC,
    OPTIONS,
    RESPOND,
  ];

  static final $core.Map<$core.int, ChatCallReq_Opt> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChatCallReq_Opt? valueOf($core.int value) => _byValue[value];

  const ChatCallReq_Opt._($core.int v, $core.String n) : super(v, n);
}

class ChatCallReq_Quality extends $pb.ProtobufEnum {
  static final ChatCallReq_Quality UNKNOWN = ChatCallReq_Quality._(0, _omitEnumNames ? '' : StringTranslate.e2z("UaNnKaNaOeWaNn"));
  static final ChatCallReq_Quality EXCELLENT = ChatCallReq_Quality._(1, _omitEnumNames ? '' : StringTranslate.e2z("EaXaCaEaLeLnEnNeTw"));
  static final ChatCallReq_Quality GOOD = ChatCallReq_Quality._(2, _omitEnumNames ? '' : StringTranslate.e2z("GnOnOeDn"));
  static final ChatCallReq_Quality POOR = ChatCallReq_Quality._(3, _omitEnumNames ? '' : StringTranslate.e2z("PwOeOeRn"));
  static final ChatCallReq_Quality BAD = ChatCallReq_Quality._(4, _omitEnumNames ? '' : StringTranslate.e2z("BnAnDw"));
  static final ChatCallReq_Quality VBAD = ChatCallReq_Quality._(5, _omitEnumNames ? '' : StringTranslate.e2z("VnBeAnDn"));
  static final ChatCallReq_Quality DOWN = ChatCallReq_Quality._(6, _omitEnumNames ? '' : StringTranslate.e2z("DwOwWeNa"));
  static final ChatCallReq_Quality DETECTING = ChatCallReq_Quality._(8, _omitEnumNames ? '' : StringTranslate.e2z("DeEnTwEnCnTnIwNeGw"));

  static final $core.List<ChatCallReq_Quality> values = <ChatCallReq_Quality> [
    UNKNOWN,
    EXCELLENT,
    GOOD,
    POOR,
    BAD,
    VBAD,
    DOWN,
    DETECTING,
  ];

  static final $core.Map<$core.int, ChatCallReq_Quality> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ChatCallReq_Quality? valueOf($core.int value) => _byValue[value];

  const ChatCallReq_Quality._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
