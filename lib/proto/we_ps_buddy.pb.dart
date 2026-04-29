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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'we_ps_buddy.pbenum.dart';
import 'we_ps_contact.pb.dart' as $4;
import 'we_ps_object.pb.dart' as $2;

export 'we_ps_buddy.pbenum.dart';

class GetBuddyInfoReq extends $pb.GeneratedMessage {
  factory GetBuddyInfoReq() => create();
  GetBuddyInfoReq._() : super();
  factory GetBuddyInfoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBuddyInfoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("GwewtwBnundndwywIannfaoeRneeqa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmn.eanuevwcwhaaete.npernontwon.winmn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("bwuadwdwynInde"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBuddyInfoReq clone() => GetBuddyInfoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBuddyInfoReq copyWith(void Function(GetBuddyInfoReq) updates) => super.copyWith((message) => updates(message as GetBuddyInfoReq)) as GetBuddyInfoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBuddyInfoReq create() => GetBuddyInfoReq._();
  GetBuddyInfoReq createEmptyInstance() => create();
  static $pb.PbList<GetBuddyInfoReq> createRepeated() => $pb.PbList<GetBuddyInfoReq>();
  @$core.pragma('dart2js:noInline')
  static GetBuddyInfoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBuddyInfoReq>(create);
  static GetBuddyInfoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get buddyId => $_getI64(0);
  @$pb.TagNumber(1)
  set buddyId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuddyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuddyId() => clearField(1);
}

class GetBuddyInfoRsp extends $pb.GeneratedMessage {
  factory GetBuddyInfoRsp() => create();
  GetBuddyInfoRsp._() : super();
  factory GetBuddyInfoRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBuddyInfoRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("GwewteBwundndaynIwnnfwonRnswpn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoamw.aaeuavncwhnantn.epnrwoatnon.ninmn")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("cwondaee"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mnsngw"))
    ..aOM<$2.User>(3, _omitFieldNames ? '' : StringTranslate.e2z("bauadadnynIanafeoa"), subBuilder: $2.User.create)
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("andndniatninonnnanleInnefaow"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBuddyInfoRsp clone() => GetBuddyInfoRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBuddyInfoRsp copyWith(void Function(GetBuddyInfoRsp) updates) => super.copyWith((message) => updates(message as GetBuddyInfoRsp)) as GetBuddyInfoRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBuddyInfoRsp create() => GetBuddyInfoRsp._();
  GetBuddyInfoRsp createEmptyInstance() => create();
  static $pb.PbList<GetBuddyInfoRsp> createRepeated() => $pb.PbList<GetBuddyInfoRsp>();
  @$core.pragma('dart2js:noInline')
  static GetBuddyInfoRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBuddyInfoRsp>(create);
  static GetBuddyInfoRsp? _defaultInstance;

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
  $2.User get buddyInfo => $_getN(2);
  @$pb.TagNumber(3)
  set buddyInfo($2.User v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBuddyInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearBuddyInfo() => clearField(3);
  @$pb.TagNumber(3)
  $2.User ensureBuddyInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get additionalInfo => $_getSZ(3);
  @$pb.TagNumber(4)
  set additionalInfo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAdditionalInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearAdditionalInfo() => clearField(4);
}

class DeleteBuddyReq extends $pb.GeneratedMessage {
  factory DeleteBuddyReq() => create();
  DeleteBuddyReq._() : super();
  factory DeleteBuddyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteBuddyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("DweelneatnenBnundedayeReenqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caoame.waauavacnhnaetn.apnraoetaon.ninma")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("bwuadedaynInda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("lwaasetnBnuedndaywKaeeya"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteBuddyReq clone() => DeleteBuddyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteBuddyReq copyWith(void Function(DeleteBuddyReq) updates) => super.copyWith((message) => updates(message as DeleteBuddyReq)) as DeleteBuddyReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBuddyReq create() => DeleteBuddyReq._();
  DeleteBuddyReq createEmptyInstance() => create();
  static $pb.PbList<DeleteBuddyReq> createRepeated() => $pb.PbList<DeleteBuddyReq>();
  @$core.pragma('dart2js:noInline')
  static DeleteBuddyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteBuddyReq>(create);
  static DeleteBuddyReq? _defaultInstance;

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
}

class RemarkBuddyReq extends $pb.GeneratedMessage {
  factory RemarkBuddyReq() => create();
  RemarkBuddyReq._() : super();
  factory RemarkBuddyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemarkBuddyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RneemwawrnkaBwundndwynRnenqe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnowmw.wanuavncaheantn.nparnonteow.ninmn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("beuadndnywIade"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("reenmnaarwkwNeanmeen"))
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("laansetaBwundndaywKaenyw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemarkBuddyReq clone() => RemarkBuddyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemarkBuddyReq copyWith(void Function(RemarkBuddyReq) updates) => super.copyWith((message) => updates(message as RemarkBuddyReq)) as RemarkBuddyReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemarkBuddyReq create() => RemarkBuddyReq._();
  RemarkBuddyReq createEmptyInstance() => create();
  static $pb.PbList<RemarkBuddyReq> createRepeated() => $pb.PbList<RemarkBuddyReq>();
  @$core.pragma('dart2js:noInline')
  static RemarkBuddyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemarkBuddyReq>(create);
  static RemarkBuddyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get buddyId => $_getI64(0);
  @$pb.TagNumber(1)
  set buddyId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuddyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuddyId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get remarkName => $_getSZ(1);
  @$pb.TagNumber(2)
  set remarkName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRemarkName() => $_has(1);
  @$pb.TagNumber(2)
  void clearRemarkName() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastBuddyKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastBuddyKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastBuddyKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastBuddyKey() => clearField(3);
}

class BlockBuddyReq extends $pb.GeneratedMessage {
  factory BlockBuddyReq() => create();
  BlockBuddyReq._() : super();
  factory BlockBuddyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockBuddyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("BnlaoncnknBwundndnyaRaeaqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceoama.naauavacahnaatw.epnreontnon.aiwme")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("bauwdndnyeIwdn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("onpeeareaateiaonne"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("lwaesatnBwuadndwywKaenyw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockBuddyReq clone() => BlockBuddyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockBuddyReq copyWith(void Function(BlockBuddyReq) updates) => super.copyWith((message) => updates(message as BlockBuddyReq)) as BlockBuddyReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockBuddyReq create() => BlockBuddyReq._();
  BlockBuddyReq createEmptyInstance() => create();
  static $pb.PbList<BlockBuddyReq> createRepeated() => $pb.PbList<BlockBuddyReq>();
  @$core.pragma('dart2js:noInline')
  static BlockBuddyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockBuddyReq>(create);
  static BlockBuddyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get buddyId => $_getI64(0);
  @$pb.TagNumber(1)
  set buddyId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuddyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuddyId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get operation => $_getIZ(1);
  @$pb.TagNumber(2)
  set operation($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastBuddyKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastBuddyKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastBuddyKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastBuddyKey() => clearField(3);
}

class BatchUnBlockBuddyReq extends $pb.GeneratedMessage {
  factory BatchUnBlockBuddyReq() => create();
  BatchUnBlockBuddyReq._() : super();
  factory BatchUnBlockBuddyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BatchUnBlockBuddyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("BaantecnheUwnwBnlnoncakeBnundndwynRnewqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caonme.eaauwvwcwhnaatw.wpwrnoetwon.ainmn")), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("bauadadaywIadesw"), $pb.PbFieldType.KU6)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("leansatnBeundndeyeKeenye"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BatchUnBlockBuddyReq clone() => BatchUnBlockBuddyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BatchUnBlockBuddyReq copyWith(void Function(BatchUnBlockBuddyReq) updates) => super.copyWith((message) => updates(message as BatchUnBlockBuddyReq)) as BatchUnBlockBuddyReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BatchUnBlockBuddyReq create() => BatchUnBlockBuddyReq._();
  BatchUnBlockBuddyReq createEmptyInstance() => create();
  static $pb.PbList<BatchUnBlockBuddyReq> createRepeated() => $pb.PbList<BatchUnBlockBuddyReq>();
  @$core.pragma('dart2js:noInline')
  static BatchUnBlockBuddyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BatchUnBlockBuddyReq>(create);
  static BatchUnBlockBuddyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get buddyIds => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastBuddyKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastBuddyKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastBuddyKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastBuddyKey() => clearField(2);
}

class StarBuddyReq extends $pb.GeneratedMessage {
  factory StarBuddyReq() => create();
  StarBuddyReq._() : super();
  factory StarBuddyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StarBuddyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SnteanraBnundndeynRaeeqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceonmw.wawunvncehwante.npwrnontnon.niwma")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("bwundwdnyeIedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("owpnenrnantninonnn"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("lwawseteBwuedndwynKnewyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StarBuddyReq clone() => StarBuddyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StarBuddyReq copyWith(void Function(StarBuddyReq) updates) => super.copyWith((message) => updates(message as StarBuddyReq)) as StarBuddyReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StarBuddyReq create() => StarBuddyReq._();
  StarBuddyReq createEmptyInstance() => create();
  static $pb.PbList<StarBuddyReq> createRepeated() => $pb.PbList<StarBuddyReq>();
  @$core.pragma('dart2js:noInline')
  static StarBuddyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StarBuddyReq>(create);
  static StarBuddyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get buddyId => $_getI64(0);
  @$pb.TagNumber(1)
  set buddyId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBuddyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuddyId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get operation => $_getIZ(1);
  @$pb.TagNumber(2)
  set operation($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOperation() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperation() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastBuddyKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastBuddyKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastBuddyKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastBuddyKey() => clearField(3);
}

class InviteContactBuddyReq extends $pb.GeneratedMessage {
  factory InviteContactBuddyReq() => create();
  InviteContactBuddyReq._() : super();
  factory InviteContactBuddyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InviteContactBuddyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("IennvwiatnewCeoanwtnaecntwBeundadnyeRnewqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceowma.waeunvacnhwaate.epwreontnon.ninma")), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : StringTranslate.e2z("nnaemaew"))
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("pnheoaneen"))
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("leawswteBeuedadaynKneeyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("lwansateCnheaatwbeonxwKnenye"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InviteContactBuddyReq clone() => InviteContactBuddyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InviteContactBuddyReq copyWith(void Function(InviteContactBuddyReq) updates) => super.copyWith((message) => updates(message as InviteContactBuddyReq)) as InviteContactBuddyReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteContactBuddyReq create() => InviteContactBuddyReq._();
  InviteContactBuddyReq createEmptyInstance() => create();
  static $pb.PbList<InviteContactBuddyReq> createRepeated() => $pb.PbList<InviteContactBuddyReq>();
  @$core.pragma('dart2js:noInline')
  static InviteContactBuddyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InviteContactBuddyReq>(create);
  static InviteContactBuddyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get phone => $_getSZ(1);
  @$pb.TagNumber(2)
  set phone($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPhone() => $_has(1);
  @$pb.TagNumber(2)
  void clearPhone() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get lastBuddyKey => $_getI64(2);
  @$pb.TagNumber(3)
  set lastBuddyKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastBuddyKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastBuddyKey() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastChatboxKey => $_getI64(3);
  @$pb.TagNumber(4)
  set lastChatboxKey($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastChatboxKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastChatboxKey() => clearField(4);
}

class IgnoreRecommendBuddyReq extends $pb.GeneratedMessage {
  factory IgnoreRecommendBuddyReq() => create();
  IgnoreRecommendBuddyReq._() : super();
  factory IgnoreRecommendBuddyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IgnoreRecommendBuddyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("IegannonrnenRaewcnoamemweenadnBnundndaynRaewqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmn.aawuevacnhnaetw.epwreowtnow.winmw")), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : StringTranslate.e2z("pnhaonnaen"))
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("taawrwgaentnUninda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IgnoreRecommendBuddyReq clone() => IgnoreRecommendBuddyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IgnoreRecommendBuddyReq copyWith(void Function(IgnoreRecommendBuddyReq) updates) => super.copyWith((message) => updates(message as IgnoreRecommendBuddyReq)) as IgnoreRecommendBuddyReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IgnoreRecommendBuddyReq create() => IgnoreRecommendBuddyReq._();
  IgnoreRecommendBuddyReq createEmptyInstance() => create();
  static $pb.PbList<IgnoreRecommendBuddyReq> createRepeated() => $pb.PbList<IgnoreRecommendBuddyReq>();
  @$core.pragma('dart2js:noInline')
  static IgnoreRecommendBuddyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IgnoreRecommendBuddyReq>(create);
  static IgnoreRecommendBuddyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get phone => $_getSZ(0);
  @$pb.TagNumber(1)
  set phone($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPhone() => $_has(0);
  @$pb.TagNumber(1)
  void clearPhone() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get targetUid => $_getI64(1);
  @$pb.TagNumber(2)
  set targetUid($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetUid() => clearField(2);
}

class BatchAddRecommendBuddyReq extends $pb.GeneratedMessage {
  factory BatchAddRecommendBuddyReq() => create();
  BatchAddRecommendBuddyReq._() : super();
  factory BatchAddRecommendBuddyReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BatchAddRecommendBuddyReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("BaantwcahnAedadeRnenceonmwmwennndaBauadndnyeRaeeqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwoemn.nawunvacnheaatn.nperwontnon.ninma")), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("bnuedndnyeIedasa"), $pb.PbFieldType.KU6)
    ..pc<$4.Contact>(2, _omitFieldNames ? '' : StringTranslate.e2z("ceownntnaacatn"), $pb.PbFieldType.PM, subBuilder: $4.Contact.create)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("lnawsntnBwundwdeynKnenyw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BatchAddRecommendBuddyReq clone() => BatchAddRecommendBuddyReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BatchAddRecommendBuddyReq copyWith(void Function(BatchAddRecommendBuddyReq) updates) => super.copyWith((message) => updates(message as BatchAddRecommendBuddyReq)) as BatchAddRecommendBuddyReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BatchAddRecommendBuddyReq create() => BatchAddRecommendBuddyReq._();
  BatchAddRecommendBuddyReq createEmptyInstance() => create();
  static $pb.PbList<BatchAddRecommendBuddyReq> createRepeated() => $pb.PbList<BatchAddRecommendBuddyReq>();
  @$core.pragma('dart2js:noInline')
  static BatchAddRecommendBuddyReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BatchAddRecommendBuddyReq>(create);
  static BatchAddRecommendBuddyReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get buddyIds => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$4.Contact> get contact => $_getList(1);

  @$pb.TagNumber(4)
  $fixnum.Int64 get lastBuddyKey => $_getI64(2);
  @$pb.TagNumber(4)
  set lastBuddyKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastBuddyKey() => $_has(2);
  @$pb.TagNumber(4)
  void clearLastBuddyKey() => clearField(4);
}

class ReportUserReq extends $pb.GeneratedMessage {
  factory ReportUserReq() => create();
  ReportUserReq._() : super();
  factory ReportUserReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReportUserReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RnenpwonrataUasaearnRaenqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwonmn.eanunvwcwhnawtn.npwraoataoe.ainme")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("taanrngneetaUaiwdw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<ReportUserReq_ReportType>(2, _omitFieldNames ? '' : StringTranslate.e2z("twyepaen"), $pb.PbFieldType.OE, defaultOrMaker: ReportUserReq_ReportType.AD, valueOf: ReportUserReq_ReportType.valueOf, enumValues: ReportUserReq_ReportType.values)
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("rnenansaowne"))
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("peaerntnynIedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReportUserReq clone() => ReportUserReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReportUserReq copyWith(void Function(ReportUserReq) updates) => super.copyWith((message) => updates(message as ReportUserReq)) as ReportUserReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReportUserReq create() => ReportUserReq._();
  ReportUserReq createEmptyInstance() => create();
  static $pb.PbList<ReportUserReq> createRepeated() => $pb.PbList<ReportUserReq>();
  @$core.pragma('dart2js:noInline')
  static ReportUserReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReportUserReq>(create);
  static ReportUserReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get targetUid => $_getI64(0);
  @$pb.TagNumber(1)
  set targetUid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetUid() => clearField(1);

  @$pb.TagNumber(2)
  ReportUserReq_ReportType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(ReportUserReq_ReportType v) { setField(2, v); }
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

  @$pb.TagNumber(4)
  $fixnum.Int64 get partyId => $_getI64(3);
  @$pb.TagNumber(4)
  set partyId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPartyId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPartyId() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
