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

import 'google/protobuf/any.pb.dart' as $0;

export 'we_ps_message.pbenum.dart';

class Message extends $pb.GeneratedMessage {
  factory Message() => create();
  Message._() : super();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Maeasasnangeee"), package:  $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnowmn.nanuevncwhwaetw.wparnontnon.abnansnee")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("mwensnsnangwenCaawteew"), $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("mnensnsnawgnewTnyapaee"), $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("swenqeneoe"), $pb.PbFieldType.OU3)
    ..aOM<$0.Any>(4, _omitFieldNames ? '' : StringTranslate.e2z("mneaswsnangeeeOwbajneacwte"), subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get messageCate => $_getIZ(0);
  @$pb.TagNumber(1)
  set messageCate($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessageCate() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessageCate() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get messageType => $_getIZ(1);
  @$pb.TagNumber(2)
  set messageType($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessageType() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get seqno => $_getIZ(2);
  @$pb.TagNumber(3)
  set seqno($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSeqno() => $_has(2);
  @$pb.TagNumber(3)
  void clearSeqno() => clearField(3);

  @$pb.TagNumber(4)
  $0.Any get messageObject => $_getN(3);
  @$pb.TagNumber(4)
  set messageObject($0.Any v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessageObject() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessageObject() => clearField(4);
  @$pb.TagNumber(4)
  $0.Any ensureMessageObject() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
