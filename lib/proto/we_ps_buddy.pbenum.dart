import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_buddy.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ReportUserReq_ReportType extends $pb.ProtobufEnum {
  static final ReportUserReq_ReportType AD = ReportUserReq_ReportType._(0, _omitEnumNames ? '' : StringTranslate.e2z("AwDw"));
  static final ReportUserReq_ReportType CHEAT = ReportUserReq_ReportType._(1, _omitEnumNames ? '' : StringTranslate.e2z("CwHeEnAaTn"));
  static final ReportUserReq_ReportType PORN = ReportUserReq_ReportType._(2, _omitEnumNames ? '' : StringTranslate.e2z("PaOnRwNn"));
  static final ReportUserReq_ReportType ILLEGAL = ReportUserReq_ReportType._(3, _omitEnumNames ? '' : StringTranslate.e2z("IeLeLnEaGnAnLa"));
  static final ReportUserReq_ReportType OTHER = ReportUserReq_ReportType._(4, _omitEnumNames ? '' : StringTranslate.e2z("OaTeHeEnRw"));

  static final $core.List<ReportUserReq_ReportType> values = <ReportUserReq_ReportType> [
    AD,
    CHEAT,
    PORN,
    ILLEGAL,
    OTHER,
  ];

  static final $core.Map<$core.int, ReportUserReq_ReportType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ReportUserReq_ReportType? valueOf($core.int value) => _byValue[value];

  const ReportUserReq_ReportType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
