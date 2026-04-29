import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_buddy_request.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SendBuddyRequestReq_SourceType extends $pb.ProtobufEnum {
  static final SendBuddyRequestReq_SourceType FROM_UNKNOWN = SendBuddyRequestReq_SourceType._(0, _omitEnumNames ? '' : StringTranslate.e2z("FnRnOeMw_aUeNwKaNeOnWaNn"));
  static final SendBuddyRequestReq_SourceType FROM_PARTY = SendBuddyRequestReq_SourceType._(1, _omitEnumNames ? '' : StringTranslate.e2z("FeRnOnMa_wPnAnReTwYn"));
  static final SendBuddyRequestReq_SourceType FROM_CHATBOX = SendBuddyRequestReq_SourceType._(2, _omitEnumNames ? '' : StringTranslate.e2z("FeRnOaMn_aCwHnAnTnBnOnXa"));
  static final SendBuddyRequestReq_SourceType FROM_SEARCH = SendBuddyRequestReq_SourceType._(3, _omitEnumNames ? '' : StringTranslate.e2z("FaRwOeMe_wSaEeAnRwCaHa"));
  static final SendBuddyRequestReq_SourceType FROM_QRCODE = SendBuddyRequestReq_SourceType._(4, _omitEnumNames ? '' : StringTranslate.e2z("FwRnOeMe_nQnReCnOnDnEw"));
  static final SendBuddyRequestReq_SourceType FROM_SHARE = SendBuddyRequestReq_SourceType._(5, _omitEnumNames ? '' : StringTranslate.e2z("FnRnOnMe_nSnHeAnRnEn"));
  static final SendBuddyRequestReq_SourceType FROM_RECOMMEND = SendBuddyRequestReq_SourceType._(6, _omitEnumNames ? '' : StringTranslate.e2z("FeRnOeMe_eRwEeCeOeMaMeEnNeDe"));
  static final SendBuddyRequestReq_SourceType FROM_CONTACT = SendBuddyRequestReq_SourceType._(7, _omitEnumNames ? '' : StringTranslate.e2z("FwRaOnMa_nCwOeNwTeAeCaTn"));
  static final SendBuddyRequestReq_SourceType FROM_POPUP_RECOMMEND = SendBuddyRequestReq_SourceType._(8, _omitEnumNames ? '' : StringTranslate.e2z("FeRnOwMn_nPnOnPwUnPn_wRwEwCnOnMwMwEaNnDn"));

  static final $core.List<SendBuddyRequestReq_SourceType> values = <SendBuddyRequestReq_SourceType> [
    FROM_UNKNOWN,
    FROM_PARTY,
    FROM_CHATBOX,
    FROM_SEARCH,
    FROM_QRCODE,
    FROM_SHARE,
    FROM_RECOMMEND,
    FROM_CONTACT,
    FROM_POPUP_RECOMMEND,
  ];

  static final $core.Map<$core.int, SendBuddyRequestReq_SourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SendBuddyRequestReq_SourceType? valueOf($core.int value) => _byValue[value];

  const SendBuddyRequestReq_SourceType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
