import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: we_ps_bu_common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'we_ps_bu_object.pb.dart' as $1;
import 'we_ps_im_object.pb.dart' as $3;

class GetUserOnlineTimeReq extends $pb.GeneratedMessage {
  factory GetUserOnlineTimeReq() => create();
  GetUserOnlineTimeReq._() : super();
  factory GetUserOnlineTimeReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserOnlineTimeReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("GeentwUnsnenraOnnalninnneeTninmeewRnewqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonme.nanuavwcehwaata.npernontwon.acalnuwbe9n")), createEmptyInstance: create)
    ..p<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("ueiwdnse"), $pb.PbFieldType.KU6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserOnlineTimeReq clone() => GetUserOnlineTimeReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserOnlineTimeReq copyWith(void Function(GetUserOnlineTimeReq) updates) => super.copyWith((message) => updates(message as GetUserOnlineTimeReq)) as GetUserOnlineTimeReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserOnlineTimeReq create() => GetUserOnlineTimeReq._();
  GetUserOnlineTimeReq createEmptyInstance() => create();
  static $pb.PbList<GetUserOnlineTimeReq> createRepeated() => $pb.PbList<GetUserOnlineTimeReq>();
  @$core.pragma('dart2js:noInline')
  static GetUserOnlineTimeReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserOnlineTimeReq>(create);
  static GetUserOnlineTimeReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$fixnum.Int64> get uids => $_getList(0);
}

class GetUserOnlineTimeRsp extends $pb.GeneratedMessage {
  factory GetUserOnlineTimeRsp() => create();
  GetUserOnlineTimeRsp._() : super();
  factory GetUserOnlineTimeRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserOnlineTimeRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("GweatnUnsnenrnOenelnieneenTeiwmwenRwsnpw"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnowmn.waaunvncnhnaata.apnreoatnoe.wcnleuabn9e")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("cnondnew"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("masngw"))
    ..pc<$1.UserOnlineTime>(3, _omitFieldNames ? '' : StringTranslate.e2z("onnnlwiennenTainmwensn"), $pb.PbFieldType.PM, subBuilder: $1.UserOnlineTime.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserOnlineTimeRsp clone() => GetUserOnlineTimeRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserOnlineTimeRsp copyWith(void Function(GetUserOnlineTimeRsp) updates) => super.copyWith((message) => updates(message as GetUserOnlineTimeRsp)) as GetUserOnlineTimeRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserOnlineTimeRsp create() => GetUserOnlineTimeRsp._();
  GetUserOnlineTimeRsp createEmptyInstance() => create();
  static $pb.PbList<GetUserOnlineTimeRsp> createRepeated() => $pb.PbList<GetUserOnlineTimeRsp>();
  @$core.pragma('dart2js:noInline')
  static GetUserOnlineTimeRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserOnlineTimeRsp>(create);
  static GetUserOnlineTimeRsp? _defaultInstance;

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
  $core.List<$1.UserOnlineTime> get onlineTimes => $_getList(2);
}

class CustomerServiceReq extends $pb.GeneratedMessage {
  factory CustomerServiceReq() => create();
  CustomerServiceReq._() : super();
  factory CustomerServiceReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CustomerServiceReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CwunsetnowmwenrnSwenrnvaiecwewRnenqn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceowme.wawunvncnhnante.wpnreonteow.acnlnuebn9n")), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CustomerServiceReq clone() => CustomerServiceReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CustomerServiceReq copyWith(void Function(CustomerServiceReq) updates) => super.copyWith((message) => updates(message as CustomerServiceReq)) as CustomerServiceReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomerServiceReq create() => CustomerServiceReq._();
  CustomerServiceReq createEmptyInstance() => create();
  static $pb.PbList<CustomerServiceReq> createRepeated() => $pb.PbList<CustomerServiceReq>();
  @$core.pragma('dart2js:noInline')
  static CustomerServiceReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CustomerServiceReq>(create);
  static CustomerServiceReq? _defaultInstance;
}

class CustomerServiceRsp extends $pb.GeneratedMessage {
  factory CustomerServiceRsp() => create();
  CustomerServiceRsp._() : super();
  factory CustomerServiceRsp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CustomerServiceRsp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CnunsatnonmaenraSaewrnvniwcweaRnswpa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cwonmn.nawunvecwhnaetn.apernontwow.ecalnunbn9e")), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : StringTranslate.e2z("caowdwen"), $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mwsngw"))
    ..aOM<$3.Chatbox>(3, _omitFieldNames ? '' : StringTranslate.e2z("cnhaawtabnonxn"), subBuilder: $3.Chatbox.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CustomerServiceRsp clone() => CustomerServiceRsp()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CustomerServiceRsp copyWith(void Function(CustomerServiceRsp) updates) => super.copyWith((message) => updates(message as CustomerServiceRsp)) as CustomerServiceRsp;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomerServiceRsp create() => CustomerServiceRsp._();
  CustomerServiceRsp createEmptyInstance() => create();
  static $pb.PbList<CustomerServiceRsp> createRepeated() => $pb.PbList<CustomerServiceRsp>();
  @$core.pragma('dart2js:noInline')
  static CustomerServiceRsp getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CustomerServiceRsp>(create);
  static CustomerServiceRsp? _defaultInstance;

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
  $3.Chatbox get chatbox => $_getN(2);
  @$pb.TagNumber(3)
  set chatbox($3.Chatbox v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasChatbox() => $_has(2);
  @$pb.TagNumber(3)
  void clearChatbox() => clearField(3);
  @$pb.TagNumber(3)
  $3.Chatbox ensureChatbox() => $_ensure(2);
}

class TipNotify extends $pb.GeneratedMessage {
  factory TipNotify() => create();
  TipNotify._() : super();
  factory TipNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TipNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("TeiapaNnowtwiefnya"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("cnonmn.wawuavncnhwantn.apwrnowtnon.wcwleuebw9e")), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : StringTranslate.e2z("ieceoennUwrwlw"))
    ..aOS(2, _omitFieldNames ? '' : StringTranslate.e2z("mesngw"))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TipNotify clone() => TipNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TipNotify copyWith(void Function(TipNotify) updates) => super.copyWith((message) => updates(message as TipNotify)) as TipNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TipNotify create() => TipNotify._();
  TipNotify createEmptyInstance() => create();
  static $pb.PbList<TipNotify> createRepeated() => $pb.PbList<TipNotify>();
  @$core.pragma('dart2js:noInline')
  static TipNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TipNotify>(create);
  static TipNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get iconUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set iconUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIconUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearIconUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);
}

