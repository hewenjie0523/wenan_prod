import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_object.proto
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

class User extends $pb.GeneratedMessage {
  factory User() => create();
  User._() : super();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Unsaenrn"), package:  $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoamn.nanunvncahnaetw.npwrwontwow.abeaasnew")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("ueindn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("naincnkwNnawmnea"))
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("dninsapwlaawynNaaamnen"))
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("aavnaeteanrnUnrale"))
    ..aOS(5, _omitFieldNames ? '' : StringTranslate.e2z("bninratnhndeaayn"))
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("geennndwenrn"), $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : StringTranslate.e2z("maoabeiwlwew"))
    ..a<$core.int>(8, _omitFieldNames ? '' : StringTranslate.e2z("rwenlwantninoann"), $pb.PbFieldType.O3)
    ..aOS(9, _omitFieldNames ? '' : StringTranslate.e2z("qwrwceondwenUnrele"))
    ..a<$core.int>(10, _omitFieldNames ? '' : StringTranslate.e2z("sntwawteuwse"), $pb.PbFieldType.O3)
    ..aOS(11, _omitFieldNames ? '' : StringTranslate.e2z("uacnondwew"))
    ..aOS(12, _omitFieldNames ? '' : StringTranslate.e2z("twangeJeSnOwNn"), protoName: StringTranslate.e2z("twaegaJaSnOeNn"))
    ..aOS(13, _omitFieldNames ? '' : StringTranslate.e2z("saiwgnnaantauaraee"))
    ..aOS(14, _omitFieldNames ? '' : 'constellation')
    ..aOM<$0.Any>(15, _omitFieldNames ? '' : StringTranslate.e2z("eaxataeennswinonnesn"), subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User)) as User;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get avatarUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set avatarUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAvatarUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearAvatarUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get birthday => $_getSZ(4);
  @$pb.TagNumber(5)
  set birthday($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBirthday() => $_has(4);
  @$pb.TagNumber(5)
  void clearBirthday() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get gender => $_getIZ(5);
  @$pb.TagNumber(6)
  set gender($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGender() => $_has(5);
  @$pb.TagNumber(6)
  void clearGender() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get mobile => $_getSZ(6);
  @$pb.TagNumber(7)
  set mobile($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMobile() => $_has(6);
  @$pb.TagNumber(7)
  void clearMobile() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get relation => $_getIZ(7);
  @$pb.TagNumber(8)
  set relation($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRelation() => $_has(7);
  @$pb.TagNumber(8)
  void clearRelation() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get qrcodeUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set qrcodeUrl($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasQrcodeUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearQrcodeUrl() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get status => $_getIZ(9);
  @$pb.TagNumber(10)
  set status($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get ucode => $_getSZ(10);
  @$pb.TagNumber(11)
  set ucode($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasUcode() => $_has(10);
  @$pb.TagNumber(11)
  void clearUcode() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get tagJSON => $_getSZ(11);
  @$pb.TagNumber(12)
  set tagJSON($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasTagJSON() => $_has(11);
  @$pb.TagNumber(12)
  void clearTagJSON() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get signature => $_getSZ(12);
  @$pb.TagNumber(13)
  set signature($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSignature() => $_has(12);
  @$pb.TagNumber(13)
  void clearSignature() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get constellation => $_getSZ(13);
  @$pb.TagNumber(14)
  set constellation($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasConstellation() => $_has(13);
  @$pb.TagNumber(14)
  void clearConstellation() => clearField(14);

  @$pb.TagNumber(15)
  $0.Any get extensions => $_getN(14);
  @$pb.TagNumber(15)
  set extensions($0.Any v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasExtensions() => $_has(14);
  @$pb.TagNumber(15)
  void clearExtensions() => clearField(15);
  @$pb.TagNumber(15)
  $0.Any ensureExtensions() => $_ensure(14);
}

class Location extends $pb.GeneratedMessage {
  factory Location() => create();
  Location._() : super();
  factory Location.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Location.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Lwoacnaeteinonnw"), package:  $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmw.eaauevwcahaaete.nparaoetnow.nbeansnea")), createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : StringTranslate.e2z("laonnngaintauadeee"), $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : StringTranslate.e2z("laantaintnuadaew"), $pb.PbFieldType.OD)
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("naanmeen"))
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("daewswcw"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Location clone() => Location()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Location copyWith(void Function(Location) updates) => super.copyWith((message) => updates(message as Location)) as Location;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Location create() => Location._();
  Location createEmptyInstance() => create();
  static $pb.PbList<Location> createRepeated() => $pb.PbList<Location>();
  @$core.pragma('dart2js:noInline')
  static Location getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Location>(create);
  static Location? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get longitude => $_getN(0);
  @$pb.TagNumber(1)
  set longitude($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLongitude() => $_has(0);
  @$pb.TagNumber(1)
  void clearLongitude() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get latitude => $_getN(1);
  @$pb.TagNumber(2)
  set latitude($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLatitude() => $_has(1);
  @$pb.TagNumber(2)
  void clearLatitude() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);
}

class Advertisement extends $pb.GeneratedMessage {
  factory Advertisement() => create();
  Advertisement._() : super();
  factory Advertisement.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Advertisement.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Andaveearntainsaewmnennnta"), package:  $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonme.aanuwvncnhnaate.wparaowteoe.wbaansaen")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("indw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("tnynpnen"), $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("iwmageUnraln"))
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("cwownwtwennetnUwrele"))
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("swteanrwteTeinmnen"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : StringTranslate.e2z("eanadnTeinmeen"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(7, _omitFieldNames ? '' : StringTranslate.e2z("rwenswiadnenneceeaTwiamnee"), $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Advertisement clone() => Advertisement()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Advertisement copyWith(void Function(Advertisement) updates) => super.copyWith((message) => updates(message as Advertisement)) as Advertisement;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Advertisement create() => Advertisement._();
  Advertisement createEmptyInstance() => create();
  static $pb.PbList<Advertisement> createRepeated() => $pb.PbList<Advertisement>();
  @$core.pragma('dart2js:noInline')
  static Advertisement getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Advertisement>(create);
  static Advertisement? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get type => $_getIZ(1);
  @$pb.TagNumber(2)
  set type($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imgUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set imgUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImgUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearImgUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get contentUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set contentUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContentUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearContentUrl() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get startTime => $_getI64(4);
  @$pb.TagNumber(5)
  set startTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStartTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearStartTime() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get endTime => $_getI64(5);
  @$pb.TagNumber(6)
  set endTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasEndTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearEndTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get residenceTime => $_getIZ(6);
  @$pb.TagNumber(7)
  set residenceTime($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasResidenceTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearResidenceTime() => clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
