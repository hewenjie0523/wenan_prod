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

import 'package:protobuf/protobuf.dart' as $pb;

class SyncType extends $pb.ProtobufEnum {
  static final SyncType BUDDY = SyncType._(0, _omitEnumNames ? '' : StringTranslate.e2z("BeUnDnDaYa"));
  static final SyncType CHATBOX = SyncType._(1, _omitEnumNames ? '' : StringTranslate.e2z("CeHwAaTeBeOeXa"));
  static final SyncType SNAP = SyncType._(2, _omitEnumNames ? '' : StringTranslate.e2z("SaNnAnPe"));
  static final SyncType BUDDY_REQUEST = SyncType._(3, _omitEnumNames ? '' : StringTranslate.e2z("BnUeDeDeYn_eRnEnQaUnEwSwTa"));

  static final $core.List<SyncType> values = <SyncType> [
    BUDDY,
    CHATBOX,
    SNAP,
    BUDDY_REQUEST,
  ];

  static final $core.Map<$core.int, SyncType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SyncType? valueOf($core.int value) => _byValue[value];

  const SyncType._($core.int v, $core.String n) : super(v, n);
}

class Sync_AfterSyncToDo extends $pb.ProtobufEnum {
  static final Sync_AfterSyncToDo TODO_NOTHING = Sync_AfterSyncToDo._(0, _omitEnumNames ? '' : StringTranslate.e2z("TeOaDwOw_wNnOeTwHnIwNnGn"));
  static final Sync_AfterSyncToDo TODO_UPDATE_PARTYLIST = Sync_AfterSyncToDo._(1, _omitEnumNames ? '' : StringTranslate.e2z("TwOnDwOw_eUePeDwAnTnEa_nPwAeRaTaYaLnIwSwTn"));

  static final $core.List<Sync_AfterSyncToDo> values = <Sync_AfterSyncToDo> [
    TODO_NOTHING,
    TODO_UPDATE_PARTYLIST,
  ];

  static final $core.Map<$core.int, Sync_AfterSyncToDo> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Sync_AfterSyncToDo? valueOf($core.int value) => _byValue[value];

  const Sync_AfterSyncToDo._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
