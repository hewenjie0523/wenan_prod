import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_common.proto
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

export 'we_ps_common.pbenum.dart';

class CommonRsp extends $pb.GeneratedMessage {
  factory CommonRsp() => create();
  CommonRsp._() : super();
  factory CommonRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommonRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnoemnmeownaRnsepw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caoema.eanunvncehaaatn.nparaontnoa.ebwanseea")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("cwondnen"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mnsngn"))
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("onreingwinnnaeleMnswgeCeantaee"), $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : StringTranslate.e2z("oerningniwnnaalaMnswgaTnywpaen"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommonRsp clone() => CommonRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommonRsp copyWith(void Function(CommonRsp) updates) => super.copyWith((message) => updates(message as CommonRsp)) as CommonRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonRsp create() => CommonRsp._();
  CommonRsp createEmptyInstance() => create();
  static $pb.PbList<CommonRsp> createRepeated() => $pb.PbList<CommonRsp>();
  @$core.pragma('dart2js:noInline')
  static CommonRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommonRsp>(create);
  static CommonRsp? _defaultInstance;

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
  $core.int get originalMsgCate => $_getIZ(2);
  @$pb.TagNumber(3)
  set originalMsgCate($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOriginalMsgCate() => $_has(2);
  @$pb.TagNumber(3)
  void clearOriginalMsgCate() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get originalMsgType => $_getIZ(3);
  @$pb.TagNumber(4)
  set originalMsgType($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOriginalMsgType() => $_has(3);
  @$pb.TagNumber(4)
  void clearOriginalMsgType() => clearField(4);
}

class CommonACK extends $pb.GeneratedMessage {
  factory CommonACK() => create();
  CommonACK._() : super();
  factory CommonACK.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommonACK.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnonmwmwoenwAaCnKw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwonmn.wawuevncwhnaeta.epereoetnon.abaansnen")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("caondnen"), $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("oarwingninnnanlwMnsngaCaaatnen"), $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("owrningeinnnaelwMnsngaTnyepnee"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommonACK clone() => CommonACK()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommonACK copyWith(void Function(CommonACK) updates) => super.copyWith((message) => updates(message as CommonACK)) as CommonACK;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonACK create() => CommonACK._();
  CommonACK createEmptyInstance() => create();
  static $pb.PbList<CommonACK> createRepeated() => $pb.PbList<CommonACK>();
  @$core.pragma('dart2js:noInline')
  static CommonACK getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommonACK>(create);
  static CommonACK? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get originalMsgCate => $_getIZ(1);
  @$pb.TagNumber(2)
  set originalMsgCate($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOriginalMsgCate() => $_has(1);
  @$pb.TagNumber(2)
  void clearOriginalMsgCate() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get originalMsgType => $_getIZ(2);
  @$pb.TagNumber(3)
  set originalMsgType($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOriginalMsgType() => $_has(2);
  @$pb.TagNumber(3)
  void clearOriginalMsgType() => clearField(3);
}

class CommonServiceErr extends $pb.GeneratedMessage {
  factory CommonServiceErr() => create();
  CommonServiceErr._() : super();
  factory CommonServiceErr.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommonServiceErr.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CaonmnmnonnnSweerwvniwcaeaEwrnra"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoeme.eaauavncnhwaetn.apereontwow.nbnansnen")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("caowdnew"), $pb.PbFieldType.OU3)
    ..aOM<$0.Any>(2, _omitFieldNames ? '' : StringTranslate.e2z("owreingninnwawlnMnensasnaegnea"), subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommonServiceErr clone() => CommonServiceErr()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommonServiceErr copyWith(void Function(CommonServiceErr) updates) => super.copyWith((message) => updates(message as CommonServiceErr)) as CommonServiceErr;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonServiceErr create() => CommonServiceErr._();
  CommonServiceErr createEmptyInstance() => create();
  static $pb.PbList<CommonServiceErr> createRepeated() => $pb.PbList<CommonServiceErr>();
  @$core.pragma('dart2js:noInline')
  static CommonServiceErr getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommonServiceErr>(create);
  static CommonServiceErr? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $0.Any get originalMessage => $_getN(1);
  @$pb.TagNumber(2)
  set originalMessage($0.Any v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasOriginalMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearOriginalMessage() => clearField(2);
  @$pb.TagNumber(2)
  $0.Any ensureOriginalMessage() => $_ensure(1);
}

class CommonToastNotify extends $pb.GeneratedMessage {
  factory CommonToastNotify() => create();
  CommonToastNotify._() : super();
  factory CommonToastNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CommonToastNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnonmwmwoannTaoeaesntaNaontninfnya"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caoemn.waaunvwcnhnaatw.epnrwoataon.ebwawsnen")), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : StringTranslate.e2z("teintnlnen"))
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("swunbaTnintwlnew"))
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("inmngnUnraln"))
    ..a<$core.int>(4, _omitFieldNames ? '' : StringTranslate.e2z("ancntwiwoanaTeynpnen"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("onpetnInda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("rwewcnonmemwennndnTnywpnee"), $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : StringTranslate.e2z("deuwraantwieoanw"), $pb.PbFieldType.OU3)
    ..aOS(8, _omitFieldNames ? '' : StringTranslate.e2z("peawretnywKeeeye"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CommonToastNotify clone() => CommonToastNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CommonToastNotify copyWith(void Function(CommonToastNotify) updates) => super.copyWith((message) => updates(message as CommonToastNotify)) as CommonToastNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CommonToastNotify create() => CommonToastNotify._();
  CommonToastNotify createEmptyInstance() => create();
  static $pb.PbList<CommonToastNotify> createRepeated() => $pb.PbList<CommonToastNotify>();
  @$core.pragma('dart2js:noInline')
  static CommonToastNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CommonToastNotify>(create);
  static CommonToastNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get subTitle => $_getSZ(1);
  @$pb.TagNumber(2)
  set subTitle($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSubTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearSubTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imgUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imgUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImgUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImgUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get actionType => $_getIZ(3);
  @$pb.TagNumber(4)
  set actionType($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasActionType() => $_has(3);
  @$pb.TagNumber(4)
  void clearActionType() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get optId => $_getI64(4);
  @$pb.TagNumber(5)
  set optId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOptId() => $_has(4);
  @$pb.TagNumber(5)
  void clearOptId() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get recommendType => $_getIZ(5);
  @$pb.TagNumber(6)
  set recommendType($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRecommendType() => $_has(5);
  @$pb.TagNumber(6)
  void clearRecommendType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get duration => $_getIZ(6);
  @$pb.TagNumber(7)
  set duration($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDuration() => $_has(6);
  @$pb.TagNumber(7)
  void clearDuration() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get partyKey => $_getSZ(7);
  @$pb.TagNumber(8)
  set partyKey($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPartyKey() => $_has(7);
  @$pb.TagNumber(8)
  void clearPartyKey() => clearField(8);
}

class UserOnlinePSH extends $pb.GeneratedMessage {
  factory UserOnlinePSH() => create();
  UserOnlinePSH._() : super();
  factory UserOnlinePSH.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserOnlinePSH.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("UasnearnOanwlniennenPeSaHw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwonme.wanunvnceheaatn.npnrwonteoa.nbnansaea")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("uaiadn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserOnlinePSH clone() => UserOnlinePSH()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserOnlinePSH copyWith(void Function(UserOnlinePSH) updates) => super.copyWith((message) => updates(message as UserOnlinePSH)) as UserOnlinePSH;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOnlinePSH create() => UserOnlinePSH._();
  UserOnlinePSH createEmptyInstance() => create();
  static $pb.PbList<UserOnlinePSH> createRepeated() => $pb.PbList<UserOnlinePSH>();
  @$core.pragma('dart2js:noInline')
  static UserOnlinePSH getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserOnlinePSH>(create);
  static UserOnlinePSH? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class UserOfflinePSH extends $pb.GeneratedMessage {
  factory UserOfflinePSH() => create();
  UserOfflinePSH._() : super();
  factory UserOfflinePSH.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserOfflinePSH.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("UnseenrwOefwfelninnnenPnSaHa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwowma.nawunvacwhaawtn.nperaoetnon.wbnawsnea")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("uaiwde"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserOfflinePSH clone() => UserOfflinePSH()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserOfflinePSH copyWith(void Function(UserOfflinePSH) updates) => super.copyWith((message) => updates(message as UserOfflinePSH)) as UserOfflinePSH;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOfflinePSH create() => UserOfflinePSH._();
  UserOfflinePSH createEmptyInstance() => create();
  static $pb.PbList<UserOfflinePSH> createRepeated() => $pb.PbList<UserOfflinePSH>();
  @$core.pragma('dart2js:noInline')
  static UserOfflinePSH getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserOfflinePSH>(create);
  static UserOfflinePSH? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
