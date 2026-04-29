import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Message_Category extends $pb.ProtobufEnum {
  static final Message_Category BASE = Message_Category._(0, _omitEnumNames ? '' : StringTranslate.e2z("BnAeSnEn"));
  static final Message_Category IM = Message_Category._(1, _omitEnumNames ? '' : StringTranslate.e2z("InMa"));
  static final Message_Category FUN = Message_Category._(2, _omitEnumNames ? '' : StringTranslate.e2z("FeUaNe"));
  static final Message_Category MAXCATE = Message_Category._(99, _omitEnumNames ? '' : StringTranslate.e2z("MaAnXwCwAnTwEn"));

  static final $core.List<Message_Category> values = <Message_Category> [
    BASE,
    IM,
    FUN,
    MAXCATE,
  ];

  static final $core.Map<$core.int, Message_Category> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_Category? valueOf($core.int value) => _byValue[value];

  const Message_Category._($core.int v, $core.String n) : super(v, n);
}

class Message_Type extends $pb.ProtobufEnum {
  static final Message_Type HEARTBEAT = Message_Type._(0, _omitEnumNames ? '' : StringTranslate.e2z("HeEwAwRaTeBnEnAaTa"));
  static final Message_Type COMMONRSP = Message_Type._(1, _omitEnumNames ? '' : StringTranslate.e2z("CnOaMwMeOnNaRnSaPe"));
  static final Message_Type COMMONACK = Message_Type._(2, _omitEnumNames ? '' : StringTranslate.e2z("CwOwMeMeOnNeAnCnKa"));
  static final Message_Type COMMONSERVICEERR = Message_Type._(3, _omitEnumNames ? '' : StringTranslate.e2z("CaOaMeMwOaNeSnEnReVeInCnEnEnRnRn"));
  static final Message_Type AUTHREQ = Message_Type._(4, _omitEnumNames ? '' : StringTranslate.e2z("AaUnTnHwRnEnQn"));
  static final Message_Type GUIDEAUTHREQ = Message_Type._(5, _omitEnumNames ? '' : StringTranslate.e2z("GwUnIeDnEwAnUeTnHeRnEnQn"));
  static final Message_Type AUTHRSP = Message_Type._(6, _omitEnumNames ? '' : StringTranslate.e2z("AnUnTaHnRaSwPe"));
  static final Message_Type USEROFFLINEPSH = Message_Type._(7, _omitEnumNames ? '' : StringTranslate.e2z("UaSeEnRwOwFnFeLnIwNeEnPwSnHw"));
  static final Message_Type USERONLINEPSH = Message_Type._(8, _omitEnumNames ? '' : StringTranslate.e2z("UnSnEwReOnNnLnIwNnEwPeSwHw"));
  static final Message_Type SESSIONINVALIDNOTIFY = Message_Type._(9, _omitEnumNames ? '' : StringTranslate.e2z("SwEnSnSaInOnNwInNeVeAnLnIaDnNaOnTwIwFnYw"));
  static final Message_Type ADVERTISEMENTNOTIFY = Message_Type._(10, _omitEnumNames ? '' : StringTranslate.e2z("AnDwVeEaRnTaIaSwEnMaEwNaTaNaOeTwIeFnYn"));
  static final Message_Type COMMONTOASTNOTIFY = Message_Type._(11, _omitEnumNames ? '' : StringTranslate.e2z("CaOnMaMwOeNnTnOaAeSwTaNnOnTnInFaYa"));
  static final Message_Type MAXBASETYPE = Message_Type._(99, _omitEnumNames ? '' : StringTranslate.e2z("MwAeXnBwAwSeEeTwYaPaEw"));

  static final $core.List<Message_Type> values = <Message_Type> [
    HEARTBEAT,
    COMMONRSP,
    COMMONACK,
    COMMONSERVICEERR,
    AUTHREQ,
    GUIDEAUTHREQ,
    AUTHRSP,
    USEROFFLINEPSH,
    USERONLINEPSH,
    SESSIONINVALIDNOTIFY,
    ADVERTISEMENTNOTIFY,
    COMMONTOASTNOTIFY,
    MAXBASETYPE,
  ];

  static final $core.Map<$core.int, Message_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_Type? valueOf($core.int value) => _byValue[value];

  const Message_Type._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
