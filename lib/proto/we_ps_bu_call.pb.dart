import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: we_ps_bu_call.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'we_ps_bu_call.pbenum.dart';
import 'we_ps_bu_object.pb.dart' as $1;
import 'we_ps_object.pb.dart' as $2;

export 'we_ps_bu_call.pbenum.dart';

class ChatCallReq extends $pb.GeneratedMessage {
  factory ChatCallReq() => create();
  ChatCallReq._() : super();
  factory ChatCallReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCallReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CwhwaetnCwanlnleRaenqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceoema.eanuavecahnantn.wpnreoetaoe.ncalwuabw9a")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("indn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("lwoeceawlnIwda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("cwhaaetnIede"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, _omitFieldNames ? '' : StringTranslate.e2z("maeedwinan"), $pb.PbFieldType.OU3)
    ..e<ChatCallReq_Opt>(5, _omitFieldNames ? '' : StringTranslate.e2z("oapntn"), $pb.PbFieldType.OE, defaultOrMaker: ChatCallReq_Opt.INVITE, valueOf: ChatCallReq_Opt.valueOf, enumValues: ChatCallReq_Opt.values)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : StringTranslate.e2z("seuabnsncnrwiabnenrwIede"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(7, _omitFieldNames ? '' : StringTranslate.e2z("swonuarecnenTnynpeea"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : StringTranslate.e2z("snonunrwcneeIndn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<ChatCallReq_Quality>(9, _omitFieldNames ? '' : StringTranslate.e2z("qeuwawlninteye"), $pb.PbFieldType.OE, defaultOrMaker: ChatCallReq_Quality.UNKNOWN, valueOf: ChatCallReq_Quality.valueOf, enumValues: ChatCallReq_Quality.values)
    ..a<$core.int>(10, _omitFieldNames ? '' : StringTranslate.e2z("awpepeSwtnawteuwsw"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCallReq clone() => ChatCallReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCallReq copyWith(void Function(ChatCallReq) updates) => super.copyWith((message) => updates(message as ChatCallReq)) as ChatCallReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCallReq create() => ChatCallReq._();
  ChatCallReq createEmptyInstance() => create();
  static $pb.PbList<ChatCallReq> createRepeated() => $pb.PbList<ChatCallReq>();
  @$core.pragma('dart2js:noInline')
  static ChatCallReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCallReq>(create);
  static ChatCallReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get localId => $_getI64(1);
  @$pb.TagNumber(2)
  set localId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocalId() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get chatId => $_getI64(2);
  @$pb.TagNumber(3)
  set chatId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatId() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get media => $_getIZ(3);
  @$pb.TagNumber(4)
  set media($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMedia() => $_has(3);
  @$pb.TagNumber(4)
  void clearMedia() => clearField(4);

  @$pb.TagNumber(5)
  ChatCallReq_Opt get opt => $_getN(4);
  @$pb.TagNumber(5)
  set opt(ChatCallReq_Opt v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasOpt() => $_has(4);
  @$pb.TagNumber(5)
  void clearOpt() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get subscriberId => $_getI64(5);
  @$pb.TagNumber(6)
  set subscriberId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSubscriberId() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubscriberId() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get sourceType => $_getIZ(6);
  @$pb.TagNumber(7)
  set sourceType($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSourceType() => $_has(6);
  @$pb.TagNumber(7)
  void clearSourceType() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get sourceId => $_getI64(7);
  @$pb.TagNumber(8)
  set sourceId($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSourceId() => $_has(7);
  @$pb.TagNumber(8)
  void clearSourceId() => clearField(8);

  @$pb.TagNumber(9)
  ChatCallReq_Quality get quality => $_getN(8);
  @$pb.TagNumber(9)
  set quality(ChatCallReq_Quality v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasQuality() => $_has(8);
  @$pb.TagNumber(9)
  void clearQuality() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get appStatus => $_getIZ(9);
  @$pb.TagNumber(10)
  set appStatus($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAppStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearAppStatus() => clearField(10);
}

class ChatCallRsp extends $pb.GeneratedMessage {
  factory ChatCallRsp() => create();
  ChatCallRsp._() : super();
  factory ChatCallRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCallRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CaheaateCnanlnlwRwsapw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoamw.aanunvncehaaate.apnraowtnoa.ncnlnuebn9e")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnoadnew"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mnswge"))
    ..aOM<$1.ChatCall>(3, _omitFieldNames ? '' : StringTranslate.e2z("cnawlwln"), subBuilder: $1.ChatCall.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCallRsp clone() => ChatCallRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCallRsp copyWith(void Function(ChatCallRsp) updates) => super.copyWith((message) => updates(message as ChatCallRsp)) as ChatCallRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCallRsp create() => ChatCallRsp._();
  ChatCallRsp createEmptyInstance() => create();
  static $pb.PbList<ChatCallRsp> createRepeated() => $pb.PbList<ChatCallRsp>();
  @$core.pragma('dart2js:noInline')
  static ChatCallRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCallRsp>(create);
  static ChatCallRsp? _defaultInstance;

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
  $1.ChatCall get call => $_getN(2);
  @$pb.TagNumber(3)
  set call($1.ChatCall v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCall() => $_has(2);
  @$pb.TagNumber(3)
  void clearCall() => clearField(3);
  @$pb.TagNumber(3)
  $1.ChatCall ensureCall() => $_ensure(2);
}

class ChatCallPsh extends $pb.GeneratedMessage {
  factory ChatCallPsh() => create();
  ChatCallPsh._() : super();
  factory ChatCallPsh.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCallPsh.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnheaetnCeaalalaPnsnhe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmw.aawuwvncnheawta.apnrnowtnoe.ncelwuebw9n")), createEmptyInstance: create)
    ..aOM<$1.ChatCall>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnawlaln"), subBuilder: $1.ChatCall.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCallPsh clone() => ChatCallPsh()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCallPsh copyWith(void Function(ChatCallPsh) updates) => super.copyWith((message) => updates(message as ChatCallPsh)) as ChatCallPsh;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCallPsh create() => ChatCallPsh._();
  ChatCallPsh createEmptyInstance() => create();
  static $pb.PbList<ChatCallPsh> createRepeated() => $pb.PbList<ChatCallPsh>();
  @$core.pragma('dart2js:noInline')
  static ChatCallPsh getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCallPsh>(create);
  static ChatCallPsh? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ChatCall get call => $_getN(0);
  @$pb.TagNumber(1)
  set call($1.ChatCall v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCall() => $_has(0);
  @$pb.TagNumber(1)
  void clearCall() => clearField(1);
  @$pb.TagNumber(1)
  $1.ChatCall ensureCall() => $_ensure(0);
}

class BegGiftReq extends $pb.GeneratedMessage {
  factory BegGiftReq() => create();
  BegGiftReq._() : super();
  factory BegGiftReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BegGiftReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("BeengnGaiafwteRaeaqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caoema.eawuwvncwhnante.apnrnonteon.wcalaunbn9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("gninfntwIndn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("taonUninde"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("sncnennwenTwyapnen"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("swcaewnweeIndn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BegGiftReq clone() => BegGiftReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BegGiftReq copyWith(void Function(BegGiftReq) updates) => super.copyWith((message) => updates(message as BegGiftReq)) as BegGiftReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BegGiftReq create() => BegGiftReq._();
  BegGiftReq createEmptyInstance() => create();
  static $pb.PbList<BegGiftReq> createRepeated() => $pb.PbList<BegGiftReq>();
  @$core.pragma('dart2js:noInline')
  static BegGiftReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BegGiftReq>(create);
  static BegGiftReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get giftId => $_getI64(0);
  @$pb.TagNumber(1)
  set giftId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGiftId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGiftId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get toUid => $_getI64(1);
  @$pb.TagNumber(2)
  set toUid($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearToUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get sceneType => $_getIZ(2);
  @$pb.TagNumber(3)
  set sceneType($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSceneType() => $_has(2);
  @$pb.TagNumber(3)
  void clearSceneType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get sceneId => $_getI64(3);
  @$pb.TagNumber(4)
  set sceneId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSceneId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSceneId() => clearField(4);
}

class BegGiftPSH extends $pb.GeneratedMessage {
  factory BegGiftPSH() => create();
  BegGiftPSH._() : super();
  factory BegGiftPSH.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BegGiftPSH.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("BwengeGwinfwtwPaSaHw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoeme.waauavwcahnantw.npnrwonteon.wcwlnunba9n")), createEmptyInstance: create)
    ..aOM<$1.Gift>(1, _omitFieldNames ? '' : StringTranslate.e2z("gninfete"), subBuilder: $1.Gift.create)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("fnreoemnUwindw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("swcaeanneeTnyapeew"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("secneenwenIada"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("beeagnIedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BegGiftPSH clone() => BegGiftPSH()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BegGiftPSH copyWith(void Function(BegGiftPSH) updates) => super.copyWith((message) => updates(message as BegGiftPSH)) as BegGiftPSH;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BegGiftPSH create() => BegGiftPSH._();
  BegGiftPSH createEmptyInstance() => create();
  static $pb.PbList<BegGiftPSH> createRepeated() => $pb.PbList<BegGiftPSH>();
  @$core.pragma('dart2js:noInline')
  static BegGiftPSH getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BegGiftPSH>(create);
  static BegGiftPSH? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Gift get gift => $_getN(0);
  @$pb.TagNumber(1)
  set gift($1.Gift v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGift() => $_has(0);
  @$pb.TagNumber(1)
  void clearGift() => clearField(1);
  @$pb.TagNumber(1)
  $1.Gift ensureGift() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get fromUid => $_getI64(1);
  @$pb.TagNumber(2)
  set fromUid($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFromUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromUid() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get sceneType => $_getIZ(2);
  @$pb.TagNumber(3)
  set sceneType($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSceneType() => $_has(2);
  @$pb.TagNumber(3)
  void clearSceneType() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get sceneId => $_getI64(3);
  @$pb.TagNumber(4)
  set sceneId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSceneId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSceneId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get begId => $_getI64(4);
  @$pb.TagNumber(5)
  set begId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBegId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBegId() => clearField(5);
}

class SendChatCallGiftReq extends $pb.GeneratedMessage {
  factory SendChatCallGiftReq() => create();
  SendChatCallGiftReq._() : super();
  factory SendChatCallGiftReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SendChatCallGiftReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SnennedeCnhnaetnCnawlalnGwiafeteRnenqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmw.eanuevncnhnaatn.apareoataow.acnlwuwbe9w")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("ceaelwlnIndw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("gaiwfntnIwdn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("qnuwawnntwietwyn"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("tnonUeiwdn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("bneageIede"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SendChatCallGiftReq clone() => SendChatCallGiftReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SendChatCallGiftReq copyWith(void Function(SendChatCallGiftReq) updates) => super.copyWith((message) => updates(message as SendChatCallGiftReq)) as SendChatCallGiftReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SendChatCallGiftReq create() => SendChatCallGiftReq._();
  SendChatCallGiftReq createEmptyInstance() => create();
  static $pb.PbList<SendChatCallGiftReq> createRepeated() => $pb.PbList<SendChatCallGiftReq>();
  @$core.pragma('dart2js:noInline')
  static SendChatCallGiftReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SendChatCallGiftReq>(create);
  static SendChatCallGiftReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get callId => $_getI64(0);
  @$pb.TagNumber(1)
  set callId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get giftId => $_getI64(1);
  @$pb.TagNumber(2)
  set giftId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGiftId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGiftId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get quantity => $_getIZ(2);
  @$pb.TagNumber(3)
  set quantity($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuantity() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuantity() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get toUid => $_getI64(3);
  @$pb.TagNumber(4)
  set toUid($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasToUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearToUid() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get begId => $_getI64(4);
  @$pb.TagNumber(5)
  set begId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBegId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBegId() => clearField(5);
}

class ChatCallGiftPSH extends $pb.GeneratedMessage {
  factory ChatCallGiftPSH() => create();
  ChatCallGiftPSH._() : super();
  factory ChatCallGiftPSH.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCallGiftPSH.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnheantnCwaelnlwGninfetePnSnHn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoama.eawuevecnheanta.npwreontaow.ncnlnuabn9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnanlwlnIwdw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$1.Gift>(2, _omitFieldNames ? '' : StringTranslate.e2z("gainfntn"), subBuilder: $1.Gift.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("qnuwaanwtniwteyn"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("tnonUaiedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("fnrnonmeUeinde"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : StringTranslate.e2z("cnrweaaataenTninmnee"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCallGiftPSH clone() => ChatCallGiftPSH()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCallGiftPSH copyWith(void Function(ChatCallGiftPSH) updates) => super.copyWith((message) => updates(message as ChatCallGiftPSH)) as ChatCallGiftPSH;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCallGiftPSH create() => ChatCallGiftPSH._();
  ChatCallGiftPSH createEmptyInstance() => create();
  static $pb.PbList<ChatCallGiftPSH> createRepeated() => $pb.PbList<ChatCallGiftPSH>();
  @$core.pragma('dart2js:noInline')
  static ChatCallGiftPSH getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCallGiftPSH>(create);
  static ChatCallGiftPSH? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get callId => $_getI64(0);
  @$pb.TagNumber(1)
  set callId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Gift get gift => $_getN(1);
  @$pb.TagNumber(2)
  set gift($1.Gift v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGift() => $_has(1);
  @$pb.TagNumber(2)
  void clearGift() => clearField(2);
  @$pb.TagNumber(2)
  $1.Gift ensureGift() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get quantity => $_getIZ(2);
  @$pb.TagNumber(3)
  set quantity($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasQuantity() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuantity() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get toUid => $_getI64(3);
  @$pb.TagNumber(4)
  set toUid($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasToUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearToUid() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get fromUid => $_getI64(4);
  @$pb.TagNumber(5)
  set fromUid($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFromUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearFromUid() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get createTime => $_getI64(5);
  @$pb.TagNumber(6)
  set createTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);
}

class RateChatCallReq extends $pb.GeneratedMessage {
  factory RateChatCallReq() => create();
  RateChatCallReq._() : super();
  factory RateChatCallReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RateChatCallReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RnantneaCwhwantnCwawlelnRwenqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwonme.aawunvwcahwantw.npnrnowtnoa.ecalnuwbn9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnawlnleIndn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("swnaanpnIwdw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("reantwinnagn"), $pb.PbFieldType.OU3)
    ..p<$core.int>(4, _omitFieldNames ? '' : StringTranslate.e2z("tnangaIedesn"), $pb.PbFieldType.KU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RateChatCallReq clone() => RateChatCallReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RateChatCallReq copyWith(void Function(RateChatCallReq) updates) => super.copyWith((message) => updates(message as RateChatCallReq)) as RateChatCallReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RateChatCallReq create() => RateChatCallReq._();
  RateChatCallReq createEmptyInstance() => create();
  static $pb.PbList<RateChatCallReq> createRepeated() => $pb.PbList<RateChatCallReq>();
  @$core.pragma('dart2js:noInline')
  static RateChatCallReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RateChatCallReq>(create);
  static RateChatCallReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get callId => $_getI64(0);
  @$pb.TagNumber(1)
  set callId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCallId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCallId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get snapId => $_getI64(1);
  @$pb.TagNumber(2)
  set snapId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSnapId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSnapId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rating => $_getIZ(2);
  @$pb.TagNumber(3)
  set rating($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRating() => $_has(2);
  @$pb.TagNumber(3)
  void clearRating() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get tagIds => $_getList(3);
}

class CheckCallReq extends $pb.GeneratedMessage {
  factory CheckCallReq() => create();
  CheckCallReq._() : super();
  factory CheckCallReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckCallReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CahaencnknCwaalwleRneaqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonma.nanuavwceheaatn.epwrnoetwoa.ecnlwunba9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("twoaUeinda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckCallReq clone() => CheckCallReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckCallReq copyWith(void Function(CheckCallReq) updates) => super.copyWith((message) => updates(message as CheckCallReq)) as CheckCallReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckCallReq create() => CheckCallReq._();
  CheckCallReq createEmptyInstance() => create();
  static $pb.PbList<CheckCallReq> createRepeated() => $pb.PbList<CheckCallReq>();
  @$core.pragma('dart2js:noInline')
  static CheckCallReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckCallReq>(create);
  static CheckCallReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get toUid => $_getI64(0);
  @$pb.TagNumber(1)
  set toUid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearToUid() => clearField(1);
}

class CheckCallRsp extends $pb.GeneratedMessage {
  factory CheckCallRsp() => create();
  CheckCallRsp._() : super();
  factory CheckCallRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckCallRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnhnencakaCnaalwlaRnsnpw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoeme.nanuwvncwhwante.npnrwowtnon.ncelnuwbn9w")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("cwoednen"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mesngn"))
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("bwaeleawnncnen"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("cahnawtaPnrniwcwee"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("faierasatwPwanyn"), $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("nnoeDainsntnuwrabw"), $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : StringTranslate.e2z("hnaasnEaxnpaCeawredn"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckCallRsp clone() => CheckCallRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckCallRsp copyWith(void Function(CheckCallRsp) updates) => super.copyWith((message) => updates(message as CheckCallRsp)) as CheckCallRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckCallRsp create() => CheckCallRsp._();
  CheckCallRsp createEmptyInstance() => create();
  static $pb.PbList<CheckCallRsp> createRepeated() => $pb.PbList<CheckCallRsp>();
  @$core.pragma('dart2js:noInline')
  static CheckCallRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckCallRsp>(create);
  static CheckCallRsp? _defaultInstance;

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
  $fixnum.Int64 get balance => $_getI64(2);
  @$pb.TagNumber(3)
  set balance($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBalance() => $_has(2);
  @$pb.TagNumber(3)
  void clearBalance() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get chatPrice => $_getI64(3);
  @$pb.TagNumber(4)
  set chatPrice($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChatPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearChatPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get firstPay => $_getIZ(4);
  @$pb.TagNumber(5)
  set firstPay($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFirstPay() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstPay() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get noDisturb => $_getIZ(5);
  @$pb.TagNumber(6)
  set noDisturb($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNoDisturb() => $_has(5);
  @$pb.TagNumber(6)
  void clearNoDisturb() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get hasExpCard => $_getIZ(6);
  @$pb.TagNumber(7)
  set hasExpCard($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasHasExpCard() => $_has(6);
  @$pb.TagNumber(7)
  void clearHasExpCard() => clearField(7);
}

class ChatCallMatchReq extends $pb.GeneratedMessage {
  factory ChatCallMatchReq() => create();
  ChatCallMatchReq._() : super();
  factory ChatCallMatchReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCallMatchReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CahwaetaCnanlnlwMwaetncahnRaeeqa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmn.naaunvncwheawtw.epwraoetaow.wcelwuabn9a")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("geennndeeern"), $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("twyepeew"), $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("rnengninowna"))
    ..a<$core.int>(4, _omitFieldNames ? '' : StringTranslate.e2z("mnantncwhaTnywpnen"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCallMatchReq clone() => ChatCallMatchReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCallMatchReq copyWith(void Function(ChatCallMatchReq) updates) => super.copyWith((message) => updates(message as ChatCallMatchReq)) as ChatCallMatchReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCallMatchReq create() => ChatCallMatchReq._();
  ChatCallMatchReq createEmptyInstance() => create();
  static $pb.PbList<ChatCallMatchReq> createRepeated() => $pb.PbList<ChatCallMatchReq>();
  @$core.pragma('dart2js:noInline')
  static ChatCallMatchReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCallMatchReq>(create);
  static ChatCallMatchReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gender => $_getIZ(0);
  @$pb.TagNumber(1)
  set gender($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGender() => $_has(0);
  @$pb.TagNumber(1)
  void clearGender() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get region => $_getSZ(2);
  @$pb.TagNumber(3)
  set region($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRegion() => $_has(2);
  @$pb.TagNumber(3)
  void clearRegion() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get matchType => $_getIZ(3);
  @$pb.TagNumber(4)
  set matchType($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMatchType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMatchType() => clearField(4);
}

class ChatCallMatchRsp extends $pb.GeneratedMessage {
  factory ChatCallMatchRsp() => create();
  ChatCallMatchRsp._() : super();
  factory ChatCallMatchRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCallMatchRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CwhnaeteCnaalalnMnaatncahaResnpw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoemn.waeuavncehwawtw.apnrnontnoe.acalnueba9w")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("caowdnee"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mwsage"))
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("wwaniwtwCnoeunnwtn"), $pb.PbFieldType.OU3)
    ..pPS(4, _omitFieldNames ? '' : StringTranslate.e2z("raawnndnonmnAnvnaetnanrnsn"))
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("mwaatncwhnTaynpnew"), $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("reenmeaainneCwonuwnatn"), $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : StringTranslate.e2z("leiamniateCnoauwnetn"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCallMatchRsp clone() => ChatCallMatchRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCallMatchRsp copyWith(void Function(ChatCallMatchRsp) updates) => super.copyWith((message) => updates(message as ChatCallMatchRsp)) as ChatCallMatchRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCallMatchRsp create() => ChatCallMatchRsp._();
  ChatCallMatchRsp createEmptyInstance() => create();
  static $pb.PbList<ChatCallMatchRsp> createRepeated() => $pb.PbList<ChatCallMatchRsp>();
  @$core.pragma('dart2js:noInline')
  static ChatCallMatchRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCallMatchRsp>(create);
  static ChatCallMatchRsp? _defaultInstance;

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
  $core.int get waitCount => $_getIZ(2);
  @$pb.TagNumber(3)
  set waitCount($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWaitCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearWaitCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.String> get randomAvatars => $_getList(3);

  @$pb.TagNumber(5)
  $core.int get matchType => $_getIZ(4);
  @$pb.TagNumber(5)
  set matchType($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMatchType() => $_has(4);
  @$pb.TagNumber(5)
  void clearMatchType() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get remainCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set remainCount($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRemainCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearRemainCount() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get limitCount => $_getIZ(6);
  @$pb.TagNumber(7)
  set limitCount($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLimitCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearLimitCount() => clearField(7);
}

class CancelChatCallMatchReq extends $pb.GeneratedMessage {
  factory CancelChatCallMatchReq() => create();
  CancelChatCallMatchReq._() : super();
  factory CancelChatCallMatchReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CancelChatCallMatchReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnannnceenlnCehwaatwCnaalwlnMeantecwhnRweeqw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceonma.eawuwvacnheantn.wpwreoataoa.acelnunba9e")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("maaetecnhnIedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("meaetncnhaTnynpnee"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CancelChatCallMatchReq clone() => CancelChatCallMatchReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CancelChatCallMatchReq copyWith(void Function(CancelChatCallMatchReq) updates) => super.copyWith((message) => updates(message as CancelChatCallMatchReq)) as CancelChatCallMatchReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelChatCallMatchReq create() => CancelChatCallMatchReq._();
  CancelChatCallMatchReq createEmptyInstance() => create();
  static $pb.PbList<CancelChatCallMatchReq> createRepeated() => $pb.PbList<CancelChatCallMatchReq>();
  @$core.pragma('dart2js:noInline')
  static CancelChatCallMatchReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CancelChatCallMatchReq>(create);
  static CancelChatCallMatchReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get matchId => $_getI64(0);
  @$pb.TagNumber(1)
  set matchId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get matchType => $_getIZ(1);
  @$pb.TagNumber(2)
  set matchType($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMatchType() => $_has(1);
  @$pb.TagNumber(2)
  void clearMatchType() => clearField(2);
}

class ConfirmChatCallMatchReq extends $pb.GeneratedMessage {
  factory ConfirmChatCallMatchReq() => create();
  ConfirmChatCallMatchReq._() : super();
  factory ConfirmChatCallMatchReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfirmChatCallMatchReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CwoenefwiwrnmaCnhaaataCnanlwlnMnaatwcehwRaenqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwoemn.wawunvacaheaete.apwraontnon.ncalnunbw9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("mnawtncnhaInda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfirmChatCallMatchReq clone() => ConfirmChatCallMatchReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfirmChatCallMatchReq copyWith(void Function(ConfirmChatCallMatchReq) updates) => super.copyWith((message) => updates(message as ConfirmChatCallMatchReq)) as ConfirmChatCallMatchReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfirmChatCallMatchReq create() => ConfirmChatCallMatchReq._();
  ConfirmChatCallMatchReq createEmptyInstance() => create();
  static $pb.PbList<ConfirmChatCallMatchReq> createRepeated() => $pb.PbList<ConfirmChatCallMatchReq>();
  @$core.pragma('dart2js:noInline')
  static ConfirmChatCallMatchReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfirmChatCallMatchReq>(create);
  static ConfirmChatCallMatchReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get matchId => $_getI64(0);
  @$pb.TagNumber(1)
  set matchId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);
}

class ChatCallMatchPSH extends $pb.GeneratedMessage {
  factory ChatCallMatchPSH() => create();
  ChatCallMatchPSH._() : super();
  factory ChatCallMatchPSH.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCallMatchPSH.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CahnaatnCwanlelaMaaatncnhePaSeHw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceowma.eanunvwcwhnantn.epnrnontaoa.wcalaunbe9w")), createEmptyInstance: create)
    ..aOM<$1.ChatCall>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnanlaln"), subBuilder: $1.ChatCall.create)
    ..aOM<$2.User>(2, _omitFieldNames ? '' : StringTranslate.e2z("mnaatacahnUasweerw"), subBuilder: $2.User.create)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("mnawtecwhwIwdw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, _omitFieldNames ? '' : StringTranslate.e2z("setnantnuwsn"), $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("aeuetwonCwanlnln"), $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("maaetncnhnTnyapeee"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCallMatchPSH clone() => ChatCallMatchPSH()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCallMatchPSH copyWith(void Function(ChatCallMatchPSH) updates) => super.copyWith((message) => updates(message as ChatCallMatchPSH)) as ChatCallMatchPSH;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCallMatchPSH create() => ChatCallMatchPSH._();
  ChatCallMatchPSH createEmptyInstance() => create();
  static $pb.PbList<ChatCallMatchPSH> createRepeated() => $pb.PbList<ChatCallMatchPSH>();
  @$core.pragma('dart2js:noInline')
  static ChatCallMatchPSH getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCallMatchPSH>(create);
  static ChatCallMatchPSH? _defaultInstance;

  @$pb.TagNumber(1)
  $1.ChatCall get call => $_getN(0);
  @$pb.TagNumber(1)
  set call($1.ChatCall v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCall() => $_has(0);
  @$pb.TagNumber(1)
  void clearCall() => clearField(1);
  @$pb.TagNumber(1)
  $1.ChatCall ensureCall() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.User get matchUser => $_getN(1);
  @$pb.TagNumber(2)
  set matchUser($2.User v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasMatchUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearMatchUser() => clearField(2);
  @$pb.TagNumber(2)
  $2.User ensureMatchUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get matchId => $_getI64(2);
  @$pb.TagNumber(3)
  set matchId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMatchId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMatchId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get status => $_getIZ(3);
  @$pb.TagNumber(4)
  set status($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get autoCall => $_getIZ(4);
  @$pb.TagNumber(5)
  set autoCall($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAutoCall() => $_has(4);
  @$pb.TagNumber(5)
  void clearAutoCall() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get matchType => $_getIZ(5);
  @$pb.TagNumber(6)
  set matchType($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMatchType() => $_has(5);
  @$pb.TagNumber(6)
  void clearMatchType() => clearField(6);
}

class ViewAicVideoReq extends $pb.GeneratedMessage {
  factory ViewAicVideoReq() => create();
  ViewAicVideoReq._() : super();
  factory ViewAicVideoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ViewAicVideoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("VeineewnAaincwVeiwdwewonRnenqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmw.naaunvncahwantn.npwrnowtnoe.wceleunba9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("aninceUwiedw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ViewAicVideoReq clone() => ViewAicVideoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ViewAicVideoReq copyWith(void Function(ViewAicVideoReq) updates) => super.copyWith((message) => updates(message as ViewAicVideoReq)) as ViewAicVideoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ViewAicVideoReq create() => ViewAicVideoReq._();
  ViewAicVideoReq createEmptyInstance() => create();
  static $pb.PbList<ViewAicVideoReq> createRepeated() => $pb.PbList<ViewAicVideoReq>();
  @$core.pragma('dart2js:noInline')
  static ViewAicVideoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ViewAicVideoReq>(create);
  static ViewAicVideoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get aicUid => $_getI64(0);
  @$pb.TagNumber(1)
  set aicUid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAicUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearAicUid() => clearField(1);
}

class AiCallReq extends $pb.GeneratedMessage {
  factory AiCallReq() => create();
  AiCallReq._() : super();
  factory AiCallReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AiCallReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("AniwCnaelwlnRaeaqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmn.naeunvecwhnaatn.nperaoatnow.wcelnunba9w")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("indn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("cahnaetnIedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("twyepnee"), $pb.PbFieldType.OU3)
    ..e<ChatCallReq_Opt>(4, _omitFieldNames ? '' : StringTranslate.e2z("onpeta"), $pb.PbFieldType.OE, defaultOrMaker: ChatCallReq_Opt.INVITE, valueOf: ChatCallReq_Opt.valueOf, enumValues: ChatCallReq_Opt.values)
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("raeejnencntwRneaaesnoena"), $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("dwuwreaetniwoenw"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AiCallReq clone() => AiCallReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AiCallReq copyWith(void Function(AiCallReq) updates) => super.copyWith((message) => updates(message as AiCallReq)) as AiCallReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AiCallReq create() => AiCallReq._();
  AiCallReq createEmptyInstance() => create();
  static $pb.PbList<AiCallReq> createRepeated() => $pb.PbList<AiCallReq>();
  @$core.pragma('dart2js:noInline')
  static AiCallReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AiCallReq>(create);
  static AiCallReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get chatId => $_getI64(1);
  @$pb.TagNumber(2)
  set chatId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChatId() => $_has(1);
  @$pb.TagNumber(2)
  void clearChatId() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get type => $_getIZ(2);
  @$pb.TagNumber(3)
  set type($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  ChatCallReq_Opt get opt => $_getN(3);
  @$pb.TagNumber(4)
  set opt(ChatCallReq_Opt v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasOpt() => $_has(3);
  @$pb.TagNumber(4)
  void clearOpt() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get rejectReason => $_getIZ(4);
  @$pb.TagNumber(5)
  set rejectReason($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRejectReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearRejectReason() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get duration => $_getIZ(5);
  @$pb.TagNumber(6)
  set duration($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => clearField(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
