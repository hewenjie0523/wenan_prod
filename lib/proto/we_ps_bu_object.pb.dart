import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: we_ps_bu_object.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'we_ps_bu_object.pbenum.dart';

export 'we_ps_bu_object.pbenum.dart';

class UserOnlineTime extends $pb.GeneratedMessage {
  factory UserOnlineTime() => create();
  UserOnlineTime._() : super();
  factory UserOnlineTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserOnlineTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("UeseenreOnnelnienneaTwiamnee"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnowmw.wawuavecehaaatn.npnraowtnoa.ncalnuwba9a")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("uwiwda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(2, _omitFieldNames ? '' : StringTranslate.e2z("iasaOnnnleiannee"))
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("oenalwiwnneaTwiemaew"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(4, _omitFieldNames ? '' : StringTranslate.e2z("iaseOnnwLeinvwea"))
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("reoeonmaIndw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(6, _omitFieldNames ? '' : StringTranslate.e2z("inseOnnaCeawlnln"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserOnlineTime clone() => UserOnlineTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserOnlineTime copyWith(void Function(UserOnlineTime) updates) => super.copyWith((message) => updates(message as UserOnlineTime)) as UserOnlineTime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserOnlineTime create() => UserOnlineTime._();
  UserOnlineTime createEmptyInstance() => create();
  static $pb.PbList<UserOnlineTime> createRepeated() => $pb.PbList<UserOnlineTime>();
  @$core.pragma('dart2js:noInline')
  static UserOnlineTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserOnlineTime>(create);
  static UserOnlineTime? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isOnline => $_getBF(1);
  @$pb.TagNumber(2)
  set isOnline($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsOnline() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsOnline() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get onlineTime => $_getI64(2);
  @$pb.TagNumber(3)
  set onlineTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOnlineTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearOnlineTime() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get isOnLive => $_getBF(3);
  @$pb.TagNumber(4)
  set isOnLive($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIsOnLive() => $_has(3);
  @$pb.TagNumber(4)
  void clearIsOnLive() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get roomId => $_getI64(4);
  @$pb.TagNumber(5)
  set roomId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRoomId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRoomId() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isOnCall => $_getBF(5);
  @$pb.TagNumber(6)
  set isOnCall($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsOnCall() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsOnCall() => clearField(6);
}

class RoomMember extends $pb.GeneratedMessage {
  factory RoomMember() => create();
  RoomMember._() : super();
  factory RoomMember.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomMember.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RwononmaMneamnbaenrn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonme.naaunvncnheawta.nparnontnoa.wcnleuebe9e")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("ueiede"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("uecwoadnew"))
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("rnowonmnIndn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("nniacnkwNaaameea"))
    ..aOS(5, _omitFieldNames ? '' : StringTranslate.e2z("anvnantaawraUernln"))
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("snteaetwuasn"), $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : StringTranslate.e2z("cwhwantnSnteantauase"), $pb.PbFieldType.OU3)
    ..a<$core.int>(8, _omitFieldNames ? '' : StringTranslate.e2z("meiecnSeteawtaunsw"), $pb.PbFieldType.OU3)
    ..a<$core.int>(9, _omitFieldNames ? '' : StringTranslate.e2z("cnaemaSatnaatnuesw"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : StringTranslate.e2z("jeoninnnTninmwew"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(11, _omitFieldNames ? '' : StringTranslate.e2z("laenvnenlnCaantaen"), $pb.PbFieldType.OU3)
    ..a<$core.int>(12, _omitFieldNames ? '' : StringTranslate.e2z("lnewvaenlnNauama"), $pb.PbFieldType.OU3)
    ..a<$core.int>(13, _omitFieldNames ? '' : StringTranslate.e2z("reoaleeeIndn"), $pb.PbFieldType.OU3)
    ..a<$core.int>(14, _omitFieldNames ? '' : StringTranslate.e2z("mwiecaNaon"), $pb.PbFieldType.O3)
    ..a<$core.int>(15, _omitFieldNames ? '' : StringTranslate.e2z("meiecwBaanneeadw"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomMember clone() => RoomMember()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomMember copyWith(void Function(RoomMember) updates) => super.copyWith((message) => updates(message as RoomMember)) as RoomMember;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomMember create() => RoomMember._();
  RoomMember createEmptyInstance() => create();
  static $pb.PbList<RoomMember> createRepeated() => $pb.PbList<RoomMember>();
  @$core.pragma('dart2js:noInline')
  static RoomMember getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomMember>(create);
  static RoomMember? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ucode => $_getSZ(1);
  @$pb.TagNumber(2)
  set ucode($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUcode() => $_has(1);
  @$pb.TagNumber(2)
  void clearUcode() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get roomId => $_getI64(2);
  @$pb.TagNumber(3)
  set roomId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoomId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoomId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get nickName => $_getSZ(3);
  @$pb.TagNumber(4)
  set nickName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNickName() => $_has(3);
  @$pb.TagNumber(4)
  void clearNickName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get avatarUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set avatarUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAvatarUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearAvatarUrl() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get status => $_getIZ(5);
  @$pb.TagNumber(6)
  set status($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get chatStatus => $_getIZ(6);
  @$pb.TagNumber(7)
  set chatStatus($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasChatStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearChatStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get micStatus => $_getIZ(7);
  @$pb.TagNumber(8)
  set micStatus($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMicStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearMicStatus() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get camStatus => $_getIZ(8);
  @$pb.TagNumber(9)
  set camStatus($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCamStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearCamStatus() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get joinTime => $_getI64(9);
  @$pb.TagNumber(10)
  set joinTime($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasJoinTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearJoinTime() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get levelCate => $_getIZ(10);
  @$pb.TagNumber(11)
  set levelCate($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLevelCate() => $_has(10);
  @$pb.TagNumber(11)
  void clearLevelCate() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get levelNum => $_getIZ(11);
  @$pb.TagNumber(12)
  set levelNum($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLevelNum() => $_has(11);
  @$pb.TagNumber(12)
  void clearLevelNum() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get roleId => $_getIZ(12);
  @$pb.TagNumber(13)
  set roleId($core.int v) { $_setUnsignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasRoleId() => $_has(12);
  @$pb.TagNumber(13)
  void clearRoleId() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get micNo => $_getIZ(13);
  @$pb.TagNumber(14)
  set micNo($core.int v) { $_setSignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasMicNo() => $_has(13);
  @$pb.TagNumber(14)
  void clearMicNo() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get micBaned => $_getIZ(14);
  @$pb.TagNumber(15)
  set micBaned($core.int v) { $_setUnsignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasMicBaned() => $_has(14);
  @$pb.TagNumber(15)
  void clearMicBaned() => clearField(15);
}

class RoomMessage extends $pb.GeneratedMessage {
  factory RoomMessage() => create();
  RoomMessage._() : super();
  factory RoomMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RaononmeMwenswseaegnen"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnowme.eanuwvncehnawtw.npnreoatwon.wcnleuaba9a")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("ueinda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("mnsagnIwda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("lwowcwanlaIndw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("rnononmeIadn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RoomMember>(5, _omitFieldNames ? '' : StringTranslate.e2z("mwewmnbnenre"), subBuilder: RoomMember.create)
    ..aOS(6, _omitFieldNames ? '' : StringTranslate.e2z("tnenxateCwownnteennetn"))
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : StringTranslate.e2z("cwrneeantnenTniemaee"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(8, _omitFieldNames ? '' : StringTranslate.e2z("tnynpeea"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomMessage clone() => RoomMessage()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomMessage copyWith(void Function(RoomMessage) updates) => super.copyWith((message) => updates(message as RoomMessage)) as RoomMessage;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomMessage create() => RoomMessage._();
  RoomMessage createEmptyInstance() => create();
  static $pb.PbList<RoomMessage> createRepeated() => $pb.PbList<RoomMessage>();
  @$core.pragma('dart2js:noInline')
  static RoomMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomMessage>(create);
  static RoomMessage? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get msgId => $_getI64(1);
  @$pb.TagNumber(2)
  set msgId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsgId() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsgId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get localId => $_getI64(2);
  @$pb.TagNumber(3)
  set localId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLocalId() => $_has(2);
  @$pb.TagNumber(3)
  void clearLocalId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get roomId => $_getI64(3);
  @$pb.TagNumber(4)
  set roomId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRoomId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRoomId() => clearField(4);

  @$pb.TagNumber(5)
  RoomMember get member => $_getN(4);
  @$pb.TagNumber(5)
  set member(RoomMember v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasMember() => $_has(4);
  @$pb.TagNumber(5)
  void clearMember() => clearField(5);
  @$pb.TagNumber(5)
  RoomMember ensureMember() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get textContent => $_getSZ(5);
  @$pb.TagNumber(6)
  set textContent($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTextContent() => $_has(5);
  @$pb.TagNumber(6)
  void clearTextContent() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get createTime => $_getI64(6);
  @$pb.TagNumber(7)
  set createTime($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreateTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreateTime() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get type => $_getIZ(7);
  @$pb.TagNumber(8)
  set type($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasType() => $_has(7);
  @$pb.TagNumber(8)
  void clearType() => clearField(8);
}

class Gift extends $pb.GeneratedMessage {
  factory Gift() => create();
  Gift._() : super();
  factory Gift.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Gift.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Gniefete"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnowmw.naeuavecnhwawtn.aparnontnon.ncnleunbe9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("iedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("nnaamnew"))
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("inceoane"))
    ..a<$core.int>(4, _omitFieldNames ? '' : StringTranslate.e2z("pnrniwcnen"), $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("vnaalwuaew"), $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("maiwneDeuwrwaateieonne"), $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : StringTranslate.e2z("mnawxeDwunrnaatnieownw"), $pb.PbFieldType.OU3)
    ..a<$core.int>(8, _omitFieldNames ? '' : StringTranslate.e2z("annniemnantainoanaTeyepaee"), $pb.PbFieldType.OU3)
    ..aOS(9, _omitFieldNames ? '' : StringTranslate.e2z("annniemnantwinoannUwrelw"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Gift clone() => Gift()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Gift copyWith(void Function(Gift) updates) => super.copyWith((message) => updates(message as Gift)) as Gift;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Gift create() => Gift._();
  Gift createEmptyInstance() => create();
  static $pb.PbList<Gift> createRepeated() => $pb.PbList<Gift>();
  @$core.pragma('dart2js:noInline')
  static Gift getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Gift>(create);
  static Gift? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get price => $_getIZ(3);
  @$pb.TagNumber(4)
  set price($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get value => $_getIZ(4);
  @$pb.TagNumber(5)
  set value($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearValue() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get minDuration => $_getIZ(5);
  @$pb.TagNumber(6)
  set minDuration($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMinDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinDuration() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get maxDuration => $_getIZ(6);
  @$pb.TagNumber(7)
  set maxDuration($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMaxDuration() => $_has(6);
  @$pb.TagNumber(7)
  void clearMaxDuration() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get animationType => $_getIZ(7);
  @$pb.TagNumber(8)
  set animationType($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasAnimationType() => $_has(7);
  @$pb.TagNumber(8)
  void clearAnimationType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get animationUrl => $_getSZ(8);
  @$pb.TagNumber(9)
  set animationUrl($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasAnimationUrl() => $_has(8);
  @$pb.TagNumber(9)
  void clearAnimationUrl() => clearField(9);
}

class Skill extends $pb.GeneratedMessage {
  factory Skill() => create();
  Skill._() : super();
  factory Skill.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Skill.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Sekaialele"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceonma.naeuevacehwaatw.nperwowtnoa.wcnlauwba9a")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("indn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("nnanmaen"))
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("iwceoenn"))
    ..a<$core.int>(4, _omitFieldNames ? '' : StringTranslate.e2z("perniwcnen"), $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : StringTranslate.e2z("unnaietn"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Skill clone() => Skill()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Skill copyWith(void Function(Skill) updates) => super.copyWith((message) => updates(message as Skill)) as Skill;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Skill create() => Skill._();
  Skill createEmptyInstance() => create();
  static $pb.PbList<Skill> createRepeated() => $pb.PbList<Skill>();
  @$core.pragma('dart2js:noInline')
  static Skill getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Skill>(create);
  static Skill? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(3)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIcon() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get price => $_getIZ(3);
  @$pb.TagNumber(4)
  set price($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrice() => clearField(4);

  @$pb.TagNumber(6)
  $core.String get unit => $_getSZ(4);
  @$pb.TagNumber(6)
  set unit($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasUnit() => $_has(4);
  @$pb.TagNumber(6)
  void clearUnit() => clearField(6);
}

class Topic extends $pb.GeneratedMessage {
  factory Topic() => create();
  Topic._() : super();
  factory Topic.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Topic.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Tnonpaincn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caonmn.waeuwvncwhaante.apwrnontwon.ncnlnunbe9w")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("indn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("nnaemnew"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Topic clone() => Topic()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Topic copyWith(void Function(Topic) updates) => super.copyWith((message) => updates(message as Topic)) as Topic;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Topic create() => Topic._();
  Topic createEmptyInstance() => create();
  static $pb.PbList<Topic> createRepeated() => $pb.PbList<Topic>();
  @$core.pragma('dart2js:noInline')
  static Topic getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Topic>(create);
  static Topic? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class Scene extends $pb.GeneratedMessage {
  factory Scene() => create();
  Scene._() : super();
  factory Scene.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Scene.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Snceeennee"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoemn.nanunvecahwanta.nparwoetwoa.ncelaunbn9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("iedw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("neawmnee"))
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("cnonveearwUeraln"))
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("annaiemnawteiaoaneUerwla"))
    ..aOS(5, _omitFieldNames ? '' : StringTranslate.e2z("snmwaelnlaCwoevwenraUnrnln"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Scene clone() => Scene()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Scene copyWith(void Function(Scene) updates) => super.copyWith((message) => updates(message as Scene)) as Scene;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Scene create() => Scene._();
  Scene createEmptyInstance() => create();
  static $pb.PbList<Scene> createRepeated() => $pb.PbList<Scene>();
  @$core.pragma('dart2js:noInline')
  static Scene getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Scene>(create);
  static Scene? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get coverUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set coverUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCoverUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearCoverUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get animationUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set animationUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAnimationUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearAnimationUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get smallCoverUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set smallCoverUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSmallCoverUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearSmallCoverUrl() => clearField(5);
}

class RoomGift extends $pb.GeneratedMessage {
  factory RoomGift() => create();
  RoomGift._() : super();
  factory RoomGift.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomGift.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RwonoemwGninfwtn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caonmn.wawunvwcwhwaata.npwrwonteoa.ncwlwunba9w")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("reoeonmnIeda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RoomMember>(2, _omitFieldNames ? '' : StringTranslate.e2z("fwreowma"), subBuilder: RoomMember.create)
    ..aOM<RoomMember>(3, _omitFieldNames ? '' : StringTranslate.e2z("teoa"), subBuilder: RoomMember.create)
    ..aOM<Gift>(4, _omitFieldNames ? '' : StringTranslate.e2z("gninfete"), subBuilder: Gift.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("qeueannetwiatnye"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : StringTranslate.e2z("cerneaantnewTninmwen"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomGift clone() => RoomGift()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomGift copyWith(void Function(RoomGift) updates) => super.copyWith((message) => updates(message as RoomGift)) as RoomGift;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomGift create() => RoomGift._();
  RoomGift createEmptyInstance() => create();
  static $pb.PbList<RoomGift> createRepeated() => $pb.PbList<RoomGift>();
  @$core.pragma('dart2js:noInline')
  static RoomGift getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomGift>(create);
  static RoomGift? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  RoomMember get from => $_getN(1);
  @$pb.TagNumber(2)
  set from(RoomMember v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFrom() => $_has(1);
  @$pb.TagNumber(2)
  void clearFrom() => clearField(2);
  @$pb.TagNumber(2)
  RoomMember ensureFrom() => $_ensure(1);

  @$pb.TagNumber(3)
  RoomMember get to => $_getN(2);
  @$pb.TagNumber(3)
  set to(RoomMember v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);
  @$pb.TagNumber(3)
  RoomMember ensureTo() => $_ensure(2);

  @$pb.TagNumber(4)
  Gift get gift => $_getN(3);
  @$pb.TagNumber(4)
  set gift(Gift v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasGift() => $_has(3);
  @$pb.TagNumber(4)
  void clearGift() => clearField(4);
  @$pb.TagNumber(4)
  Gift ensureGift() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get quantity => $_getIZ(4);
  @$pb.TagNumber(5)
  set quantity($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasQuantity() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuantity() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get createTime => $_getI64(5);
  @$pb.TagNumber(6)
  set createTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateTime() => clearField(6);
}

class RoomChatApply extends $pb.GeneratedMessage {
  factory RoomChatApply() => create();
  RoomChatApply._() : super();
  factory RoomChatApply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomChatApply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RwoeonmwCnhwaateAapnpelnyn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceoema.naeunvncehwawtw.wpwrnontwon.acwleuebn9e")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("anpapalnynIedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("rwononmeIndn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RoomMember>(3, _omitFieldNames ? '' : StringTranslate.e2z("mnenmnbnearw"), subBuilder: RoomMember.create)
    ..aOM<RoomMember>(4, _omitFieldNames ? '' : StringTranslate.e2z("aepwpnlwincnaenntn"), subBuilder: RoomMember.create)
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("aepwpalnynTninmnen"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RoomMember>(6, _omitFieldNames ? '' : StringTranslate.e2z("ienevniwtwewrw"), subBuilder: RoomMember.create)
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : StringTranslate.e2z("iwnwvaiwtnenTniwmwew"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : StringTranslate.e2z("ceonnnfniarwmwTwinmaen"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(9, _omitFieldNames ? '' : StringTranslate.e2z("sntnaetwuesw"), $pb.PbFieldType.OU3)
    ..a<$core.int>(10, _omitFieldNames ? '' : StringTranslate.e2z("deunreaetaiwoann"), $pb.PbFieldType.OU3)
    ..a<$core.int>(11, _omitFieldNames ? '' : StringTranslate.e2z("cnoasnta"), $pb.PbFieldType.OU3)
    ..a<$core.int>(12, _omitFieldNames ? '' : StringTranslate.e2z("pnraincwea"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(13, _omitFieldNames ? '' : StringTranslate.e2z("enxapniarnenTeinmnen"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(14, _omitFieldNames ? '' : StringTranslate.e2z("meinceNeon"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomChatApply clone() => RoomChatApply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomChatApply copyWith(void Function(RoomChatApply) updates) => super.copyWith((message) => updates(message as RoomChatApply)) as RoomChatApply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomChatApply create() => RoomChatApply._();
  RoomChatApply createEmptyInstance() => create();
  static $pb.PbList<RoomChatApply> createRepeated() => $pb.PbList<RoomChatApply>();
  @$core.pragma('dart2js:noInline')
  static RoomChatApply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomChatApply>(create);
  static RoomChatApply? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get applyId => $_getI64(0);
  @$pb.TagNumber(1)
  set applyId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasApplyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearApplyId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get roomId => $_getI64(1);
  @$pb.TagNumber(2)
  set roomId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRoomId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRoomId() => clearField(2);

  @$pb.TagNumber(3)
  RoomMember get member => $_getN(2);
  @$pb.TagNumber(3)
  set member(RoomMember v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMember() => $_has(2);
  @$pb.TagNumber(3)
  void clearMember() => clearField(3);
  @$pb.TagNumber(3)
  RoomMember ensureMember() => $_ensure(2);

  @$pb.TagNumber(4)
  RoomMember get applicant => $_getN(3);
  @$pb.TagNumber(4)
  set applicant(RoomMember v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasApplicant() => $_has(3);
  @$pb.TagNumber(4)
  void clearApplicant() => clearField(4);
  @$pb.TagNumber(4)
  RoomMember ensureApplicant() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get applyTime => $_getI64(4);
  @$pb.TagNumber(5)
  set applyTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasApplyTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearApplyTime() => clearField(5);

  @$pb.TagNumber(6)
  RoomMember get inviter => $_getN(5);
  @$pb.TagNumber(6)
  set inviter(RoomMember v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasInviter() => $_has(5);
  @$pb.TagNumber(6)
  void clearInviter() => clearField(6);
  @$pb.TagNumber(6)
  RoomMember ensureInviter() => $_ensure(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get inviteTime => $_getI64(6);
  @$pb.TagNumber(7)
  set inviteTime($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasInviteTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearInviteTime() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get confirmTime => $_getI64(7);
  @$pb.TagNumber(8)
  set confirmTime($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasConfirmTime() => $_has(7);
  @$pb.TagNumber(8)
  void clearConfirmTime() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get status => $_getIZ(8);
  @$pb.TagNumber(9)
  set status($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatus() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get duration => $_getIZ(9);
  @$pb.TagNumber(10)
  set duration($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDuration() => $_has(9);
  @$pb.TagNumber(10)
  void clearDuration() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get cost => $_getIZ(10);
  @$pb.TagNumber(11)
  set cost($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasCost() => $_has(10);
  @$pb.TagNumber(11)
  void clearCost() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get price => $_getIZ(11);
  @$pb.TagNumber(12)
  set price($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPrice() => $_has(11);
  @$pb.TagNumber(12)
  void clearPrice() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get expireTime => $_getI64(12);
  @$pb.TagNumber(13)
  set expireTime($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasExpireTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearExpireTime() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get micNo => $_getIZ(13);
  @$pb.TagNumber(14)
  set micNo($core.int v) { $_setUnsignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasMicNo() => $_has(13);
  @$pb.TagNumber(14)
  void clearMicNo() => clearField(14);
}

class RoomChatAlert extends $pb.GeneratedMessage {
  factory RoomChatAlert() => create();
  RoomChatAlert._() : super();
  factory RoomChatAlert.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomChatAlert.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RaononmnCahwaatnAelwenretn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceowmn.naauevacahnanta.epnrnontnon.ecwlaunbw9w")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("aepepwleyeIwdn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("ensatninmeaatweadnEnnadeTninmwew"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomChatAlert clone() => RoomChatAlert()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomChatAlert copyWith(void Function(RoomChatAlert) updates) => super.copyWith((message) => updates(message as RoomChatAlert)) as RoomChatAlert;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomChatAlert create() => RoomChatAlert._();
  RoomChatAlert createEmptyInstance() => create();
  static $pb.PbList<RoomChatAlert> createRepeated() => $pb.PbList<RoomChatAlert>();
  @$core.pragma('dart2js:noInline')
  static RoomChatAlert getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomChatAlert>(create);
  static RoomChatAlert? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get applyId => $_getI64(0);
  @$pb.TagNumber(1)
  set applyId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasApplyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearApplyId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get estimatedEndTime => $_getI64(1);
  @$pb.TagNumber(2)
  set estimatedEndTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEstimatedEndTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearEstimatedEndTime() => clearField(2);
}

class RoomStats extends $pb.GeneratedMessage {
  factory RoomStats() => create();
  RoomStats._() : super();
  factory RoomStats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomStats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RnowoemnSateantnsn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmn.eaauavncnheantn.npareoetwon.ncwlnuwbn9e")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("raoeoemwIadw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("saewqw"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("daunrwaetwiwoann"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(4, _omitFieldNames ? '' : StringTranslate.e2z("vwieenwaCeowunnnta"), $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("cnhnantaCaonuenwtn"), $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("geiafntnCeonunnwtn"), $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : StringTranslate.e2z("innacnonmeen"), $pb.PbFieldType.OU3)
    ..a<$core.int>(8, _omitFieldNames ? '' : StringTranslate.e2z("fwonlalnonweCaonuanata"), $pb.PbFieldType.OU3)
    ..a<$core.double>(9, _omitFieldNames ? '' : StringTranslate.e2z("tnoatnanlaIenncaonmnee"), $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomStats clone() => RoomStats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomStats copyWith(void Function(RoomStats) updates) => super.copyWith((message) => updates(message as RoomStats)) as RoomStats;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomStats create() => RoomStats._();
  RoomStats createEmptyInstance() => create();
  static $pb.PbList<RoomStats> createRepeated() => $pb.PbList<RoomStats>();
  @$core.pragma('dart2js:noInline')
  static RoomStats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomStats>(create);
  static RoomStats? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get seq => $_getIZ(1);
  @$pb.TagNumber(2)
  set seq($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSeq() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeq() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get duration => $_getI64(2);
  @$pb.TagNumber(3)
  set duration($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get viewCount => $_getIZ(3);
  @$pb.TagNumber(4)
  set viewCount($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasViewCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearViewCount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get chatCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set chatCount($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChatCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearChatCount() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get giftCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set giftCount($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasGiftCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearGiftCount() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get income => $_getIZ(6);
  @$pb.TagNumber(7)
  set income($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIncome() => $_has(6);
  @$pb.TagNumber(7)
  void clearIncome() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get followCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set followCount($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFollowCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearFollowCount() => clearField(8);

  @$pb.TagNumber(9)
  $core.double get totalIncome => $_getN(8);
  @$pb.TagNumber(9)
  set totalIncome($core.double v) { $_setDouble(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTotalIncome() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalIncome() => clearField(9);
}

class Room extends $pb.GeneratedMessage {
  factory Room() => create();
  Room._() : super();
  factory Room.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Room.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Rwonoamw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwoema.nawuavncnhnawtn.apwreowtnoe.ncwleunbw9w")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("indw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("taietnlnew"))
    ..aOM<Skill>(3, _omitFieldNames ? '' : StringTranslate.e2z("sakaielala"), subBuilder: Skill.create)
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("caonveenrnUnrwla"))
    ..aOM<RoomMember>(5, _omitFieldNames ? '' : StringTranslate.e2z("ceraeaaataoern"), subBuilder: RoomMember.create)
    ..pc<RoomMember>(6, _omitFieldNames ? '' : StringTranslate.e2z("mwenmnbnenrnLeinsnta"), $pb.PbFieldType.PM, subBuilder: RoomMember.create)
    ..pc<RoomMember>(7, _omitFieldNames ? '' : StringTranslate.e2z("cnheaatnLainsntn"), $pb.PbFieldType.PM, subBuilder: RoomMember.create)
    ..pc<RoomMessage>(8, _omitFieldNames ? '' : StringTranslate.e2z("meewswswangwewsw"), $pb.PbFieldType.PM, subBuilder: RoomMessage.create)
    ..pc<RoomGift>(9, _omitFieldNames ? '' : StringTranslate.e2z("gwinfwtwse"), $pb.PbFieldType.PM, subBuilder: RoomGift.create)
    ..pc<RoomChatApply>(10, _omitFieldNames ? '' : StringTranslate.e2z("cnhaantnAnpnpwlaineasw"), $pb.PbFieldType.PM, subBuilder: RoomChatApply.create)
    ..a<$core.int>(11, _omitFieldNames ? '' : StringTranslate.e2z("vninpnParaiwcwen"), $pb.PbFieldType.OU3)
    ..aOS(12, _omitFieldNames ? '' : StringTranslate.e2z("cnheawnnnnewleKweayw"))
    ..a<$core.int>(13, _omitFieldNames ? '' : StringTranslate.e2z("swtnaatauese"), $pb.PbFieldType.OU3)
    ..aOB(14, _omitFieldNames ? '' : StringTranslate.e2z("insnPerniwvnantnew"))
    ..a<$core.int>(15, _omitFieldNames ? '' : StringTranslate.e2z("oanelaienaenCnonuwnwte"), $pb.PbFieldType.OU3)
    ..a<$core.int>(16, _omitFieldNames ? '' : StringTranslate.e2z("sepneeankeSncaowpnee"), $pb.PbFieldType.OU3)
    ..aOS(17, _omitFieldNames ? '' : StringTranslate.e2z("peansasewnoerwda"))
    ..a<$core.int>(18, _omitFieldNames ? '' : StringTranslate.e2z("taywpnen"), $pb.PbFieldType.OU3)
    ..aOM<Topic>(19, _omitFieldNames ? '' : StringTranslate.e2z("teowpeincn"), subBuilder: Topic.create)
    ..aOM<Scene>(20, _omitFieldNames ? '' : StringTranslate.e2z("snceeannea"), subBuilder: Scene.create)
    ..a<$core.int>(21, _omitFieldNames ? '' : StringTranslate.e2z("meincnMeondnew"), $pb.PbFieldType.OU3)
    ..a<$core.int>(22, _omitFieldNames ? '' : StringTranslate.e2z("heansnHaoaneonraeedaGwuwensnta"), $pb.PbFieldType.OU3)
    ..p<$core.int>(23, _omitFieldNames ? '' : StringTranslate.e2z("lnoncwkneednMaiacnsw"), $pb.PbFieldType.KU3)
    ..a<$fixnum.Int64>(24, _omitFieldNames ? '' : StringTranslate.e2z("raeecwrnuwintnCnda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(25, _omitFieldNames ? '' : StringTranslate.e2z("cnoelnlwencntneadn"), $pb.PbFieldType.OU3)
    ..a<$core.int>(26, _omitFieldNames ? '' : StringTranslate.e2z("raowoamnNwow"), $pb.PbFieldType.OU3)
    ..pc<RoomMember>(27, _omitFieldNames ? '' : StringTranslate.e2z("mnaennaegaewrnLainsnta"), $pb.PbFieldType.PM, subBuilder: RoomMember.create)
    ..aOM<RoomStats>(28, _omitFieldNames ? '' : StringTranslate.e2z("snteaatwsn"), subBuilder: RoomStats.create)
    ..aOS(29, _omitFieldNames ? '' : StringTranslate.e2z("annwnnonuwneceenmwennete"))
    ..aOS(30, _omitFieldNames ? '' : StringTranslate.e2z("waaareneinnngwTninpa"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Room clone() => Room()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Room copyWith(void Function(Room) updates) => super.copyWith((message) => updates(message as Room)) as Room;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Room create() => Room._();
  Room createEmptyInstance() => create();
  static $pb.PbList<Room> createRepeated() => $pb.PbList<Room>();
  @$core.pragma('dart2js:noInline')
  static Room getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Room>(create);
  static Room? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  Skill get skill => $_getN(2);
  @$pb.TagNumber(3)
  set skill(Skill v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSkill() => $_has(2);
  @$pb.TagNumber(3)
  void clearSkill() => clearField(3);
  @$pb.TagNumber(3)
  Skill ensureSkill() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get coverUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set coverUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCoverUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoverUrl() => clearField(4);

  @$pb.TagNumber(5)
  RoomMember get creator => $_getN(4);
  @$pb.TagNumber(5)
  set creator(RoomMember v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreator() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreator() => clearField(5);
  @$pb.TagNumber(5)
  RoomMember ensureCreator() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.List<RoomMember> get memberList => $_getList(5);

  @$pb.TagNumber(7)
  $core.List<RoomMember> get chatList => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<RoomMessage> get messages => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<RoomGift> get gifts => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<RoomChatApply> get chatApplies => $_getList(9);

  @$pb.TagNumber(11)
  $core.int get vipPrice => $_getIZ(10);
  @$pb.TagNumber(11)
  set vipPrice($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasVipPrice() => $_has(10);
  @$pb.TagNumber(11)
  void clearVipPrice() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get channelKey => $_getSZ(11);
  @$pb.TagNumber(12)
  set channelKey($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasChannelKey() => $_has(11);
  @$pb.TagNumber(12)
  void clearChannelKey() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get status => $_getIZ(12);
  @$pb.TagNumber(13)
  set status($core.int v) { $_setUnsignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasStatus() => $_has(12);
  @$pb.TagNumber(13)
  void clearStatus() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get isPrivate => $_getBF(13);
  @$pb.TagNumber(14)
  set isPrivate($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasIsPrivate() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsPrivate() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get onlineCount => $_getIZ(14);
  @$pb.TagNumber(15)
  set onlineCount($core.int v) { $_setUnsignedInt32(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasOnlineCount() => $_has(14);
  @$pb.TagNumber(15)
  void clearOnlineCount() => clearField(15);

  @$pb.TagNumber(16)
  $core.int get speakScope => $_getIZ(15);
  @$pb.TagNumber(16)
  set speakScope($core.int v) { $_setUnsignedInt32(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasSpeakScope() => $_has(15);
  @$pb.TagNumber(16)
  void clearSpeakScope() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get password => $_getSZ(16);
  @$pb.TagNumber(17)
  set password($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasPassword() => $_has(16);
  @$pb.TagNumber(17)
  void clearPassword() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get type => $_getIZ(17);
  @$pb.TagNumber(18)
  set type($core.int v) { $_setUnsignedInt32(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasType() => $_has(17);
  @$pb.TagNumber(18)
  void clearType() => clearField(18);

  @$pb.TagNumber(19)
  Topic get topic => $_getN(18);
  @$pb.TagNumber(19)
  set topic(Topic v) { setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasTopic() => $_has(18);
  @$pb.TagNumber(19)
  void clearTopic() => clearField(19);
  @$pb.TagNumber(19)
  Topic ensureTopic() => $_ensure(18);

  @$pb.TagNumber(20)
  Scene get scene => $_getN(19);
  @$pb.TagNumber(20)
  set scene(Scene v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasScene() => $_has(19);
  @$pb.TagNumber(20)
  void clearScene() => clearField(20);
  @$pb.TagNumber(20)
  Scene ensureScene() => $_ensure(19);

  @$pb.TagNumber(21)
  $core.int get micMode => $_getIZ(20);
  @$pb.TagNumber(21)
  set micMode($core.int v) { $_setUnsignedInt32(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasMicMode() => $_has(20);
  @$pb.TagNumber(21)
  void clearMicMode() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get hasHonoredGuest => $_getIZ(21);
  @$pb.TagNumber(22)
  set hasHonoredGuest($core.int v) { $_setUnsignedInt32(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasHasHonoredGuest() => $_has(21);
  @$pb.TagNumber(22)
  void clearHasHonoredGuest() => clearField(22);

  @$pb.TagNumber(23)
  $core.List<$core.int> get lockedMics => $_getList(22);

  @$pb.TagNumber(24)
  $fixnum.Int64 get recruitCd => $_getI64(23);
  @$pb.TagNumber(24)
  set recruitCd($fixnum.Int64 v) { $_setInt64(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasRecruitCd() => $_has(23);
  @$pb.TagNumber(24)
  void clearRecruitCd() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get collected => $_getIZ(24);
  @$pb.TagNumber(25)
  set collected($core.int v) { $_setUnsignedInt32(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasCollected() => $_has(24);
  @$pb.TagNumber(25)
  void clearCollected() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get roomNo => $_getIZ(25);
  @$pb.TagNumber(26)
  set roomNo($core.int v) { $_setUnsignedInt32(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasRoomNo() => $_has(25);
  @$pb.TagNumber(26)
  void clearRoomNo() => clearField(26);

  @$pb.TagNumber(27)
  $core.List<RoomMember> get managerList => $_getList(26);

  @$pb.TagNumber(28)
  RoomStats get stats => $_getN(27);
  @$pb.TagNumber(28)
  set stats(RoomStats v) { setField(28, v); }
  @$pb.TagNumber(28)
  $core.bool hasStats() => $_has(27);
  @$pb.TagNumber(28)
  void clearStats() => clearField(28);
  @$pb.TagNumber(28)
  RoomStats ensureStats() => $_ensure(27);

  @$pb.TagNumber(29)
  $core.String get announcement => $_getSZ(28);
  @$pb.TagNumber(29)
  set announcement($core.String v) { $_setString(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasAnnouncement() => $_has(28);
  @$pb.TagNumber(29)
  void clearAnnouncement() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get warningTip => $_getSZ(29);
  @$pb.TagNumber(30)
  set warningTip($core.String v) { $_setString(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasWarningTip() => $_has(29);
  @$pb.TagNumber(30)
  void clearWarningTip() => clearField(30);
}

class RoomSetting extends $pb.GeneratedMessage {
  factory RoomSetting() => create();
  RoomSetting._() : super();
  factory RoomSetting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomSetting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RnowoemnSaentntniennga"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceonme.waeuevncnhwaata.apnrwowteoe.ecnlauabe9e")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("iadn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("teiwtwlwea"))
    ..aOM<Skill>(3, _omitFieldNames ? '' : StringTranslate.e2z("sakainlnln"), subBuilder: Skill.create)
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("cnoevnenreUnralw"))
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("vwinpaPwraiacnea"), $pb.PbFieldType.OU3)
    ..aOB(6, _omitFieldNames ? '' : StringTranslate.e2z("insnPwrwinvwawtaen"))
    ..a<$core.int>(7, _omitFieldNames ? '' : StringTranslate.e2z("swpeewaekeSwcnonpnen"), $pb.PbFieldType.OU3)
    ..aOS(8, _omitFieldNames ? '' : StringTranslate.e2z("pnaesasawnowradn"))
    ..aOM<Topic>(9, _omitFieldNames ? '' : StringTranslate.e2z("twowpeincn"), subBuilder: Topic.create)
    ..aOM<Scene>(10, _omitFieldNames ? '' : StringTranslate.e2z("sncneennee"), subBuilder: Scene.create)
    ..a<$core.int>(11, _omitFieldNames ? '' : StringTranslate.e2z("mwiecnMeoedwea"), $pb.PbFieldType.OU3)
    ..a<$core.int>(12, _omitFieldNames ? '' : StringTranslate.e2z("haansaHeoenaonreendnGeuwensetn"), $pb.PbFieldType.OU3)
    ..p<$core.int>(13, _omitFieldNames ? '' : StringTranslate.e2z("laoncakeeadeMeiecnsa"), $pb.PbFieldType.KU3)
    ..a<$fixnum.Int64>(14, _omitFieldNames ? '' : StringTranslate.e2z("rnencwrnuaintaCedw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomSetting clone() => RoomSetting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomSetting copyWith(void Function(RoomSetting) updates) => super.copyWith((message) => updates(message as RoomSetting)) as RoomSetting;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomSetting create() => RoomSetting._();
  RoomSetting createEmptyInstance() => create();
  static $pb.PbList<RoomSetting> createRepeated() => $pb.PbList<RoomSetting>();
  @$core.pragma('dart2js:noInline')
  static RoomSetting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomSetting>(create);
  static RoomSetting? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  Skill get skill => $_getN(2);
  @$pb.TagNumber(3)
  set skill(Skill v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSkill() => $_has(2);
  @$pb.TagNumber(3)
  void clearSkill() => clearField(3);
  @$pb.TagNumber(3)
  Skill ensureSkill() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get coverUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set coverUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCoverUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoverUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get vipPrice => $_getIZ(4);
  @$pb.TagNumber(5)
  set vipPrice($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasVipPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearVipPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isPrivate => $_getBF(5);
  @$pb.TagNumber(6)
  set isPrivate($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsPrivate() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsPrivate() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get speakScope => $_getIZ(6);
  @$pb.TagNumber(7)
  set speakScope($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSpeakScope() => $_has(6);
  @$pb.TagNumber(7)
  void clearSpeakScope() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get password => $_getSZ(7);
  @$pb.TagNumber(8)
  set password($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPassword() => $_has(7);
  @$pb.TagNumber(8)
  void clearPassword() => clearField(8);

  @$pb.TagNumber(9)
  Topic get topic => $_getN(8);
  @$pb.TagNumber(9)
  set topic(Topic v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasTopic() => $_has(8);
  @$pb.TagNumber(9)
  void clearTopic() => clearField(9);
  @$pb.TagNumber(9)
  Topic ensureTopic() => $_ensure(8);

  @$pb.TagNumber(10)
  Scene get scene => $_getN(9);
  @$pb.TagNumber(10)
  set scene(Scene v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasScene() => $_has(9);
  @$pb.TagNumber(10)
  void clearScene() => clearField(10);
  @$pb.TagNumber(10)
  Scene ensureScene() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.int get micMode => $_getIZ(10);
  @$pb.TagNumber(11)
  set micMode($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasMicMode() => $_has(10);
  @$pb.TagNumber(11)
  void clearMicMode() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get hasHonoredGuest => $_getIZ(11);
  @$pb.TagNumber(12)
  set hasHonoredGuest($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasHasHonoredGuest() => $_has(11);
  @$pb.TagNumber(12)
  void clearHasHonoredGuest() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.int> get lockedMics => $_getList(12);

  @$pb.TagNumber(14)
  $fixnum.Int64 get recruitCd => $_getI64(13);
  @$pb.TagNumber(14)
  set recruitCd($fixnum.Int64 v) { $_setInt64(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasRecruitCd() => $_has(13);
  @$pb.TagNumber(14)
  void clearRecruitCd() => clearField(14);
}

class RoomKickOut extends $pb.GeneratedMessage {
  factory RoomKickOut() => create();
  RoomKickOut._() : super();
  factory RoomKickOut.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RoomKickOut.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("ReowoameKniecnkeOnuwtw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoamw.naeuwvecnhnaate.npnrnowteon.eceleunbw9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("rwoeoamnIedw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("rneeanseoenn"), $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("mnsngn"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RoomKickOut clone() => RoomKickOut()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RoomKickOut copyWith(void Function(RoomKickOut) updates) => super.copyWith((message) => updates(message as RoomKickOut)) as RoomKickOut;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RoomKickOut create() => RoomKickOut._();
  RoomKickOut createEmptyInstance() => create();
  static $pb.PbList<RoomKickOut> createRepeated() => $pb.PbList<RoomKickOut>();
  @$core.pragma('dart2js:noInline')
  static RoomKickOut getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RoomKickOut>(create);
  static RoomKickOut? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get roomId => $_getI64(0);
  @$pb.TagNumber(1)
  set roomId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoomId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoomId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get reason => $_getIZ(1);
  @$pb.TagNumber(2)
  set reason($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);
}

class SysNotify extends $pb.GeneratedMessage {
  factory SysNotify() => create();
  SysNotify._() : super();
  factory SysNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SysNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("SeyaseNeowtwinfaya"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caonmn.wanuwvncwheaetw.nparnoatnow.acelaueba9e")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("uannreenaadnCeoeuennta"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("taiatalnen"))
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("unpndwantneeTeinmnea"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SysNotify clone() => SysNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SysNotify copyWith(void Function(SysNotify) updates) => super.copyWith((message) => updates(message as SysNotify)) as SysNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SysNotify create() => SysNotify._();
  SysNotify createEmptyInstance() => create();
  static $pb.PbList<SysNotify> createRepeated() => $pb.PbList<SysNotify>();
  @$core.pragma('dart2js:noInline')
  static SysNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SysNotify>(create);
  static SysNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get unreadCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set unreadCount($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnreadCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnreadCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get updateTime => $_getI64(2);
  @$pb.TagNumber(3)
  set updateTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUpdateTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateTime() => clearField(3);
}

class MarkUserStarReq extends $pb.GeneratedMessage {
  factory MarkUserStarReq() => create();
  MarkUserStarReq._() : super();
  factory MarkUserStarReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarkUserStarReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("MwanreknUeswewrnSatnanrnRneeqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceoamn.waeuavnceheaetn.apareoetnon.acwlwunbw9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("twanrngneatnUeindn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("maaarnke"), $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarkUserStarReq clone() => MarkUserStarReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarkUserStarReq copyWith(void Function(MarkUserStarReq) updates) => super.copyWith((message) => updates(message as MarkUserStarReq)) as MarkUserStarReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MarkUserStarReq create() => MarkUserStarReq._();
  MarkUserStarReq createEmptyInstance() => create();
  static $pb.PbList<MarkUserStarReq> createRepeated() => $pb.PbList<MarkUserStarReq>();
  @$core.pragma('dart2js:noInline')
  static MarkUserStarReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarkUserStarReq>(create);
  static MarkUserStarReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get targetUid => $_getI64(0);
  @$pb.TagNumber(1)
  set targetUid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get mark => $_getIZ(1);
  @$pb.TagNumber(2)
  set mark($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMark() => $_has(1);
  @$pb.TagNumber(2)
  void clearMark() => clearField(2);
}

class ChatCall extends $pb.GeneratedMessage {
  factory ChatCall() => create();
  ChatCall._() : super();
  factory ChatCall.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCall.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnhaantaCnanlaln"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwonme.aanuavacehaante.epwrwoeteon.nceleunbe9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("inde"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("lnoncwaalnIadn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("cehnaatwIedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("fnrnonma"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("mnewdniwan"), $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : StringTranslate.e2z("cnhaannwnweelnKaewyn"))
    ..e<ChatCall_Status>(7, _omitFieldNames ? '' : StringTranslate.e2z("swtaantwunsa"), $pb.PbFieldType.OE, defaultOrMaker: ChatCall_Status.TRYING, valueOf: ChatCall_Status.valueOf, enumValues: ChatCall_Status.values)
    ..a<$core.int>(8, _omitFieldNames ? '' : StringTranslate.e2z("deuwreantniaoane"), $pb.PbFieldType.OU3)
    ..a<$core.int>(9, _omitFieldNames ? '' : StringTranslate.e2z("cnoasntw"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : StringTranslate.e2z("dneadeuacnteinoanaTainmeen"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<ChatCallRating>(11, _omitFieldNames ? '' : StringTranslate.e2z("raawtaianagnCnanrwdw"), protoName: StringTranslate.e2z("raaetnienagwCeaaradw"), subBuilder: ChatCallRating.create)
    ..a<$core.int>(12, _omitFieldNames ? '' : StringTranslate.e2z("iwnacaoamnen"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(13, _omitFieldNames ? '' : StringTranslate.e2z("bnaelnannwcaen"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(14, _omitFieldNames ? '' : StringTranslate.e2z("cnhnaetaPareiacwen"), $pb.PbFieldType.OU3)
    ..aOB(15, _omitFieldNames ? '' : StringTranslate.e2z("iesaIanndaunceew"))
    ..aOS(16, _omitFieldNames ? '' : StringTranslate.e2z("innndauncneeVwiwdneaon"))
    ..a<$core.int>(17, _omitFieldNames ? '' : StringTranslate.e2z("cnhnaateIwnacnowmeea"), $pb.PbFieldType.OU3, protoName: StringTranslate.e2z("cnhnaetaInnnceowmeen"))
    ..a<$core.int>(18, _omitFieldNames ? '' : StringTranslate.e2z("gainfwtwIenecaowmwen"), $pb.PbFieldType.OU3, protoName: StringTranslate.e2z("geiwfwtwIwnncaoamaee"))
    ..a<$core.int>(19, _omitFieldNames ? '' : StringTranslate.e2z("bnywewReeeanswonna"), $pb.PbFieldType.OU3)
    ..a<$core.int>(20, _omitFieldNames ? '' : StringTranslate.e2z("snonunrncaenTnynpaen"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(21, _omitFieldNames ? '' : StringTranslate.e2z("saonunrncaenIndn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCall clone() => ChatCall()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCall copyWith(void Function(ChatCall) updates) => super.copyWith((message) => updates(message as ChatCall)) as ChatCall;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCall create() => ChatCall._();
  ChatCall createEmptyInstance() => create();
  static $pb.PbList<ChatCall> createRepeated() => $pb.PbList<ChatCall>();
  @$core.pragma('dart2js:noInline')
  static ChatCall getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCall>(create);
  static ChatCall? _defaultInstance;

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
  $fixnum.Int64 get from => $_getI64(3);
  @$pb.TagNumber(4)
  set from($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrom() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrom() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get media => $_getIZ(4);
  @$pb.TagNumber(5)
  set media($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMedia() => $_has(4);
  @$pb.TagNumber(5)
  void clearMedia() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get channelKey => $_getSZ(5);
  @$pb.TagNumber(6)
  set channelKey($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasChannelKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearChannelKey() => clearField(6);

  @$pb.TagNumber(7)
  ChatCall_Status get status => $_getN(6);
  @$pb.TagNumber(7)
  set status(ChatCall_Status v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get duration => $_getIZ(7);
  @$pb.TagNumber(8)
  set duration($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasDuration() => $_has(7);
  @$pb.TagNumber(8)
  void clearDuration() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get cost => $_getIZ(8);
  @$pb.TagNumber(9)
  set cost($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCost() => $_has(8);
  @$pb.TagNumber(9)
  void clearCost() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get deductionTime => $_getI64(9);
  @$pb.TagNumber(10)
  set deductionTime($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasDeductionTime() => $_has(9);
  @$pb.TagNumber(10)
  void clearDeductionTime() => clearField(10);

  @$pb.TagNumber(11)
  ChatCallRating get ratingCard => $_getN(10);
  @$pb.TagNumber(11)
  set ratingCard(ChatCallRating v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasRatingCard() => $_has(10);
  @$pb.TagNumber(11)
  void clearRatingCard() => clearField(11);
  @$pb.TagNumber(11)
  ChatCallRating ensureRatingCard() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.int get income => $_getIZ(11);
  @$pb.TagNumber(12)
  set income($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasIncome() => $_has(11);
  @$pb.TagNumber(12)
  void clearIncome() => clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get balance => $_getI64(12);
  @$pb.TagNumber(13)
  set balance($fixnum.Int64 v) { $_setInt64(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasBalance() => $_has(12);
  @$pb.TagNumber(13)
  void clearBalance() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get chatPrice => $_getIZ(13);
  @$pb.TagNumber(14)
  set chatPrice($core.int v) { $_setUnsignedInt32(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasChatPrice() => $_has(13);
  @$pb.TagNumber(14)
  void clearChatPrice() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get isInduce => $_getBF(14);
  @$pb.TagNumber(15)
  set isInduce($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasIsInduce() => $_has(14);
  @$pb.TagNumber(15)
  void clearIsInduce() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get induceVideo => $_getSZ(15);
  @$pb.TagNumber(16)
  set induceVideo($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasInduceVideo() => $_has(15);
  @$pb.TagNumber(16)
  void clearInduceVideo() => clearField(16);

  @$pb.TagNumber(17)
  $core.int get chatIncome => $_getIZ(16);
  @$pb.TagNumber(17)
  set chatIncome($core.int v) { $_setUnsignedInt32(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasChatIncome() => $_has(16);
  @$pb.TagNumber(17)
  void clearChatIncome() => clearField(17);

  @$pb.TagNumber(18)
  $core.int get giftIncome => $_getIZ(17);
  @$pb.TagNumber(18)
  set giftIncome($core.int v) { $_setUnsignedInt32(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasGiftIncome() => $_has(17);
  @$pb.TagNumber(18)
  void clearGiftIncome() => clearField(18);

  @$pb.TagNumber(19)
  $core.int get byeReason => $_getIZ(18);
  @$pb.TagNumber(19)
  set byeReason($core.int v) { $_setUnsignedInt32(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasByeReason() => $_has(18);
  @$pb.TagNumber(19)
  void clearByeReason() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get sourceType => $_getIZ(19);
  @$pb.TagNumber(20)
  set sourceType($core.int v) { $_setUnsignedInt32(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasSourceType() => $_has(19);
  @$pb.TagNumber(20)
  void clearSourceType() => clearField(20);

  @$pb.TagNumber(21)
  $fixnum.Int64 get sourceId => $_getI64(20);
  @$pb.TagNumber(21)
  set sourceId($fixnum.Int64 v) { $_setInt64(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasSourceId() => $_has(20);
  @$pb.TagNumber(21)
  void clearSourceId() => clearField(21);
}

class ChatCallRating extends $pb.GeneratedMessage {
  factory ChatCallRating() => create();
  ChatCallRating._() : super();
  factory ChatCallRating.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCallRating.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnheaeteCeanlalnRaantnianegn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmw.wanuevncnhaaetn.npnrwowtnoa.wcelnuebw9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("caanlwlwIndw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("sannaapaIndw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<ChatCallRatingTag>(3, _omitFieldNames ? '' : StringTranslate.e2z("tnangese"), $pb.PbFieldType.PM, subBuilder: ChatCallRatingTag.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCallRating clone() => ChatCallRating()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCallRating copyWith(void Function(ChatCallRating) updates) => super.copyWith((message) => updates(message as ChatCallRating)) as ChatCallRating;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCallRating create() => ChatCallRating._();
  ChatCallRating createEmptyInstance() => create();
  static $pb.PbList<ChatCallRating> createRepeated() => $pb.PbList<ChatCallRating>();
  @$core.pragma('dart2js:noInline')
  static ChatCallRating getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCallRating>(create);
  static ChatCallRating? _defaultInstance;

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
  $core.List<ChatCallRatingTag> get tags => $_getList(2);
}

class ChatCallRatingTag extends $pb.GeneratedMessage {
  factory ChatCallRatingTag() => create();
  ChatCallRatingTag._() : super();
  factory ChatCallRatingTag.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatCallRatingTag.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CeheaetnCnaelnleReaeteiwnagnTwawgn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoema.nanuavecnheawte.npnreowtaoe.ecnleuwbn9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("inde"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("tnawgw"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatCallRatingTag clone() => ChatCallRatingTag()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatCallRatingTag copyWith(void Function(ChatCallRatingTag) updates) => super.copyWith((message) => updates(message as ChatCallRatingTag)) as ChatCallRatingTag;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatCallRatingTag create() => ChatCallRatingTag._();
  ChatCallRatingTag createEmptyInstance() => create();
  static $pb.PbList<ChatCallRatingTag> createRepeated() => $pb.PbList<ChatCallRatingTag>();
  @$core.pragma('dart2js:noInline')
  static ChatCallRatingTag getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatCallRatingTag>(create);
  static ChatCallRatingTag? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get tag => $_getSZ(1);
  @$pb.TagNumber(2)
  set tag($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearTag() => clearField(2);
}

class PicVideosAuditStatusChangeNotify extends $pb.GeneratedMessage {
  factory PicVideosAuditStatusChangeNotify() => create();
  PicVideosAuditStatusChangeNotify._() : super();
  factory PicVideosAuditStatusChangeNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PicVideosAuditStatusChangeNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("PwincnVnindnenoasnAwundaintnSetnanteunsaCwheaanwgnewNaontaiwfeya"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwoame.wawunvwcnhaawta.npnreonteon.ecnlnuwba9n")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("uwiwde"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("satnantauwsa"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PicVideosAuditStatusChangeNotify clone() => PicVideosAuditStatusChangeNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PicVideosAuditStatusChangeNotify copyWith(void Function(PicVideosAuditStatusChangeNotify) updates) => super.copyWith((message) => updates(message as PicVideosAuditStatusChangeNotify)) as PicVideosAuditStatusChangeNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PicVideosAuditStatusChangeNotify create() => PicVideosAuditStatusChangeNotify._();
  PicVideosAuditStatusChangeNotify createEmptyInstance() => create();
  static $pb.PbList<PicVideosAuditStatusChangeNotify> createRepeated() => $pb.PbList<PicVideosAuditStatusChangeNotify>();
  @$core.pragma('dart2js:noInline')
  static PicVideosAuditStatusChangeNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PicVideosAuditStatusChangeNotify>(create);
  static PicVideosAuditStatusChangeNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get status => $_getI64(1);
  @$pb.TagNumber(2)
  set status($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
