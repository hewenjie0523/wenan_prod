import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AuthReq extends $pb.GeneratedMessage {
  factory AuthReq() => create();
  AuthReq._() : super();
  factory AuthReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("AnuetnhaReewqw"), package:  $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwonme.eanunvncnhnanta.npwrnontaow.nbaaeseen")), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : StringTranslate.e2z("saenswsn"))
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("vnenrw"))
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("dnIwdw"))
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("mwoedaeala"))
    ..aOS(5, _omitFieldNames ? '' : StringTranslate.e2z("oesn"))
    ..aOS(6, _omitFieldNames ? '' : StringTranslate.e2z("tnsw"))
    ..aOS(7, _omitFieldNames ? '' : StringTranslate.e2z("sningaun"))
    ..a<$core.int>(8, _omitFieldNames ? '' : StringTranslate.e2z("pnVeenrnswieonnn"), $pb.PbFieldType.O3)
    ..aOS(9, _omitFieldNames ? '' : StringTranslate.e2z("lnaenwge"))
    ..aOS(10, _omitFieldNames ? '' : StringTranslate.e2z("peNnawmnew"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthReq clone() => AuthReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthReq copyWith(void Function(AuthReq) updates) => super.copyWith((message) => updates(message as AuthReq)) as AuthReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthReq create() => AuthReq._();
  AuthReq createEmptyInstance() => create();
  static $pb.PbList<AuthReq> createRepeated() => $pb.PbList<AuthReq>();
  @$core.pragma('dart2js:noInline')
  static AuthReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthReq>(create);
  static AuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sess => $_getSZ(0);
  @$pb.TagNumber(1)
  set sess($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSess() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ver => $_getSZ(1);
  @$pb.TagNumber(2)
  set ver($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVer() => $_has(1);
  @$pb.TagNumber(2)
  void clearVer() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dId => $_getSZ(2);
  @$pb.TagNumber(3)
  set dId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get model => $_getSZ(3);
  @$pb.TagNumber(4)
  set model($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasModel() => $_has(3);
  @$pb.TagNumber(4)
  void clearModel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get os => $_getSZ(4);
  @$pb.TagNumber(5)
  set os($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOs() => $_has(4);
  @$pb.TagNumber(5)
  void clearOs() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get ts => $_getSZ(5);
  @$pb.TagNumber(6)
  set ts($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTs() => $_has(5);
  @$pb.TagNumber(6)
  void clearTs() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sigu => $_getSZ(6);
  @$pb.TagNumber(7)
  set sigu($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSigu() => $_has(6);
  @$pb.TagNumber(7)
  void clearSigu() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get pVersion => $_getIZ(7);
  @$pb.TagNumber(8)
  set pVersion($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPVersion() => $_has(7);
  @$pb.TagNumber(8)
  void clearPVersion() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get lang => $_getSZ(8);
  @$pb.TagNumber(9)
  set lang($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLang() => $_has(8);
  @$pb.TagNumber(9)
  void clearLang() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get pName => $_getSZ(9);
  @$pb.TagNumber(10)
  set pName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPName() => $_has(9);
  @$pb.TagNumber(10)
  void clearPName() => clearField(10);
}

class SessionInvalidNotify extends $pb.GeneratedMessage {
  factory SessionInvalidNotify() => create();
  SessionInvalidNotify._() : super();
  factory SessionInvalidNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SessionInvalidNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SeewseswinoennIannvnaelnindaNnoatniefwyn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmn.nanunvwcehnaatn.wpwrnontnoa.nbeawsnew")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnoednen"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mwswgw"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SessionInvalidNotify clone() => SessionInvalidNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SessionInvalidNotify copyWith(void Function(SessionInvalidNotify) updates) => super.copyWith((message) => updates(message as SessionInvalidNotify)) as SessionInvalidNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionInvalidNotify create() => SessionInvalidNotify._();
  SessionInvalidNotify createEmptyInstance() => create();
  static $pb.PbList<SessionInvalidNotify> createRepeated() => $pb.PbList<SessionInvalidNotify>();
  @$core.pragma('dart2js:noInline')
  static SessionInvalidNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionInvalidNotify>(create);
  static SessionInvalidNotify? _defaultInstance;

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
}

class GuideAuthReq extends $pb.GeneratedMessage {
  factory GuideAuthReq() => create();
  GuideAuthReq._() : super();
  factory GuideAuthReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GuideAuthReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("GeuniwdwenAnuntnhnReeaqe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caowmn.nanunvwcehaawta.nperaontnon.wbaaesnen")), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : StringTranslate.e2z("uauwuninda"))
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("vaenre"))
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("dnIedn"))
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("mnoednenla"))
    ..aOS(5, _omitFieldNames ? '' : StringTranslate.e2z("onsn"))
    ..aOS(6, _omitFieldNames ? '' : StringTranslate.e2z("tesa"))
    ..aOS(7, _omitFieldNames ? '' : StringTranslate.e2z("sningnuw"))
    ..a<$core.int>(8, _omitFieldNames ? '' : StringTranslate.e2z("paVeenrwsninonnw"), $pb.PbFieldType.O3)
    ..aOS(9, _omitFieldNames ? '' : StringTranslate.e2z("lnannnge"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GuideAuthReq clone() => GuideAuthReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GuideAuthReq copyWith(void Function(GuideAuthReq) updates) => super.copyWith((message) => updates(message as GuideAuthReq)) as GuideAuthReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GuideAuthReq create() => GuideAuthReq._();
  GuideAuthReq createEmptyInstance() => create();
  static $pb.PbList<GuideAuthReq> createRepeated() => $pb.PbList<GuideAuthReq>();
  @$core.pragma('dart2js:noInline')
  static GuideAuthReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GuideAuthReq>(create);
  static GuideAuthReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get uuuid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uuuid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUuuid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUuuid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ver => $_getSZ(1);
  @$pb.TagNumber(2)
  set ver($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVer() => $_has(1);
  @$pb.TagNumber(2)
  void clearVer() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dId => $_getSZ(2);
  @$pb.TagNumber(3)
  set dId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get model => $_getSZ(3);
  @$pb.TagNumber(4)
  set model($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasModel() => $_has(3);
  @$pb.TagNumber(4)
  void clearModel() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get os => $_getSZ(4);
  @$pb.TagNumber(5)
  set os($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOs() => $_has(4);
  @$pb.TagNumber(5)
  void clearOs() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get ts => $_getSZ(5);
  @$pb.TagNumber(6)
  set ts($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTs() => $_has(5);
  @$pb.TagNumber(6)
  void clearTs() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sigu => $_getSZ(6);
  @$pb.TagNumber(7)
  set sigu($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSigu() => $_has(6);
  @$pb.TagNumber(7)
  void clearSigu() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get pVersion => $_getIZ(7);
  @$pb.TagNumber(8)
  set pVersion($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPVersion() => $_has(7);
  @$pb.TagNumber(8)
  void clearPVersion() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get lang => $_getSZ(8);
  @$pb.TagNumber(9)
  set lang($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLang() => $_has(8);
  @$pb.TagNumber(9)
  void clearLang() => clearField(9);
}

class AuthRsp extends $pb.GeneratedMessage {
  factory AuthRsp() => create();
  AuthRsp._() : super();
  factory AuthRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AuthRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("AnuwtehnRasnpe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceowmn.naauwvncwhnaeta.apernowteon.ebaawsaea")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnondeew"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mnsegw"))
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("neenendaUepngnrnaadeen"), $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("uwpegnraaednenInneterwon"))
    ..aOS(5, _omitFieldNames ? '' : StringTranslate.e2z("deUwrwlw"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AuthRsp clone() => AuthRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AuthRsp copyWith(void Function(AuthRsp) updates) => super.copyWith((message) => updates(message as AuthRsp)) as AuthRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthRsp create() => AuthRsp._();
  AuthRsp createEmptyInstance() => create();
  static $pb.PbList<AuthRsp> createRepeated() => $pb.PbList<AuthRsp>();
  @$core.pragma('dart2js:noInline')
  static AuthRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AuthRsp>(create);
  static AuthRsp? _defaultInstance;

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
  $core.int get needUpgrade => $_getIZ(2);
  @$pb.TagNumber(3)
  set needUpgrade($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNeedUpgrade() => $_has(2);
  @$pb.TagNumber(3)
  void clearNeedUpgrade() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get upgradeIntro => $_getSZ(3);
  @$pb.TagNumber(4)
  set upgradeIntro($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUpgradeIntro() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpgradeIntro() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get dUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set dUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearDUrl() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