class BalanceInsufficientNotify extends $pb.GeneratedMessage {
  factory BalanceInsufficientNotify() => create();
  BalanceInsufficientNotify._() : super();
  factory BalanceInsufficientNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BalanceInsufficientNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("BaanlnaanecwewIannsauafwfnincnieennntnNeoeteinfnye"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("caoame.aaaunvncnhnaatw.wpnrnonteon.wcwlnuwba9w")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("bwanleannecwew"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BalanceInsufficientNotify clone() => BalanceInsufficientNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BalanceInsufficientNotify copyWith(void Function(BalanceInsufficientNotify) updates) => super.copyWith((message) => updates(message as BalanceInsufficientNotify)) as BalanceInsufficientNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BalanceInsufficientNotify create() => BalanceInsufficientNotify._();
  BalanceInsufficientNotify createEmptyInstance() => create();
  static $pb.PbList<BalanceInsufficientNotify> createRepeated() => $pb.PbList<BalanceInsufficientNotify>();
  @$core.pragma('dart2js:noInline')
  static BalanceInsufficientNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BalanceInsufficientNotify>(create);
  static BalanceInsufficientNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get balance => $_getI64(0);
  @$pb.TagNumber(1)
  set balance($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => clearField(1);
}

class CustomerOnlineNotify extends $pb.GeneratedMessage {
  factory CustomerOnlineNotify() => create();
  CustomerOnlineNotify._() : super();
  factory CustomerOnlineNotify.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CustomerOnlineNotify.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("CwunsatnonmnearnOanalniwneewNaontaiefeyn"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceoemw.wanuevecehaaate.epernontnoa.wcaleuwba9e")), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : StringTranslate.e2z("uniede"), $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CustomerOnlineNotify clone() => CustomerOnlineNotify()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CustomerOnlineNotify copyWith(void Function(CustomerOnlineNotify) updates) => super.copyWith((message) => updates(message as CustomerOnlineNotify)) as CustomerOnlineNotify;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomerOnlineNotify create() => CustomerOnlineNotify._();
  CustomerOnlineNotify createEmptyInstance() => create();
  static $pb.PbList<CustomerOnlineNotify> createRepeated() => $pb.PbList<CustomerOnlineNotify>();
  @$core.pragma('dart2js:noInline')
  static CustomerOnlineNotify getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CustomerOnlineNotify>(create);
  static CustomerOnlineNotify? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get uid => $_getI64(0);
  @$pb.TagNumber(1)
  set uid($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class RecoverStateReq extends $pb.GeneratedMessage {
  factory RecoverStateReq() => create();
  RecoverStateReq._() : super();
  factory RecoverStateReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RecoverStateReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : StringTranslate.e2z("ReewcnowvweernSnteantnewReenqa"), package: $pb.PackageName(_omitMessageNames ? '' : StringTranslate.e2z("ceoamw.wawuavwcehwante.npwraoataon.wcalauwbw9w")), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RecoverStateReq clone() => RecoverStateReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RecoverStateReq copyWith(void Function(RecoverStateReq) updates) => super.copyWith((message) => updates(message as RecoverStateReq)) as RecoverStateReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RecoverStateReq create() => RecoverStateReq._();
  RecoverStateReq createEmptyInstance() => create();
  static $pb.PbList<RecoverStateReq> createRepeated() => $pb.PbList<RecoverStateReq>();
  @$core.pragma('dart2js:noInline')
  static RecoverStateReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RecoverStateReq>(create);
  static RecoverStateReq? _defaultInstance;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
