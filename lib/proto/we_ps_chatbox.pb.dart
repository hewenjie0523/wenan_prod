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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/any.pb.dart' as $0;
import 'we_ps_chatbox.pbenum.dart';
import 'we_ps_im_object.pb.dart' as $3;
import 'we_ps_im_object.pbenum.dart' as $3;

export 'we_ps_chatbox.pbenum.dart';

class CreateChatboxReq extends $pb.GeneratedMessage {
  factory CreateChatboxReq() => create();
  CreateChatboxReq._() : super();
  factory CreateChatboxReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatboxReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CwrwenawtneaCehnawtnbnoexwRwenqa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoamn.nanuwvwceheante.npnraoatnoe.ninma")), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("maeemebaeerwIadnsn"), $pb.PbFieldType.KU6)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("laansntaCwheaatwbnonxeKneayn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<CreateChatboxReq_SourceType>(3, _omitFieldNames ? '' : StringTranslate.e2z("saonuarncneeTayapnew"), $pb.PbFieldType.OE, defaultOrMaker: CreateChatboxReq_SourceType.FROM_UNKNOWN, valueOf: CreateChatboxReq_SourceType.valueOf, enumValues: CreateChatboxReq_SourceType.values)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("feraoameCeheawtwbwowxwIwdn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(5, _omitFieldNames ? '' : StringTranslate.e2z("iesePwunbeleiacn"))
    ..aOS(6, _omitFieldNames ? '' : StringTranslate.e2z("nnawmwea"))
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : StringTranslate.e2z("envnennnteTainmnee"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$3.Chatbox_EventFrequency>(8, _omitFieldNames ? '' : StringTranslate.e2z("envnewnntwFaraeaqnuwennacnyw"), $pb.PbFieldType.OE, defaultOrMaker: $3.Chatbox_EventFrequency.NEVER, valueOf: $3.Chatbox_EventFrequency.valueOf, enumValues: $3.Chatbox_EventFrequency.values)
    ..p<$fixnum.Int64>(9, _omitFieldNames ? '' : StringTranslate.e2z("ceawtnengaoaraywIednsn"), $pb.PbFieldType.KU6)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : StringTranslate.e2z("cnowvnearwIedw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(11, _omitFieldNames ? '' : StringTranslate.e2z("dnewsncnreinpeteieoana"))
    ..aOM<$0.Any>(12, _omitFieldNames ? '' : StringTranslate.e2z("enxntaeanwsnieownwsn"), subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatboxReq clone() => CreateChatboxReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatboxReq copyWith(void Function(CreateChatboxReq) updates) => super.copyWith((message) => updates(message as CreateChatboxReq)) as CreateChatboxReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatboxReq create() => CreateChatboxReq._();
  CreateChatboxReq createEmptyInstance() => create();
  static $pb.PbList<CreateChatboxReq> createRepeated() => $pb.PbList<CreateChatboxReq>();
  @$core.pragma('dart2js:noInline')
  static CreateChatboxReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatboxReq>(create);
  static CreateChatboxReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get memberIds => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastChatboxKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastChatboxKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastChatboxKey() => clearField(2);

  @$pb.TagNumber(3)
  CreateChatboxReq_SourceType get sourceType => $_getN(2);
  @$pb.TagNumber(3)
  set sourceType(CreateChatboxReq_SourceType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSourceType() => $_has(2);
  @$pb.TagNumber(3)
  void clearSourceType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get fromChatboxId => $_getI64(3);
  @$pb.TagNumber(4)
  set fromChatboxId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFromChatboxId() => $_has(3);
  @$pb.TagNumber(4)
  void clearFromChatboxId() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isPublic => $_getBF(4);
  @$pb.TagNumber(5)
  set isPublic($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsPublic() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsPublic() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get name => $_getSZ(5);
  @$pb.TagNumber(6)
  set name($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasName() => $_has(5);
  @$pb.TagNumber(6)
  void clearName() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get eventTime => $_getI64(6);
  @$pb.TagNumber(7)
  set eventTime($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEventTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearEventTime() => clearField(7);

  @$pb.TagNumber(8)
  $3.Chatbox_EventFrequency get eventFrequency => $_getN(7);
  @$pb.TagNumber(8)
  set eventFrequency($3.Chatbox_EventFrequency v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasEventFrequency() => $_has(7);
  @$pb.TagNumber(8)
  void clearEventFrequency() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$fixnum.Int64> get categoryIds => $_getList(8);

  @$pb.TagNumber(10)
  $fixnum.Int64 get coverId => $_getI64(9);
  @$pb.TagNumber(10)
  set coverId($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCoverId() => $_has(9);
  @$pb.TagNumber(10)
  void clearCoverId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get description => $_getSZ(10);
  @$pb.TagNumber(11)
  set description($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDescription() => $_has(10);
  @$pb.TagNumber(11)
  void clearDescription() => clearField(11);

  @$pb.TagNumber(12)
  $0.Any get extensions => $_getN(11);
  @$pb.TagNumber(12)
  set extensions($0.Any v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasExtensions() => $_has(11);
  @$pb.TagNumber(12)
  void clearExtensions() => clearField(12);
  @$pb.TagNumber(12)
  $0.Any ensureExtensions() => $_ensure(11);
}

class CreateChatboxRsp extends $pb.GeneratedMessage {
  factory CreateChatboxRsp() => create();
  CreateChatboxRsp._() : super();
  factory CreateChatboxRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatboxRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnreenawtwenCnheaetabaonxnRnsepa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caoemn.wanuwvacnhaante.npnreowtnon.ninmn")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnoadnen"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mnsegw"))
    ..aOM<$3.Chatbox>(3, _omitFieldNames ? '' : StringTranslate.e2z("cehaaetebwonxe"), subBuilder: $3.Chatbox.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatboxRsp clone() => CreateChatboxRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatboxRsp copyWith(void Function(CreateChatboxRsp) updates) => super.copyWith((message) => updates(message as CreateChatboxRsp)) as CreateChatboxRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatboxRsp create() => CreateChatboxRsp._();
  CreateChatboxRsp createEmptyInstance() => create();
  static $pb.PbList<CreateChatboxRsp> createRepeated() => $pb.PbList<CreateChatboxRsp>();
  @$core.pragma('dart2js:noInline')
  static CreateChatboxRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatboxRsp>(create);
  static CreateChatboxRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $3.Chatbox get chatbox => $_getN(2);
  @$pb.TagNumber(3)
  set chatbox($3.Chatbox v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatbox() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatbox() => clearField(3);
  @$pb.TagNumber(3)
  $3.Chatbox ensureChatbox() => $_ensure(2);
}

class SetChatboxNameReq extends $pb.GeneratedMessage {
  factory SetChatboxNameReq() => create();
  SetChatboxNameReq._() : super();
  factory SetChatboxNameReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetChatboxNameReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SaewtnCahaantwbnowxnNeanmaewRnewqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceoamw.wanuavncwheaetn.eperaoetnow.einma")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnheaatabeonxaIwda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("neaemaew"))
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("laansnteCehnaetnbaoexnKaenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetChatboxNameReq clone() => SetChatboxNameReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetChatboxNameReq copyWith(void Function(SetChatboxNameReq) updates) => super.copyWith((message) => updates(message as SetChatboxNameReq)) as SetChatboxNameReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetChatboxNameReq create() => SetChatboxNameReq._();
  SetChatboxNameReq createEmptyInstance() => create();
  static $pb.PbList<SetChatboxNameReq> createRepeated() => $pb.PbList<SetChatboxNameReq>();
  @$core.pragma('dart2js:noInline')
  static SetChatboxNameReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetChatboxNameReq>(create);
  static SetChatboxNameReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastChatboxKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChatboxKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChatboxKey() => clearField(3);
}

class SetChatboxDescReq extends $pb.GeneratedMessage {
  factory SetChatboxDescReq() => create();
  SetChatboxDescReq._() : super();
  factory SetChatboxDescReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetChatboxDescReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SneataCnhwaetnbaowxaDnensncaRneeqe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caoama.eaauevncwheantn.apwrwoatnoa.eiema")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnheantnbeonxwInda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("dwewsncwrainpntniaownn"))
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("leaesntaCeheantnbeoexaKeenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetChatboxDescReq clone() => SetChatboxDescReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetChatboxDescReq copyWith(void Function(SetChatboxDescReq) updates) => super.copyWith((message) => updates(message as SetChatboxDescReq)) as SetChatboxDescReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetChatboxDescReq create() => SetChatboxDescReq._();
  SetChatboxDescReq createEmptyInstance() => create();
  static $pb.PbList<SetChatboxDescReq> createRepeated() => $pb.PbList<SetChatboxDescReq>();
  @$core.pragma('dart2js:noInline')
  static SetChatboxDescReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetChatboxDescReq>(create);
  static SetChatboxDescReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastChatboxKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChatboxKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChatboxKey() => clearField(3);
}

class SetChatboxCoverReq extends $pb.GeneratedMessage {
  factory SetChatboxCoverReq() => create();
  SetChatboxCoverReq._() : super();
  factory SetChatboxCoverReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetChatboxCoverReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SwenteCnhnantabnowxaCeowvneerwRwenqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceonma.nanunvncahnantw.npnreontaon.niame")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnheawtebnonxnIada"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("iwmaaageeaIwdw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("inmnaegaeeUarnln"))
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("lwaasnteCnhaawtabeoexaKneayw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetChatboxCoverReq clone() => SetChatboxCoverReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetChatboxCoverReq copyWith(void Function(SetChatboxCoverReq) updates) => super.copyWith((message) => updates(message as SetChatboxCoverReq)) as SetChatboxCoverReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetChatboxCoverReq create() => SetChatboxCoverReq._();
  SetChatboxCoverReq createEmptyInstance() => create();
  static $pb.PbList<SetChatboxCoverReq> createRepeated() => $pb.PbList<SetChatboxCoverReq>();
  @$core.pragma('dart2js:noInline')
  static SetChatboxCoverReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetChatboxCoverReq>(create);
  static SetChatboxCoverReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get imageId => $_getI64(1);
  @$pb.TagNumber(2)
  set imageId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImageId() => $_has(1);
  @$pb.TagNumber(2)
  void clearImageId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imageUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imageUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImageUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImageUrl() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastChatboxKey => $_getI64(3);
  @$pb.TagNumber(4)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastChatboxKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastChatboxKey() => clearField(4);
}

class AddChatboxMemberReq extends $pb.GeneratedMessage {
  factory AddChatboxMemberReq() => create();
  AddChatboxMemberReq._() : super();
  factory AddChatboxMemberReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddChatboxMemberReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("AedadaCwheaatabeonxaMweamwbeeernRwenqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwoame.eawuevacnhaaatn.apwrnontnoe.wiwme")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnhnaatebnoaxaIede"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("meenmnbnenraIednsa"), $pb.PbFieldType.KU6)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("lnansnteCehnantabwonxwKeeaya"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddChatboxMemberReq clone() => AddChatboxMemberReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddChatboxMemberReq copyWith(void Function(AddChatboxMemberReq) updates) => super.copyWith((message) => updates(message as AddChatboxMemberReq)) as AddChatboxMemberReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddChatboxMemberReq create() => AddChatboxMemberReq._();
  AddChatboxMemberReq createEmptyInstance() => create();
  static $pb.PbList<AddChatboxMemberReq> createRepeated() => $pb.PbList<AddChatboxMemberReq>();
  @$core.pragma('dart2js:noInline')
  static AddChatboxMemberReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddChatboxMemberReq>(create);
  static AddChatboxMemberReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$fixnum.Int64> get memberIds => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastChatboxKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChatboxKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChatboxKey() => clearField(3);
}

class RemoveChatboxMemberReq extends $pb.GeneratedMessage {
  factory RemoveChatboxMemberReq() => create();
  RemoveChatboxMemberReq._() : super();
  factory RemoveChatboxMemberReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveChatboxMemberReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RnenmeonvnenCaheawtnbaowxnMeenmabwewrnRneeqa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caoeme.waaunvacwhnante.npnrnontnoa.wiama")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cwhnantwbaoexwIwdn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("mweemnbnearaIndasn"), $pb.PbFieldType.KU6)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("laaeswteCehaaetnbaoexnKaenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveChatboxMemberReq clone() => RemoveChatboxMemberReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveChatboxMemberReq copyWith(void Function(RemoveChatboxMemberReq) updates) => super.copyWith((message) => updates(message as RemoveChatboxMemberReq)) as RemoveChatboxMemberReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveChatboxMemberReq create() => RemoveChatboxMemberReq._();
  RemoveChatboxMemberReq createEmptyInstance() => create();
  static $pb.PbList<RemoveChatboxMemberReq> createRepeated() => $pb.PbList<RemoveChatboxMemberReq>();
  @$core.pragma('dart2js:noInline')
  static RemoveChatboxMemberReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveChatboxMemberReq>(create);
  static RemoveChatboxMemberReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$fixnum.Int64> get memberIds => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastChatboxKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChatboxKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChatboxKey() => clearField(3);
}

class StarChaboxReq extends $pb.GeneratedMessage {
  factory StarChaboxReq() => create();
  StarChaboxReq._() : super();
  factory StarChaboxReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StarChaboxReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SetwanrnCnhwawbwonxaReenqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoemn.waauevecahnawtw.npwrwontwon.wiwmn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cahnantnbnonxwIadw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("oapeenreantainonnn"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("laaesntnCeheaetnbnoexeKnewyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StarChaboxReq clone() => StarChaboxReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StarChaboxReq copyWith(void Function(StarChaboxReq) updates) => super.copyWith((message) => updates(message as StarChaboxReq)) as StarChaboxReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StarChaboxReq create() => StarChaboxReq._();
  StarChaboxReq createEmptyInstance() => create();
  static $pb.PbList<StarChaboxReq> createRepeated() => $pb.PbList<StarChaboxReq>();
  @$core.pragma('dart2js:noInline')
  static StarChaboxReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StarChaboxReq>(create);
  static StarChaboxReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get operation => $_getIZ(1);
  @$pb.TagNumber(2)
  set operation($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastChatboxKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChatboxKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChatboxKey() => clearField(3);
}

class MuteChatboxReq extends $pb.GeneratedMessage {
  factory MuteChatboxReq() => create();
  MuteChatboxReq._() : super();
  factory MuteChatboxReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MuteChatboxReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("MaunteenCnhnaetnbeowxnRaewqa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caoamn.eaauwvaceheaeta.wparwontaon.niwmw")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cwhwaatnbeowxaIedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("onpaenreantnieonnn"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("lnaeswtaCahwaatnbnoexwKnenyw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MuteChatboxReq clone() => MuteChatboxReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MuteChatboxReq copyWith(void Function(MuteChatboxReq) updates) => super.copyWith((message) => updates(message as MuteChatboxReq)) as MuteChatboxReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MuteChatboxReq create() => MuteChatboxReq._();
  MuteChatboxReq createEmptyInstance() => create();
  static $pb.PbList<MuteChatboxReq> createRepeated() => $pb.PbList<MuteChatboxReq>();
  @$core.pragma('dart2js:noInline')
  static MuteChatboxReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MuteChatboxReq>(create);
  static MuteChatboxReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get operation => $_getIZ(1);
  @$pb.TagNumber(2)
  set operation($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastChatboxKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChatboxKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChatboxKey() => clearField(3);
}

class RemoveChatboxReq extends $pb.GeneratedMessage {
  factory RemoveChatboxReq() => create();
  RemoveChatboxReq._() : super();
  factory RemoveChatboxReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveChatboxReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("ReewmnonveenCeheaetwbeonxaReenqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoamw.nanunvecnhnantn.aparaontnon.winmn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnhnaetnbaonxeIndn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("laansetnCnhwawtebaoaxwKnenye"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("cahwantabnonxnIednsa"), $pb.PbFieldType.KU6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveChatboxReq clone() => RemoveChatboxReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveChatboxReq copyWith(void Function(RemoveChatboxReq) updates) => super.copyWith((message) => updates(message as RemoveChatboxReq)) as RemoveChatboxReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveChatboxReq create() => RemoveChatboxReq._();
  RemoveChatboxReq createEmptyInstance() => create();
  static $pb.PbList<RemoveChatboxReq> createRepeated() => $pb.PbList<RemoveChatboxReq>();
  @$core.pragma('dart2js:noInline')
  static RemoveChatboxReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveChatboxReq>(create);
  static RemoveChatboxReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastChatboxKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastChatboxKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastChatboxKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$fixnum.Int64> get chatboxIds => $_getList(2);
}

class ExitChatboxReq extends $pb.GeneratedMessage {
  factory ExitChatboxReq() => create();
  ExitChatboxReq._() : super();
  factory ExitChatboxReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExitChatboxReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("EwxwiwtnCnhnaetebwonxaRnenqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwowmn.nanunvncwhnantn.apnrnoatnon.eiama")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnhnawtnbaoaxnIwdn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("lnansntaCehnawtwbnonxnKaenyw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExitChatboxReq clone() => ExitChatboxReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExitChatboxReq copyWith(void Function(ExitChatboxReq) updates) => super.copyWith((message) => updates(message as ExitChatboxReq)) as ExitChatboxReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExitChatboxReq create() => ExitChatboxReq._();
  ExitChatboxReq createEmptyInstance() => create();
  static $pb.PbList<ExitChatboxReq> createRepeated() => $pb.PbList<ExitChatboxReq>();
  @$core.pragma('dart2js:noInline')
  static ExitChatboxReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExitChatboxReq>(create);
  static ExitChatboxReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastChatboxKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastChatboxKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastChatboxKey() => clearField(2);
}

class ReportChatboxReq extends $pb.GeneratedMessage {
  factory ReportChatboxReq() => create();
  ReportChatboxReq._() : super();
  factory ReportChatboxReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportChatboxReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RneepnowrntnCwhaantnbwonxaRaeaqe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonme.aanuavncnheantw.wpareoeteon.ninmn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cwhaantebwowxeIwde"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<ReportChatboxReq_Type>(2, _omitFieldNames ? '' : StringTranslate.e2z("twynpaew"), $pb.PbFieldType.OE, defaultOrMaker: ReportChatboxReq_Type.AD, valueOf: ReportChatboxReq_Type.valueOf, enumValues: ReportChatboxReq_Type.values)
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("rwenaasaownn"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportChatboxReq clone() => ReportChatboxReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportChatboxReq copyWith(void Function(ReportChatboxReq) updates) => super.copyWith((message) => updates(message as ReportChatboxReq)) as ReportChatboxReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportChatboxReq create() => ReportChatboxReq._();
  ReportChatboxReq createEmptyInstance() => create();
  static $pb.PbList<ReportChatboxReq> createRepeated() => $pb.PbList<ReportChatboxReq>();
  @$core.pragma('dart2js:noInline')
  static ReportChatboxReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportChatboxReq>(create);
  static ReportChatboxReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  ReportChatboxReq_Type get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(ReportChatboxReq_Type v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => clearField(3);
}

class JoinChatboxReq extends $pb.GeneratedMessage {
  factory JoinChatboxReq() => create();
  JoinChatboxReq._() : super();
  factory JoinChatboxReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinChatboxReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("JnowienwCahaaatebaonxaRwewqe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwoamn.nanuwvecnhaaate.npwrnontnoa.niame")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cehaaetabnonxaIada"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("vnenrniwfwywCeowdnee"))
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("lwanswtwSannawpeKaewyw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("lnaesetaCaheaetnbeoexaKwenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(5, _omitFieldNames ? '' : StringTranslate.e2z("reenaesaowne"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinChatboxReq clone() => JoinChatboxReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinChatboxReq copyWith(void Function(JoinChatboxReq) updates) => super.copyWith((message) => updates(message as JoinChatboxReq)) as JoinChatboxReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinChatboxReq create() => JoinChatboxReq._();
  JoinChatboxReq createEmptyInstance() => create();
  static $pb.PbList<JoinChatboxReq> createRepeated() => $pb.PbList<JoinChatboxReq>();
  @$core.pragma('dart2js:noInline')
  static JoinChatboxReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinChatboxReq>(create);
  static JoinChatboxReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get verifyCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set verifyCode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVerifyCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearVerifyCode() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastSnapKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastSnapKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastSnapKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastSnapKey() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastChatboxKey => $_getI64(3);
  @$pb.TagNumber(4)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastChatboxKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastChatboxKey() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get reason => $_getSZ(4);
  @$pb.TagNumber(5)
  set reason($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearReason() => clearField(5);
}

class JoinChatboxRsp extends $pb.GeneratedMessage {
  factory JoinChatboxRsp() => create();
  JoinChatboxRsp._() : super();
  factory JoinChatboxRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory JoinChatboxRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("JwoainnaCehaantebwonxeRasepw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwonme.eanunvacwhaaatn.epnreontwoe.niwmn")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("caoednee"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mesegw"))
    ..aOM<$3.Chatbox>(3, _omitFieldNames ? '' : StringTranslate.e2z("cwhnaetnbeoaxn"), subBuilder: $3.Chatbox.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  JoinChatboxRsp clone() => JoinChatboxRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  JoinChatboxRsp copyWith(void Function(JoinChatboxRsp) updates) => super.copyWith((message) => updates(message as JoinChatboxRsp)) as JoinChatboxRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JoinChatboxRsp create() => JoinChatboxRsp._();
  JoinChatboxRsp createEmptyInstance() => create();
  static $pb.PbList<JoinChatboxRsp> createRepeated() => $pb.PbList<JoinChatboxRsp>();
  @$core.pragma('dart2js:noInline')
  static JoinChatboxRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<JoinChatboxRsp>(create);
  static JoinChatboxRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $3.Chatbox get chatbox => $_getN(2);
  @$pb.TagNumber(3)
  set chatbox($3.Chatbox v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatbox() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatbox() => clearField(3);
  @$pb.TagNumber(3)
  $3.Chatbox ensureChatbox() => $_ensure(2);
}

class UpdateChatboxReadedStatusReq extends $pb.GeneratedMessage {
  factory UpdateChatboxReadedStatusReq() => create();
  UpdateChatboxReadedStatusReq._() : super();
  factory UpdateChatboxReadedStatusReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatboxReadedStatusReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("UnpndaantnenCehnantnbnoaxaRnewaedwendaSntwanteunseRnenqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caowmn.eanuavncnhaantn.npnrwowtnon.niwmn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnhaawtabaowxaIndw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("lnawsntwSannaepnKnenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("laansntnCehnantnbnowxnKweayn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("cahnaatebwonxeIndase"), $pb.PbFieldType.KU6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatboxReadedStatusReq clone() => UpdateChatboxReadedStatusReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatboxReadedStatusReq copyWith(void Function(UpdateChatboxReadedStatusReq) updates) => super.copyWith((message) => updates(message as UpdateChatboxReadedStatusReq)) as UpdateChatboxReadedStatusReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatboxReadedStatusReq create() => UpdateChatboxReadedStatusReq._();
  UpdateChatboxReadedStatusReq createEmptyInstance() => create();
  static $pb.PbList<UpdateChatboxReadedStatusReq> createRepeated() => $pb.PbList<UpdateChatboxReadedStatusReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatboxReadedStatusReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatboxReadedStatusReq>(create);
  static UpdateChatboxReadedStatusReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastSnapKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastSnapKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastSnapKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastSnapKey() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastChatboxKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChatboxKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChatboxKey() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$fixnum.Int64> get chatboxIds => $_getList(3);
}

class UpdateChatboxPublicSettingReq extends $pb.GeneratedMessage {
  factory UpdateChatboxPublicSettingReq() => create();
  UpdateChatboxPublicSettingReq._() : super();
  factory UpdateChatboxPublicSettingReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatboxPublicSettingReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("UnpedaaetnewCahnantebnowxePnunbnlnieceSaewtntnienngeReenqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceoame.naaunvncwhnawtw.npnraowtnoe.ainma")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cehaantnbeoexaIndn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("leansateCaheawtebeonxeKnenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(3, _omitFieldNames ? '' : StringTranslate.e2z("iesnPauabnlwincn"))
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("eevwennwtaTwiamnee"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<$3.Chatbox_EventFrequency>(5, _omitFieldNames ? '' : StringTranslate.e2z("envneanntnFaraewqeunewnncwye"), $pb.PbFieldType.OE, defaultOrMaker: $3.Chatbox_EventFrequency.NEVER, valueOf: $3.Chatbox_EventFrequency.valueOf, enumValues: $3.Chatbox_EventFrequency.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatboxPublicSettingReq clone() => UpdateChatboxPublicSettingReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatboxPublicSettingReq copyWith(void Function(UpdateChatboxPublicSettingReq) updates) => super.copyWith((message) => updates(message as UpdateChatboxPublicSettingReq)) as UpdateChatboxPublicSettingReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatboxPublicSettingReq create() => UpdateChatboxPublicSettingReq._();
  UpdateChatboxPublicSettingReq createEmptyInstance() => create();
  static $pb.PbList<UpdateChatboxPublicSettingReq> createRepeated() => $pb.PbList<UpdateChatboxPublicSettingReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatboxPublicSettingReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatboxPublicSettingReq>(create);
  static UpdateChatboxPublicSettingReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastChatboxKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastChatboxKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastChatboxKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isPublic => $_getBF(2);
  @$pb.TagNumber(3)
  set isPublic($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsPublic() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsPublic() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get eventTime => $_getI64(3);
  @$pb.TagNumber(4)
  set eventTime($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEventTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventTime() => clearField(4);

  @$pb.TagNumber(5)
  $3.Chatbox_EventFrequency get eventFrequency => $_getN(4);
  @$pb.TagNumber(5)
  set eventFrequency($3.Chatbox_EventFrequency v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasEventFrequency() => $_has(4);
  @$pb.TagNumber(5)
  void clearEventFrequency() => clearField(5);
}

class GetChatboxInfoReq extends $pb.GeneratedMessage {
  factory GetChatboxInfoReq() => create();
  GetChatboxInfoReq._() : super();
  factory GetChatboxInfoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatboxInfoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("GneataCeheantnbnoaxnIanwfnoeRwenqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwoamn.nawunvacnhaaatn.epnreoeteon.eiemn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cehnawtebnoexeIedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("lwaeswtaCehaaetnbnonxeKeenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatboxInfoReq clone() => GetChatboxInfoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatboxInfoReq copyWith(void Function(GetChatboxInfoReq) updates) => super.copyWith((message) => updates(message as GetChatboxInfoReq)) as GetChatboxInfoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatboxInfoReq create() => GetChatboxInfoReq._();
  GetChatboxInfoReq createEmptyInstance() => create();
  static $pb.PbList<GetChatboxInfoReq> createRepeated() => $pb.PbList<GetChatboxInfoReq>();
  @$core.pragma('dart2js:noInline')
  static GetChatboxInfoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatboxInfoReq>(create);
  static GetChatboxInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastChatboxKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastChatboxKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastChatboxKey() => clearField(2);
}

class GetChatboxInfoRsp extends $pb.GeneratedMessage {
  factory GetChatboxInfoRsp() => create();
  GetChatboxInfoRsp._() : super();
  factory GetChatboxInfoRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatboxInfoRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("GnewtaCnhwantnbeonxeIwnnfnoeRnsepa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caowmn.nanunvncahnantn.aperaontwoe.ninma")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnondnen"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mnswge"))
    ..aOM<$3.Chatbox>(3, _omitFieldNames ? '' : StringTranslate.e2z("cahnantebnowxnIwnefnon"), subBuilder: $3.Chatbox.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatboxInfoRsp clone() => GetChatboxInfoRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatboxInfoRsp copyWith(void Function(GetChatboxInfoRsp) updates) => super.copyWith((message) => updates(message as GetChatboxInfoRsp)) as GetChatboxInfoRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatboxInfoRsp create() => GetChatboxInfoRsp._();
  GetChatboxInfoRsp createEmptyInstance() => create();
  static $pb.PbList<GetChatboxInfoRsp> createRepeated() => $pb.PbList<GetChatboxInfoRsp>();
  @$core.pragma('dart2js:noInline')
  static GetChatboxInfoRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatboxInfoRsp>(create);
  static GetChatboxInfoRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $3.Chatbox get chatboxInfo => $_getN(2);
  @$pb.TagNumber(3)
  set chatboxInfo($3.Chatbox v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatboxInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatboxInfo() => clearField(3);
  @$pb.TagNumber(3)
  $3.Chatbox ensureChatboxInfo() => $_ensure(2);
}

class UpdateChatboxCategoryReq extends $pb.GeneratedMessage {
  factory UpdateChatboxCategoryReq() => create();
  UpdateChatboxCategoryReq._() : super();
  factory UpdateChatboxCategoryReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatboxCategoryReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("UnpndwawteenCnhnaatwbaoexnCnantaewgaoereywRneeqe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoame.naauwvwcnhaawtn.eparnoatnoe.ainmw")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnhaantebnoexnIndn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..p<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("ceawtnengnonrnyaIwdesa"), $pb.PbFieldType.KU6)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("laawseteCwhwantabeonxaKnenya"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatboxCategoryReq clone() => UpdateChatboxCategoryReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatboxCategoryReq copyWith(void Function(UpdateChatboxCategoryReq) updates) => super.copyWith((message) => updates(message as UpdateChatboxCategoryReq)) as UpdateChatboxCategoryReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatboxCategoryReq create() => UpdateChatboxCategoryReq._();
  UpdateChatboxCategoryReq createEmptyInstance() => create();
  static $pb.PbList<UpdateChatboxCategoryReq> createRepeated() => $pb.PbList<UpdateChatboxCategoryReq>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatboxCategoryReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatboxCategoryReq>(create);
  static UpdateChatboxCategoryReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get chatboxId => $_getI64(0);
  @$pb.TagNumber(1)
  set chatboxId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatboxId() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatboxId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$fixnum.Int64> get categoryIds => $_getList(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastChatboxKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastChatboxKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastChatboxKey() => clearField(3);
}

class BatchGetChatboxInfoReq extends $pb.GeneratedMessage {
  factory BatchGetChatboxInfoReq() => create();
  BatchGetChatboxInfoReq._() : super();
  factory BatchGetChatboxInfoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BatchGetChatboxInfoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("BeawtncahwGaeeteCnhaantabnonxaInnnfnoeReenqe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caonmn.nawuavncehnanta.npnrnonteon.aiwmn")), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnheaatebnoexeIwdnsn"), $pb.PbFieldType.KU6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BatchGetChatboxInfoReq clone() => BatchGetChatboxInfoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BatchGetChatboxInfoReq copyWith(void Function(BatchGetChatboxInfoReq) updates) => super.copyWith((message) => updates(message as BatchGetChatboxInfoReq)) as BatchGetChatboxInfoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BatchGetChatboxInfoReq create() => BatchGetChatboxInfoReq._();
  BatchGetChatboxInfoReq createEmptyInstance() => create();
  static $pb.PbList<BatchGetChatboxInfoReq> createRepeated() => $pb.PbList<BatchGetChatboxInfoReq>();
  @$core.pragma('dart2js:noInline')
  static BatchGetChatboxInfoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BatchGetChatboxInfoReq>(create);
  static BatchGetChatboxInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get chatboxIds => $_getList(0);
}

class BatchGetChatboxInfoRsp extends $pb.GeneratedMessage {
  factory BatchGetChatboxInfoRsp() => create();
  BatchGetChatboxInfoRsp._() : super();
  factory BatchGetChatboxInfoRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BatchGetChatboxInfoRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("BnaatecehaGneetwCehnaatnbeonxaIennfwonRasepa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonme.aanuwvecehwawte.npareoatwow.ainmw")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("cwondwea"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mnswgn"))
    ..pc<$3.Chatbox>(3, _omitFieldNames ? '' : StringTranslate.e2z("cehnantabnoexeInnefaonse"), $pb.PbFieldType.PM, subBuilder: $3.Chatbox.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BatchGetChatboxInfoRsp clone() => BatchGetChatboxInfoRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BatchGetChatboxInfoRsp copyWith(void Function(BatchGetChatboxInfoRsp) updates) => super.copyWith((message) => updates(message as BatchGetChatboxInfoRsp)) as BatchGetChatboxInfoRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BatchGetChatboxInfoRsp create() => BatchGetChatboxInfoRsp._();
  BatchGetChatboxInfoRsp createEmptyInstance() => create();
  static $pb.PbList<BatchGetChatboxInfoRsp> createRepeated() => $pb.PbList<BatchGetChatboxInfoRsp>();
  @$core.pragma('dart2js:noInline')
  static BatchGetChatboxInfoRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BatchGetChatboxInfoRsp>(create);
  static BatchGetChatboxInfoRsp? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$3.Chatbox> get chatboxInfos => $_getList(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
