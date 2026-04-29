import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_im_object.proto
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
import 'we_ps_im_object.pbenum.dart';
import 'we_ps_object.pb.dart' as $2;

export 'we_ps_im_object.pbenum.dart';

class Chatbox extends $pb.GeneratedMessage {
  factory Chatbox() => create();
  Chatbox._() : super();
  factory Chatbox.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chatbox.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Cnhnawtwbwonxw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceonmn.waeunvncwhnante.npnrnoetnoe.aieme")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("iwdw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..e<Chatbox_Type>(2, _omitFieldNames ? '' : StringTranslate.e2z("tnywpnen"), $pb.PbFieldType.OE, defaultOrMaker: Chatbox_Type.SINGLE, valueOf: Chatbox_Type.valueOf, enumValues: Chatbox_Type.values)
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("nwanmnee"))
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("caoavnearnUernla"))
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("oewnnnewrn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("mweemebeeernCnonuanata"), $pb.PbFieldType.OU3)
    ..pc<$2.User>(7, _omitFieldNames ? '' : StringTranslate.e2z("maeamnbaenrnsn"), $pb.PbFieldType.PM, subBuilder: $2.User.create)
    ..aOS(8, _omitFieldNames ? '' : StringTranslate.e2z("qerecnoadnenUernln"))
    ..a<$core.int>(9, _omitFieldNames ? '' : StringTranslate.e2z("waeningehntn"), $pb.PbFieldType.O3)
    ..aOB(10, _omitFieldNames ? '' : StringTranslate.e2z("meueteeede"))
    ..a<$core.int>(11, _omitFieldNames ? '' : StringTranslate.e2z("unnernenandnCeonunnatw"), $pb.PbFieldType.O3)
    ..aInt64(12, _omitFieldNames ? '' : StringTranslate.e2z("uapednaateewTniwmwen"))
    ..aOS(13, _omitFieldNames ? '' : StringTranslate.e2z("aedadnintwieonnwanlnIwnafeoa"))
    ..aOB(14, _omitFieldNames ? '' : StringTranslate.e2z("iwsePnunbwlwiwce"))
    ..e<Chatbox_EventFrequency>(15, _omitFieldNames ? '' : StringTranslate.e2z("envaennetnFareenqnuneenncnya"), $pb.PbFieldType.OE, defaultOrMaker: Chatbox_EventFrequency.NEVER, valueOf: Chatbox_EventFrequency.valueOf, enumValues: Chatbox_EventFrequency.values)
    ..aOS(16, _omitFieldNames ? '' : StringTranslate.e2z("dnewswcwrniapntaiaoene"))
    ..aOM<$0.Any>(17, _omitFieldNames ? '' : StringTranslate.e2z("eexeteeennsniaonnnsn"), subBuilder: $0.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Chatbox clone() => Chatbox()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Chatbox copyWith(void Function(Chatbox) updates) => super.copyWith((message) => updates(message as Chatbox)) as Chatbox;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Chatbox create() => Chatbox._();
  Chatbox createEmptyInstance() => create();
  static $pb.PbList<Chatbox> createRepeated() => $pb.PbList<Chatbox>();
  @$core.pragma('dart2js:noInline')
  static Chatbox getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chatbox>(create);
  static Chatbox? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Chatbox_Type get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(Chatbox_Type v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get coverUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set coverUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCoverUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearCoverUrl() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get owner => $_getI64(4);
  @$pb.TagNumber(5)
  set owner($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOwner() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwner() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get memberCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set memberCount($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMemberCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearMemberCount() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$2.User> get members => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get qrcodeUrl => $_getSZ(7);
  @$pb.TagNumber(8)
  set qrcodeUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasQrcodeUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearQrcodeUrl() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get weight => $_getIZ(8);
  @$pb.TagNumber(9)
  set weight($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasWeight() => $_has(8);
  @$pb.TagNumber(9)
  void clearWeight() => clearField(9);

  @$pb.TagNumber(10)
  $core.bool get muted => $_getBF(9);
  @$pb.TagNumber(10)
  set muted($core.bool v) { $_setBool(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasMuted() => $_has(9);
  @$pb.TagNumber(10)
  void clearMuted() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get unreadCount => $_getIZ(10);
  @$pb.TagNumber(11)
  set unreadCount($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasUnreadCount() => $_has(10);
  @$pb.TagNumber(11)
  void clearUnreadCount() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get updateTime => $_getI64(11);
  @$pb.TagNumber(12)
  set updateTime($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasUpdateTime() => $_has(11);
  @$pb.TagNumber(12)
  void clearUpdateTime() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get additionalInfo => $_getSZ(12);
  @$pb.TagNumber(13)
  set additionalInfo($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasAdditionalInfo() => $_has(12);
  @$pb.TagNumber(13)
  void clearAdditionalInfo() => clearField(13);

  @$pb.TagNumber(14)
  $core.bool get isPublic => $_getBF(13);
  @$pb.TagNumber(14)
  set isPublic($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasIsPublic() => $_has(13);
  @$pb.TagNumber(14)
  void clearIsPublic() => clearField(14);

  @$pb.TagNumber(15)
  Chatbox_EventFrequency get eventFrequency => $_getN(14);
  @$pb.TagNumber(15)
  set eventFrequency(Chatbox_EventFrequency v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasEventFrequency() => $_has(14);
  @$pb.TagNumber(15)
  void clearEventFrequency() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get description => $_getSZ(15);
  @$pb.TagNumber(16)
  set description($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasDescription() => $_has(15);
  @$pb.TagNumber(16)
  void clearDescription() => clearField(16);

  @$pb.TagNumber(17)
  $0.Any get extensions => $_getN(16);
  @$pb.TagNumber(17)
  set extensions($0.Any v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasExtensions() => $_has(16);
  @$pb.TagNumber(17)
  void clearExtensions() => clearField(17);
  @$pb.TagNumber(17)
  $0.Any ensureExtensions() => $_ensure(16);
}

class Image extends $pb.GeneratedMessage {
  factory Image() => create();
  Image._() : super();
  factory Image.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Image.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Iemwaagnew"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnoamn.nanuevwcwhnanta.npwrnoetnow.winme")), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : StringTranslate.e2z("iemegnUnrnla"))
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("swmnawlwlnIemagaUnrwln"))
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("mnendnieuemwIwmwgwUernle"))
    ..a<$core.int>(4, _omitFieldNames ? '' : StringTranslate.e2z("sainznee"), $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("wneningwhetn"), $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("haeningwhwta"), $pb.PbFieldType.OU3)
    ..aOS(7, _omitFieldNames ? '' : StringTranslate.e2z("mniamaeaTnyapeen"))
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : StringTranslate.e2z("iede"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(9, _omitFieldNames ? '' : StringTranslate.e2z("knewyn"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Image clone() => Image()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Image copyWith(void Function(Image) updates) => super.copyWith((message) => updates(message as Image)) as Image;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Image create() => Image._();
  Image createEmptyInstance() => create();
  static $pb.PbList<Image> createRepeated() => $pb.PbList<Image>();
  @$core.pragma('dart2js:noInline')
  static Image getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Image>(create);
  static Image? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get imgUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set imgUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImgUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearImgUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get smallImgUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set smallImgUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSmallImgUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearSmallImgUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get mediumImgUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set mediumImgUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMediumImgUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearMediumImgUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get size => $_getIZ(3);
  @$pb.TagNumber(4)
  set size($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearSize() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get weight => $_getIZ(4);
  @$pb.TagNumber(5)
  set weight($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasWeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearWeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get height => $_getIZ(5);
  @$pb.TagNumber(6)
  set height($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearHeight() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get mimeType => $_getSZ(6);
  @$pb.TagNumber(7)
  set mimeType($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMimeType() => $_has(6);
  @$pb.TagNumber(7)
  void clearMimeType() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get id => $_getI64(7);
  @$pb.TagNumber(8)
  set id($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasId() => $_has(7);
  @$pb.TagNumber(8)
  void clearId() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get key => $_getSZ(8);
  @$pb.TagNumber(9)
  set key($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasKey() => $_has(8);
  @$pb.TagNumber(9)
  void clearKey() => clearField(9);
}

class Video extends $pb.GeneratedMessage {
  factory Video() => create();
  Video._() : super();
  factory Video.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Video.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Vniedneaon"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwonma.waauwvwcwhaawta.npareoataoe.wiamw")), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : StringTranslate.e2z("vaiednenonUwreln"))
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("ceonvweernUerelw"))
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("swmaaalaleCwowveewrnUwrale"))
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("meendaiauwmwCnonvnenrnUaralw"))
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("sniwznew"), $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("dwuwrwawteieonnw"), $pb.PbFieldType.OU3)
    ..aOS(7, _omitFieldNames ? '' : StringTranslate.e2z("meiamneaTeynpaen"))
    ..a<$core.int>(8, _omitFieldNames ? '' : StringTranslate.e2z("weiedntwhe"), $pb.PbFieldType.OU3)
    ..a<$core.int>(9, _omitFieldNames ? '' : StringTranslate.e2z("heewiwgahnta"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(10, _omitFieldNames ? '' : StringTranslate.e2z("iedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(11, _omitFieldNames ? '' : StringTranslate.e2z("kaewya"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Video clone() => Video()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Video copyWith(void Function(Video) updates) => super.copyWith((message) => updates(message as Video)) as Video;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Video create() => Video._();
  Video createEmptyInstance() => create();
  static $pb.PbList<Video> createRepeated() => $pb.PbList<Video>();
  @$core.pragma('dart2js:noInline')
  static Video getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Video>(create);
  static Video? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get videoUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set videoUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVideoUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearVideoUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get coverUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set coverUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCoverUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearCoverUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get smallCoverUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set smallCoverUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSmallCoverUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearSmallCoverUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mediumCoverUrl => $_getSZ(3);
  @$pb.TagNumber(4)
  set mediumCoverUrl($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMediumCoverUrl() => $_has(3);
  @$pb.TagNumber(4)
  void clearMediumCoverUrl() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get size => $_getIZ(4);
  @$pb.TagNumber(5)
  set size($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearSize() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get duration => $_getIZ(5);
  @$pb.TagNumber(6)
  set duration($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDuration() => $_has(5);
  @$pb.TagNumber(6)
  void clearDuration() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get mimeType => $_getSZ(6);
  @$pb.TagNumber(7)
  set mimeType($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMimeType() => $_has(6);
  @$pb.TagNumber(7)
  void clearMimeType() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get width => $_getIZ(7);
  @$pb.TagNumber(8)
  set width($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasWidth() => $_has(7);
  @$pb.TagNumber(8)
  void clearWidth() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get height => $_getIZ(8);
  @$pb.TagNumber(9)
  set height($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHeight() => $_has(8);
  @$pb.TagNumber(9)
  void clearHeight() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get id => $_getI64(9);
  @$pb.TagNumber(10)
  set id($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasId() => $_has(9);
  @$pb.TagNumber(10)
  void clearId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get key => $_getSZ(10);
  @$pb.TagNumber(11)
  set key($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasKey() => $_has(10);
  @$pb.TagNumber(11)
  void clearKey() => clearField(11);
}

class Voice extends $pb.GeneratedMessage {
  factory Voice() => create();
  Voice._() : super();
  factory Voice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Voice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Vnoainceea"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonme.aawunvncnheaetn.wparnontnon.eieme")), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : StringTranslate.e2z("veoeiecaeaUarwlw"))
    ..a<$core.int>(2, _omitFieldNames ? '' : StringTranslate.e2z("seieznew"), $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("dwuereanteinoanw"), $pb.PbFieldType.OU3)
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("meiameenTeynpeea"))
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("inda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(6, _omitFieldNames ? '' : StringTranslate.e2z("kweeye"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Voice clone() => Voice()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Voice copyWith(void Function(Voice) updates) => super.copyWith((message) => updates(message as Voice)) as Voice;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Voice create() => Voice._();
  Voice createEmptyInstance() => create();
  static $pb.PbList<Voice> createRepeated() => $pb.PbList<Voice>();
  @$core.pragma('dart2js:noInline')
  static Voice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Voice>(create);
  static Voice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get voiceUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set voiceUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVoiceUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoiceUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get size => $_getIZ(1);
  @$pb.TagNumber(2)
  set size($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearSize() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get duration => $_getIZ(2);
  @$pb.TagNumber(3)
  set duration($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDuration() => $_has(2);
  @$pb.TagNumber(3)
  void clearDuration() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mimeType => $_getSZ(3);
  @$pb.TagNumber(4)
  set mimeType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMimeType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMimeType() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get id => $_getI64(4);
  @$pb.TagNumber(5)
  set id($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasId() => $_has(4);
  @$pb.TagNumber(5)
  void clearId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get key => $_getSZ(5);
  @$pb.TagNumber(6)
  set key($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasKey() => $_has(5);
  @$pb.TagNumber(6)
  void clearKey() => clearField(6);
}

class RedPacket extends $pb.GeneratedMessage {
  factory RedPacket() => create();
  RedPacket._() : super();
  factory RedPacket.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RedPacket.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RwendwPeancwkwentn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonme.wawuavecehnantn.wpwraontwow.ainmw")), createEmptyInstance: create)
    ..e<RedPacket_PacketType>(1, _omitFieldNames ? '' : StringTranslate.e2z("tnywpeen"), $pb.PbFieldType.OE, defaultOrMaker: RedPacket_PacketType.NORMAL, valueOf: RedPacket_PacketType.valueOf, enumValues: RedPacket_PacketType.values)
    ..a<$core.double>(2, _omitFieldNames ? '' : StringTranslate.e2z("anmeonuenetn"), $pb.PbFieldType.OD)
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("mneeseseangwen"))
    ..a<$core.double>(4, _omitFieldNames ? '' : StringTranslate.e2z("unnaiataAamnoeunnate"), $pb.PbFieldType.OD)
    ..a<$core.int>(5, _omitFieldNames ? '' : StringTranslate.e2z("tnoetnanlwCwoauenatn"), $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : StringTranslate.e2z("rwewcweniaveeaCaonuennte"), $pb.PbFieldType.OU3)
    ..a<$core.double>(7, _omitFieldNames ? '' : StringTranslate.e2z("rneeceeainvwenAemaoeunnnta"), $pb.PbFieldType.OD)
    ..a<$core.int>(8, _omitFieldNames ? '' : StringTranslate.e2z("swtwantauasa"), $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : StringTranslate.e2z("iwdw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(10, _omitFieldNames ? '' : StringTranslate.e2z("neinceknNnaemnen"))
    ..aOS(11, _omitFieldNames ? '' : StringTranslate.e2z("aevnaetnaaraUaralw"))
    ..pc<RedPacketDetail>(12, _omitFieldNames ? '' : StringTranslate.e2z("deentnawielnsn"), $pb.PbFieldType.PM, subBuilder: RedPacketDetail.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RedPacket clone() => RedPacket()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RedPacket copyWith(void Function(RedPacket) updates) => super.copyWith((message) => updates(message as RedPacket)) as RedPacket;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RedPacket create() => RedPacket._();
  RedPacket createEmptyInstance() => create();
  static $pb.PbList<RedPacket> createRepeated() => $pb.PbList<RedPacket>();
  @$core.pragma('dart2js:noInline')
  static RedPacket getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RedPacket>(create);
  static RedPacket? _defaultInstance;

  @$pb.TagNumber(1)
  RedPacket_PacketType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RedPacket_PacketType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get unitAmount => $_getN(3);
  @$pb.TagNumber(4)
  set unitAmount($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUnitAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnitAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get totalCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set totalCount($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTotalCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalCount() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get receiveCount => $_getIZ(5);
  @$pb.TagNumber(6)
  set receiveCount($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasReceiveCount() => $_has(5);
  @$pb.TagNumber(6)
  void clearReceiveCount() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get receiveAmount => $_getN(6);
  @$pb.TagNumber(7)
  set receiveAmount($core.double v) { $_setDouble(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasReceiveAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearReceiveAmount() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get status => $_getIZ(7);
  @$pb.TagNumber(8)
  set status($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get id => $_getI64(8);
  @$pb.TagNumber(9)
  set id($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasId() => $_has(8);
  @$pb.TagNumber(9)
  void clearId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get nickName => $_getSZ(9);
  @$pb.TagNumber(10)
  set nickName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNickName() => $_has(9);
  @$pb.TagNumber(10)
  void clearNickName() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get avatarUrl => $_getSZ(10);
  @$pb.TagNumber(11)
  set avatarUrl($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasAvatarUrl() => $_has(10);
  @$pb.TagNumber(11)
  void clearAvatarUrl() => clearField(11);

  @$pb.TagNumber(12)
  $core.List<RedPacketDetail> get details => $_getList(11);
}

class RedPacketDetail extends $pb.GeneratedMessage {
  factory RedPacketDetail() => create();
  RedPacketDetail._() : super();
  factory RedPacketDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RedPacketDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("RneednPwaacnkaeataDnewtaawinln"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceonmn.aaauwvncnhaaetn.npnrnontaoe.niamn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("pnancnkaentwIedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(2, _omitFieldNames ? '' : StringTranslate.e2z("aamnonunnetn"), $pb.PbFieldType.OD)
    ..a<$fixnum.Int64>(3, _omitFieldNames ? '' : StringTranslate.e2z("rweecweeiwvaenTniemnen"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, _omitFieldNames ? '' : StringTranslate.e2z("nnincakeNeanmeen"))
    ..aOS(5, _omitFieldNames ? '' : StringTranslate.e2z("aevnanteawrnUwrele"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RedPacketDetail clone() => RedPacketDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RedPacketDetail copyWith(void Function(RedPacketDetail) updates) => super.copyWith((message) => updates(message as RedPacketDetail)) as RedPacketDetail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RedPacketDetail create() => RedPacketDetail._();
  RedPacketDetail createEmptyInstance() => create();
  static $pb.PbList<RedPacketDetail> createRepeated() => $pb.PbList<RedPacketDetail>();
  @$core.pragma('dart2js:noInline')
  static RedPacketDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RedPacketDetail>(create);
  static RedPacketDetail? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get packetId => $_getI64(0);
  @$pb.TagNumber(1)
  set packetId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPacketId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPacketId() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get receiveTime => $_getI64(2);
  @$pb.TagNumber(3)
  set receiveTime($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReceiveTime() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiveTime() => clearField(3);

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
}

class Snap extends $pb.GeneratedMessage {
  factory Snap() => create();
  Snap._() : super();
  factory Snap.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Snap.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("Sannawpe"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnowme.waauavwcnhwawtn.npnrnoetaon.eiamn")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("indn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : StringTranslate.e2z("owwennearn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : StringTranslate.e2z("uwneraenandn"), $pb.PbFieldType.O3)
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : StringTranslate.e2z("cnhwawtabwonxwIwdn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(5, _omitFieldNames ? '' : StringTranslate.e2z("cerneaaeteenTniwmwew"))
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : StringTranslate.e2z("pnrwenvnSwnnanpwIwdn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(7, _omitFieldNames ? '' : StringTranslate.e2z("onwnnnearaHaeeaadw"))
    ..aOS(8, _omitFieldNames ? '' : StringTranslate.e2z("onwenwewrnNaaamaee"))
    ..e<Snap_SnapType>(9, _omitFieldNames ? '' : StringTranslate.e2z("taynpaea"), $pb.PbFieldType.OE, defaultOrMaker: Snap_SnapType.VIDEO_SNAP, valueOf: Snap_SnapType.valueOf, enumValues: Snap_SnapType.values)
    ..aOS(10, _omitFieldNames ? '' : StringTranslate.e2z("teeexatnCaownnteennate"))
    ..aOM<Voice>(11, _omitFieldNames ? '' : StringTranslate.e2z("vwonincaee"), subBuilder: Voice.create)
    ..aOM<Image>(12, _omitFieldNames ? '' : StringTranslate.e2z("inmwaegwea"), subBuilder: Image.create)
    ..aOM<Video>(13, _omitFieldNames ? '' : StringTranslate.e2z("vnindneaoe"), subBuilder: Video.create)
    ..aOS(14, _omitFieldNames ? '' : StringTranslate.e2z("jnsaonnnCwoenntweenatw"))
    ..a<$fixnum.Int64>(15, _omitFieldNames ? '' : StringTranslate.e2z("lnoacaanlnInda"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$0.Any>(16, _omitFieldNames ? '' : StringTranslate.e2z("eaxatnennnsninoennsw"), subBuilder: $0.Any.create)
    ..a<$fixnum.Int64>(17, _omitFieldNames ? '' : StringTranslate.e2z("rneednPnancekweetnIadw"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<Image>(18, _omitFieldNames ? '' : StringTranslate.e2z("mnualetniwIemeangneasn"), $pb.PbFieldType.PM, subBuilder: Image.create)
    ..a<$fixnum.Int64>(19, _omitFieldNames ? '' : StringTranslate.e2z("reenpeleieeednSnnnawpnIwdn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<Snap>(20, _omitFieldNames ? '' : StringTranslate.e2z("rneapnlaiwendnSnnnawpa"), subBuilder: Snap.create)
    ..a<$core.int>(21, _omitFieldNames ? '' : StringTranslate.e2z("sntnawtnunsa"), $pb.PbFieldType.OU3)
    ..aOS(22, _omitFieldNames ? '' : StringTranslate.e2z("belaoncnknsa"))
    ..aOM<$2.Location>(23, _omitFieldNames ? '' : StringTranslate.e2z("lnoaceantwiwowna"), subBuilder: $2.Location.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Snap clone() => Snap()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Snap copyWith(void Function(Snap) updates) => super.copyWith((message) => updates(message as Snap)) as Snap;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Snap create() => Snap._();
  Snap createEmptyInstance() => create();
  static $pb.PbList<Snap> createRepeated() => $pb.PbList<Snap>();
  @$core.pragma('dart2js:noInline')
  static Snap getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Snap>(create);
  static Snap? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get owner => $_getI64(1);
  @$pb.TagNumber(2)
  set owner($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwner() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwner() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get unread => $_getIZ(2);
  @$pb.TagNumber(3)
  set unread($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUnread() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnread() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get chatboxId => $_getI64(3);
  @$pb.TagNumber(4)
  set chatboxId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChatboxId() => $_has(3);
  @$pb.TagNumber(4)
  void clearChatboxId() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get createTime => $_getI64(4);
  @$pb.TagNumber(5)
  set createTime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreateTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateTime() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get prevSnapId => $_getI64(5);
  @$pb.TagNumber(6)
  set prevSnapId($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPrevSnapId() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrevSnapId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get ownerHead => $_getSZ(6);
  @$pb.TagNumber(7)
  set ownerHead($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOwnerHead() => $_has(6);
  @$pb.TagNumber(7)
  void clearOwnerHead() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get ownerName => $_getSZ(7);
  @$pb.TagNumber(8)
  set ownerName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOwnerName() => $_has(7);
  @$pb.TagNumber(8)
  void clearOwnerName() => clearField(8);

  @$pb.TagNumber(9)
  Snap_SnapType get type => $_getN(8);
  @$pb.TagNumber(9)
  set type(Snap_SnapType v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasType() => $_has(8);
  @$pb.TagNumber(9)
  void clearType() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get textContent => $_getSZ(9);
  @$pb.TagNumber(10)
  set textContent($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTextContent() => $_has(9);
  @$pb.TagNumber(10)
  void clearTextContent() => clearField(10);

  @$pb.TagNumber(11)
  Voice get voice => $_getN(10);
  @$pb.TagNumber(11)
  set voice(Voice v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasVoice() => $_has(10);
  @$pb.TagNumber(11)
  void clearVoice() => clearField(11);
  @$pb.TagNumber(11)
  Voice ensureVoice() => $_ensure(10);

  @$pb.TagNumber(12)
  Image get image => $_getN(11);
  @$pb.TagNumber(12)
  set image(Image v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasImage() => $_has(11);
  @$pb.TagNumber(12)
  void clearImage() => clearField(12);
  @$pb.TagNumber(12)
  Image ensureImage() => $_ensure(11);

  @$pb.TagNumber(13)
  Video get video => $_getN(12);
  @$pb.TagNumber(13)
  set video(Video v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasVideo() => $_has(12);
  @$pb.TagNumber(13)
  void clearVideo() => clearField(13);
  @$pb.TagNumber(13)
  Video ensureVideo() => $_ensure(12);

  @$pb.TagNumber(14)
  $core.String get jsonContent => $_getSZ(13);
  @$pb.TagNumber(14)
  set jsonContent($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasJsonContent() => $_has(13);
  @$pb.TagNumber(14)
  void clearJsonContent() => clearField(14);

  @$pb.TagNumber(15)
  $fixnum.Int64 get localId => $_getI64(14);
  @$pb.TagNumber(15)
  set localId($fixnum.Int64 v) { $_setInt64(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasLocalId() => $_has(14);
  @$pb.TagNumber(15)
  void clearLocalId() => clearField(15);

  @$pb.TagNumber(16)
  $0.Any get extensions => $_getN(15);
  @$pb.TagNumber(16)
  set extensions($0.Any v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasExtensions() => $_has(15);
  @$pb.TagNumber(16)
  void clearExtensions() => clearField(16);
  @$pb.TagNumber(16)
  $0.Any ensureExtensions() => $_ensure(15);

  @$pb.TagNumber(17)
  $fixnum.Int64 get redPacketId => $_getI64(16);
  @$pb.TagNumber(17)
  set redPacketId($fixnum.Int64 v) { $_setInt64(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasRedPacketId() => $_has(16);
  @$pb.TagNumber(17)
  void clearRedPacketId() => clearField(17);

  @$pb.TagNumber(18)
  $core.List<Image> get multiImages => $_getList(17);

  @$pb.TagNumber(19)
  $fixnum.Int64 get repliedSnapId => $_getI64(18);
  @$pb.TagNumber(19)
  set repliedSnapId($fixnum.Int64 v) { $_setInt64(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasRepliedSnapId() => $_has(18);
  @$pb.TagNumber(19)
  void clearRepliedSnapId() => clearField(19);

  @$pb.TagNumber(20)
  Snap get repliedSnap => $_getN(19);
  @$pb.TagNumber(20)
  set repliedSnap(Snap v) { setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasRepliedSnap() => $_has(19);
  @$pb.TagNumber(20)
  void clearRepliedSnap() => clearField(20);
  @$pb.TagNumber(20)
  Snap ensureRepliedSnap() => $_ensure(19);

  @$pb.TagNumber(21)
  $core.int get status => $_getIZ(20);
  @$pb.TagNumber(21)
  set status($core.int v) { $_setUnsignedInt32(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasStatus() => $_has(20);
  @$pb.TagNumber(21)
  void clearStatus() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get blocks => $_getSZ(21);
  @$pb.TagNumber(22)
  set blocks($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasBlocks() => $_has(21);
  @$pb.TagNumber(22)
  void clearBlocks() => clearField(22);

  @$pb.TagNumber(23)
  $2.Location get location => $_getN(22);
  @$pb.TagNumber(23)
  set location($2.Location v) { setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasLocation() => $_has(22);
  @$pb.TagNumber(23)
  void clearLocation() => clearField(23);
  @$pb.TagNumber(23)
  $2.Location ensureLocation() => $_ensure(22);
}

class BuddyRequest extends $pb.GeneratedMessage {
  factory BuddyRequest() => create();
  BuddyRequest._() : super();
  factory BuddyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BuddyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("BnundndwyaRweeqwuweasatn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caowma.nawunvwcehwawte.npareontwoe.eiwma")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("iedn"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$2.User>(2, _omitFieldNames ? '' : StringTranslate.e2z("farwowmnUnsaewra"), subBuilder: $2.User.create)
    ..aOS(3, _omitFieldNames ? '' : StringTranslate.e2z("masege"))
    ..aOB(4, _omitFieldNames ? '' : StringTranslate.e2z("haaasnSnnnawpn"))
    ..a<$fixnum.Int64>(5, _omitFieldNames ? '' : StringTranslate.e2z("cnhnantwbnonxnIada"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(6, _omitFieldNames ? '' : StringTranslate.e2z("uepwdnantaeeTniemnee"))
    ..a<$core.int>(7, _omitFieldNames ? '' : StringTranslate.e2z("uenwreenaade"), $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BuddyRequest clone() => BuddyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BuddyRequest copyWith(void Function(BuddyRequest) updates) => super.copyWith((message) => updates(message as BuddyRequest)) as BuddyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuddyRequest create() => BuddyRequest._();
  BuddyRequest createEmptyInstance() => create();
  static $pb.PbList<BuddyRequest> createRepeated() => $pb.PbList<BuddyRequest>();
  @$core.pragma('dart2js:noInline')
  static BuddyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BuddyRequest>(create);
  static BuddyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $2.User get fromUser => $_getN(1);
  @$pb.TagNumber(2)
  set fromUser($2.User v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasFromUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromUser() => clearField(2);
  @$pb.TagNumber(2)
  $2.User ensureFromUser() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get msg => $_getSZ(2);
  @$pb.TagNumber(3)
  set msg($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsg() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsg() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get hasSnap => $_getBF(3);
  @$pb.TagNumber(4)
  set hasSnap($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHasSnap() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasSnap() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get chatboxId => $_getI64(4);
  @$pb.TagNumber(5)
  set chatboxId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChatboxId() => $_has(4);
  @$pb.TagNumber(5)
  void clearChatboxId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get updateTime => $_getI64(5);
  @$pb.TagNumber(6)
  set updateTime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUpdateTime() => $_has(5);
  @$pb.TagNumber(6)
  void clearUpdateTime() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get unread => $_getIZ(6);
  @$pb.TagNumber(7)
  set unread($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUnread() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnread() => clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
