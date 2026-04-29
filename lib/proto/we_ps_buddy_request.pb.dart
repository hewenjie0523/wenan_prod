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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'we_ps_buddy_request.pbenum.dart';

export 'we_ps_buddy_request.pbenum.dart';

class SendBuddyRequestReq extends $pb.GeneratedMessage {
  factory SendBuddyRequestReq() => create();
  SendBuddyRequestReq._() : super();
  factory SendBuddyRequestReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendBuddyRequestReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SeeanadaBnuedwdnyeRweaqnueeasatwRaeaqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoamn.nawuavecwhwantw.npnraontaoe.aiamn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("bwuadndeyaInda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("lwaasnteBnundadayeKnenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("lwansetnCwheawtwbnonxnKeewya"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<SendBuddyRequestReq_SourceType>(4, _omitFieldNames ? '' : StringTranslate.e2z("seoeuarnceeeTayepaew"), $pb.PbFieldType.OE, defaultOrMaker: SendBuddyRequestReq_SourceType.FROM_UNKNOWN, valueOf: SendBuddyRequestReq_SourceType.valueOf, enumValues: SendBuddyRequestReq_SourceType.values)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("fareonmeCahwaatnbwonxnIadw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("raenceowmnmnewnadwTeyepaen"), $pb.PbFieldType.OU3)
    ..aOS(7, _omitFieldNames ? '' : StringTranslate.e2z("mwsngn"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendBuddyRequestReq clone() => SendBuddyRequestReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendBuddyRequestReq copyWith(void Function(SendBuddyRequestReq) updates) => super.copyWith((message) => updates(message as SendBuddyRequestReq)) as SendBuddyRequestReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendBuddyRequestReq create() => SendBuddyRequestReq._();
  SendBuddyRequestReq createEmptyInstance() => create();
  static $pb.PbList<SendBuddyRequestReq> createRepeated() => $pb.PbList<SendBuddyRequestReq>();
  @$core.pragma('dart2js:noInline')
  static SendBuddyRequestReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendBuddyRequestReq>(create);
  static SendBuddyRequestReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get buddyId => $_getI64(0);
  @$pb.TagNumber(1)
  set buddyId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuddyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuddyId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastBuddyKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastBuddyKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastBuddyKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastBuddyKey() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastChatboxKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChatboxKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChatboxKey() => clearField(3);

  @$pb.TagNumber(4)
  SendBuddyRequestReq_SourceType get sourceType => $_getN(3);
  @$pb.TagNumber(4)
  set sourceType(SendBuddyRequestReq_SourceType v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSourceType() => $_has(3);
  @$pb.TagNumber(4)
  void clearSourceType() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get fromChatboxId => $_getI64(4);
  @$pb.TagNumber(5)
  set fromChatboxId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFromChatboxId() => $_has(4);
  @$pb.TagNumber(5)
  void clearFromChatboxId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get recommendType => $_getIZ(5);
  @$pb.TagNumber(6)
  set recommendType($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRecommendType() => $_has(5);
  @$pb.TagNumber(6)
  void clearRecommendType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get msg => $_getSZ(6);
  @$pb.TagNumber(7)
  set msg($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMsg() => $_has(6);
  @$pb.TagNumber(7)
  void clearMsg() => clearField(7);
}

class ConfirmBuddyRequestReq extends $pb.GeneratedMessage {
  factory ConfirmBuddyRequestReq() => create();
  ConfirmBuddyRequestReq._() : super();
  factory ConfirmBuddyRequestReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfirmBuddyRequestReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CeownefnieramnBauadndnyeRwenqnuwenseteRweaqe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceowme.aawuwvacnhnante.wpnraontaow.niemn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("beundadnynrwenqwuaewswtnIedw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("leawswtwBeuadedeyaKeeeyw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("laawsnteCnhaantnbnonxeKeeeyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("leaesntaBwuadwdnyeraewqauwenswtnKwenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfirmBuddyRequestReq clone() => ConfirmBuddyRequestReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfirmBuddyRequestReq copyWith(void Function(ConfirmBuddyRequestReq) updates) => super.copyWith((message) => updates(message as ConfirmBuddyRequestReq)) as ConfirmBuddyRequestReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfirmBuddyRequestReq create() => ConfirmBuddyRequestReq._();
  ConfirmBuddyRequestReq createEmptyInstance() => create();
  static $pb.PbList<ConfirmBuddyRequestReq> createRepeated() => $pb.PbList<ConfirmBuddyRequestReq>();
  @$core.pragma('dart2js:noInline')
  static ConfirmBuddyRequestReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfirmBuddyRequestReq>(create);
  static ConfirmBuddyRequestReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get buddyrequestId => $_getI64(0);
  @$pb.TagNumber(1)
  set buddyrequestId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuddyrequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuddyrequestId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastBuddyKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastBuddyKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastBuddyKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastBuddyKey() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastChatboxKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChatboxKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChatboxKey() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastBuddyrequestKey => $_getI64(3);
  @$pb.TagNumber(4)
  set lastBuddyrequestKey($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastBuddyrequestKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastBuddyrequestKey() => clearField(4);
}

class DeleteBuddyRequestReq extends $pb.GeneratedMessage {
  factory DeleteBuddyRequestReq() => create();
  DeleteBuddyRequestReq._() : super();
  factory DeleteBuddyRequestReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBuddyRequestReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("DaewlneeteenBeundndeywReewqnuweesntnRneaqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caoama.wanuevwceheaetn.apwrnoatnow.wiame")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("bnuedndwynraeeqnueensetaIada"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("leawsateBwuedndnywreeeqnuwewsataKeenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBuddyRequestReq clone() => DeleteBuddyRequestReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBuddyRequestReq copyWith(void Function(DeleteBuddyRequestReq) updates) => super.copyWith((message) => updates(message as DeleteBuddyRequestReq)) as DeleteBuddyRequestReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBuddyRequestReq create() => DeleteBuddyRequestReq._();
  DeleteBuddyRequestReq createEmptyInstance() => create();
  static $pb.PbList<DeleteBuddyRequestReq> createRepeated() => $pb.PbList<DeleteBuddyRequestReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteBuddyRequestReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBuddyRequestReq>(create);
  static DeleteBuddyRequestReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get buddyrequestId => $_getI64(0);
  @$pb.TagNumber(1)
  set buddyrequestId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuddyrequestId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuddyrequestId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastBuddyrequestKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastBuddyrequestKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastBuddyrequestKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastBuddyrequestKey() => clearField(2);
}

class SetAllBuddyRequestReadedReq extends $pb.GeneratedMessage {
  factory SetAllBuddyRequestReadedReq() => create();
  SetAllBuddyRequestReadedReq._() : super();
  factory SetAllBuddyRequestReadedReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetAllBuddyRequestReadedReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SneetnAwlnleBwundndeywRnewqnuaewsetwRnenaedwewdeRnenqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmw.aaauevncnhnantn.epnreoeteoe.niamw")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("leawseteBnundwdaynrneeqnunenswtnKeeeya"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetAllBuddyRequestReadedReq clone() => SetAllBuddyRequestReadedReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetAllBuddyRequestReadedReq copyWith(void Function(SetAllBuddyRequestReadedReq) updates) => super.copyWith((message) => updates(message as SetAllBuddyRequestReadedReq)) as SetAllBuddyRequestReadedReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetAllBuddyRequestReadedReq create() => SetAllBuddyRequestReadedReq._();
  SetAllBuddyRequestReadedReq createEmptyInstance() => create();
  static $pb.PbList<SetAllBuddyRequestReadedReq> createRepeated() => $pb.PbList<SetAllBuddyRequestReadedReq>();
  @$core.pragma('dart2js:noInline')
  static SetAllBuddyRequestReadedReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetAllBuddyRequestReadedReq>(create);
  static SetAllBuddyRequestReadedReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get lastBuddyrequestKey => $_getI64(0);
  @$pb.TagNumber(1)
  set lastBuddyrequestKey($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLastBuddyrequestKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearLastBuddyrequestKey() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
