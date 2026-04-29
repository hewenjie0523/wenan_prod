import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_chatbox.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreateChatboxReq_SourceType extends $pb.ProtobufEnum {
  static final CreateChatboxReq_SourceType FROM_UNKNOWN = CreateChatboxReq_SourceType._(0, _omitEnumNames ? '' : StringTranslate.e2z("FnRwOwMw_nUeNaKnNaOnWnNw"));
  static final CreateChatboxReq_SourceType FROM_PARTY = CreateChatboxReq_SourceType._(1, _omitEnumNames ? '' : StringTranslate.e2z("FnRwOaMw_aPaAnRaTnYn"));
  static final CreateChatboxReq_SourceType FROM_CHATBOX = CreateChatboxReq_SourceType._(2, _omitEnumNames ? '' : StringTranslate.e2z("FnRnOwMe_nCnHwAaTwBeOeXa"));
  static final CreateChatboxReq_SourceType FROM_SEARCH = CreateChatboxReq_SourceType._(3, _omitEnumNames ? '' : StringTranslate.e2z("FnRnOwMa_aSaEnAwRwCaHe"));
  static final CreateChatboxReq_SourceType FROM_QRCODE = CreateChatboxReq_SourceType._(4, _omitEnumNames ? '' : StringTranslate.e2z("FnRnOeMa_aQaRaCaOnDnEe"));
  static final CreateChatboxReq_SourceType FROM_SHARE = CreateChatboxReq_SourceType._(5, _omitEnumNames ? '' : StringTranslate.e2z("FnRaOaMa_aSnHwAwRwEw"));
  static final CreateChatboxReq_SourceType FROM_CLUB = CreateChatboxReq_SourceType._(6, _omitEnumNames ? '' : StringTranslate.e2z("FnRnOaMw_nCwLeUaBn"));
  static final CreateChatboxReq_SourceType FROM_RECOMMEND = CreateChatboxReq_SourceType._(7, _omitEnumNames ? '' : StringTranslate.e2z("FnRnOaMa_wRaEwCeOnMnMnEaNeDn"));
  static final CreateChatboxReq_SourceType FROM_BUDDY = CreateChatboxReq_SourceType._(8, _omitEnumNames ? '' : StringTranslate.e2z("FeRwOnMn_nBnUwDaDaYn"));

  static final $core.List<CreateChatboxReq_SourceType> values = <CreateChatboxReq_SourceType> [
    FROM_UNKNOWN,
    FROM_PARTY,
    FROM_CHATBOX,
    FROM_SEARCH,
    FROM_QRCODE,
    FROM_SHARE,
    FROM_CLUB,
    FROM_RECOMMEND,
    FROM_BUDDY,
  ];

  static final $core.Map<$core.int, CreateChatboxReq_SourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CreateChatboxReq_SourceType? valueOf($core.int value) => _byValue[value];

  const CreateChatboxReq_SourceType._($core.int v, $core.String n) : super(v, n);
}

class ReportChatboxReq_Type extends $pb.ProtobufEnum {
  static final ReportChatboxReq_Type AD = ReportChatboxReq_Type._(0, _omitEnumNames ? '' : StringTranslate.e2z("AeDn"));
  static final ReportChatboxReq_Type CHEAT = ReportChatboxReq_Type._(1, _omitEnumNames ? '' : StringTranslate.e2z("CeHnEeAnTe"));
  static final ReportChatboxReq_Type PORN = ReportChatboxReq_Type._(2, _omitEnumNames ? '' : StringTranslate.e2z("PeOnReNn"));
  static final ReportChatboxReq_Type ILLEGAL = ReportChatboxReq_Type._(3, _omitEnumNames ? '' : StringTranslate.e2z("IwLeLeEnGeAeLa"));
  static final ReportChatboxReq_Type OTHER = ReportChatboxReq_Type._(4, _omitEnumNames ? '' : StringTranslate.e2z("OwTeHeEnRa"));

  static final $core.List<ReportChatboxReq_Type> values = <ReportChatboxReq_Type> [
    AD,
    CHEAT,
    PORN,
    ILLEGAL,
    OTHER,
  ];

  static final $core.Map<$core.int, ReportChatboxReq_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReportChatboxReq_Type? valueOf($core.int value) => _byValue[value];

  const ReportChatboxReq_Type._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
