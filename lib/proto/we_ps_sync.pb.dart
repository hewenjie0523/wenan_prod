import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_sync.proto
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
import 'we_ps_sync.pbenum.dart';

export 'we_ps_sync.pbenum.dart';

class Sync extends $pb.GeneratedMessage {
  factory Sync() => create();
  Sync._() : super();
  factory Sync.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Sync.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Snyenaca"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoama.nanuevacnhwanta.npnraonteoa.ninmn")), createEmptyInstance: create)
    ..e<SyncType>(1, _omitFieldNames ? '' : StringTranslate.e2z("tnyepnen"), $pb.PbFieldType.OE, defaultOrMaker: SyncType.BUDDY, valueOf: SyncType.valueOf, enumValues: SyncType.values)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("lnaasatnKeeayn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("bnaasnenKnenyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<$0.Any>(10, _omitFieldNames ? '' : StringTranslate.e2z("aadwda"), $pb.PbFieldType.PM, subBuilder: $0.Any.create)
    ..pc<$0.Any>(11, _omitFieldNames ? '' : StringTranslate.e2z("dweelnewtaen"), $pb.PbFieldType.PM, subBuilder: $0.Any.create)
    ..pc<$0.Any>(12, _omitFieldNames ? '' : StringTranslate.e2z("uepwdeaetwen"), $pb.PbFieldType.PM, subBuilder: $0.Any.create)
    ..e<Sync_AfterSyncToDo>(20, _omitFieldNames ? '' : StringTranslate.e2z("aafntwewraSnynnncnTeoadwoe"), $pb.PbFieldType.OE, defaultOrMaker: Sync_AfterSyncToDo.TODO_NOTHING, valueOf: Sync_AfterSyncToDo.valueOf, enumValues: Sync_AfterSyncToDo.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Sync clone() => Sync()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Sync copyWith(void Function(Sync) updates) => super.copyWith((message) => updates(message as Sync)) as Sync;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Sync create() => Sync._();
  Sync createEmptyInstance() => create();
  static $pb.PbList<Sync> createRepeated() => $pb.PbList<Sync>();
  @$core.pragma('dart2js:noInline')
  static Sync getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sync>(create);
  static Sync? _defaultInstance;

  @$pb.TagNumber(1)
  SyncType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(SyncType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastKey() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get baseKey => $_getI64(2);
  @$pb.TagNumber(3)
  set baseKey($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBaseKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearBaseKey() => clearField(3);

  @$pb.TagNumber(10)
  $core.List<$0.Any> get add => $_getList(3);

  @$pb.TagNumber(11)
  $core.List<$0.Any> get delete => $_getList(4);

  @$pb.TagNumber(12)
  $core.List<$0.Any> get update => $_getList(5);

  @$pb.TagNumber(20)
  Sync_AfterSyncToDo get afterSyncTodo => $_getN(6);
  @$pb.TagNumber(20)
  set afterSyncTodo(Sync_AfterSyncToDo v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasAfterSyncTodo() => $_has(6);
  @$pb.TagNumber(20)
  void clearAfterSyncTodo() => clearField(20);
}

class SyncNotify extends $pb.GeneratedMessage {
  factory SyncNotify() => create();
  SyncNotify._() : super();
  factory SyncNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SaynnwcwNeoetniafaya"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoamn.aanunvwcwhaaatn.wpnrnowtnon.aiamn")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("taynpnense"), $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncNotify clone() => SyncNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncNotify copyWith(void Function(SyncNotify) updates) => super.copyWith((message) => updates(message as SyncNotify)) as SyncNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncNotify create() => SyncNotify._();
  SyncNotify createEmptyInstance() => create();
  static $pb.PbList<SyncNotify> createRepeated() => $pb.PbList<SyncNotify>();
  @$core.pragma('dart2js:noInline')
  static SyncNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncNotify>(create);
  static SyncNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get types => $_getIZ(0);
  @$pb.TagNumber(1)
  set types($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTypes() => $_has(0);
  @$pb.TagNumber(1)
  void clearTypes() => clearField(1);
}

class SyncKeyConfirmNotify extends $pb.GeneratedMessage {
  factory SyncKeyConfirmNotify() => create();
  SyncKeyConfirmNotify._() : super();
  factory SyncKeyConfirmNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SyncKeyConfirmNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SaywnacwKnenyeCaoenefnierameNwowtaiafeyn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmw.nanuwvecehnaetn.npnrwontaon.aiemn")), createEmptyInstance: create)
    ..e<SyncType>(1, _omitFieldNames ? '' : StringTranslate.e2z("teywpnee"), $pb.PbFieldType.OE, defaultOrMaker: SyncType.BUDDY, valueOf: SyncType.valueOf, enumValues: SyncType.values)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("lnanswtwKneeyn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SyncKeyConfirmNotify clone() => SyncKeyConfirmNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SyncKeyConfirmNotify copyWith(void Function(SyncKeyConfirmNotify) updates) => super.copyWith((message) => updates(message as SyncKeyConfirmNotify)) as SyncKeyConfirmNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncKeyConfirmNotify create() => SyncKeyConfirmNotify._();
  SyncKeyConfirmNotify createEmptyInstance() => create();
  static $pb.PbList<SyncKeyConfirmNotify> createRepeated() => $pb.PbList<SyncKeyConfirmNotify>();
  @$core.pragma('dart2js:noInline')
  static SyncKeyConfirmNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SyncKeyConfirmNotify>(create);
  static SyncKeyConfirmNotify? _defaultInstance;

  @$pb.TagNumber(1)
  SyncType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(SyncType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get lastKey => $_getI64(1);
  @$pb.TagNumber(2)
  set lastKey($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastKey() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
