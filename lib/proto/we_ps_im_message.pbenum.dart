import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: soggy_im_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Message_Type extends $pb.ProtobufEnum {
  static final Message_Type UNKNOWN = Message_Type._(0, _omitEnumNames ? '' : StringTranslate.e2z("UnNnKnNaOnWnNw"));
  static final Message_Type DELETEBUDDYREQ = Message_Type._(100, _omitEnumNames ? '' : StringTranslate.e2z("DnEaLaEnTnEaBwUaDnDaYaRnEnQn"));
  static final Message_Type REMARKBUDDYREQ = Message_Type._(101, _omitEnumNames ? '' : StringTranslate.e2z("RnEnMnAaReKaBwUnDnDeYnReEeQn"));
  static final Message_Type BLOCKBUDDYREQ = Message_Type._(102, _omitEnumNames ? '' : StringTranslate.e2z("BwLnOeCnKeBaUwDwDnYeRaEnQw"));
  static final Message_Type STARBUDDYREQ = Message_Type._(103, _omitEnumNames ? '' : StringTranslate.e2z("SnTeAnReBnUaDaDnYnRwEnQn"));
  static final Message_Type INVITECONTACTBUDDYREQ = Message_Type._(104, _omitEnumNames ? '' : StringTranslate.e2z("IwNwVnInTaEwCnOaNaTnAnCwTwBaUwDeDnYaRnEnQn"));
  static final Message_Type IGNORERECOMMENDBUDDYREQ = Message_Type._(105, _omitEnumNames ? '' : StringTranslate.e2z("IaGnNeOnReEnRnEwCwOeMnMwEeNwDnBeUaDaDnYwRaEwQn"));
  static final Message_Type BATCHADDRECOMMENDBUDDYREQ = Message_Type._(106, _omitEnumNames ? '' : StringTranslate.e2z("BeAnTeCnHnAaDaDnRaEnCwOeMnMnEnNnDnBwUwDnDnYnRwEeQn"));
  static final Message_Type GETBUDDYINFOREQ = Message_Type._(107, _omitEnumNames ? '' : StringTranslate.e2z("GwEeTnBnUaDaDnYwIaNeFnOnRnEwQa"));
  static final Message_Type GETBUDDYINFORSP = Message_Type._(108, _omitEnumNames ? '' : StringTranslate.e2z("GnEeTnBaUaDaDnYnIeNeFwOaRnSnPe"));
  static final Message_Type REPORTUSERREQ = Message_Type._(109, _omitEnumNames ? '' : StringTranslate.e2z("RaEwPnOnRaTnUnSnEnReReEnQe"));
  static final Message_Type BATCHUNBLOCKBUDDYREQ = Message_Type._(110, _omitEnumNames ? '' : StringTranslate.e2z("BwAnTeCnHnUwNaBnLnOnCnKnBeUnDaDeYaRaEaQn"));
  static final Message_Type MAXBUDDYTYPE = Message_Type._(199, _omitEnumNames ? '' : StringTranslate.e2z("MaAnXeBeUnDeDaYnTwYaPnEn"));
  static final Message_Type SENDBUDDYREQUESTREQ = Message_Type._(200, _omitEnumNames ? '' : StringTranslate.e2z("SnEwNnDnBaUwDwDaYaRwEeQnUwEeSnTnRnEnQe"));
  static final Message_Type CONFIRMBUDDYREQUESTREQ = Message_Type._(201, _omitEnumNames ? '' : StringTranslate.e2z("CnOnNnFnIeRnMnBeUeDeDnYeRnEnQeUnEnSaTnRnEnQw"));
  static final Message_Type DELETEBUDDYREQUESTREQ = Message_Type._(202, _omitEnumNames ? '' : StringTranslate.e2z("DnEwLnEnTaEwBeUnDeDaYnRnEwQnUnEaSnTnRnEeQn"));
  static final Message_Type SETALLBUDDYREQUESTREADEDREQ = Message_Type._(203, _omitEnumNames ? '' : StringTranslate.e2z("SeEnTeAaLnLeBnUnDwDnYaRwEwQnUnEwSnTnRaEaAeDaEnDwRnEaQn"));
  static final Message_Type MAXBUDDYREQUESTTYPE = Message_Type._(299, _omitEnumNames ? '' : StringTranslate.e2z("MnAnXaBnUnDnDeYnReEwQwUnEaSnTwTeYnPwEe"));
  static final Message_Type CREATECHATBOXREQ = Message_Type._(300, _omitEnumNames ? '' : StringTranslate.e2z("CwRwEaAnTnEnCnHwAnTeBnOnXaRnEnQn"));
  static final Message_Type SETCHATBOXNAMEREQ = Message_Type._(301, _omitEnumNames ? '' : StringTranslate.e2z("SaEnTwCeHaAnTaBaOnXaNnAnMnEnRnEaQa"));
  static final Message_Type SETCHATBOXCOVERREQ = Message_Type._(302, _omitEnumNames ? '' : StringTranslate.e2z("SeEeTnCeHnAeTeBaOnXnCnOnVwEeReRnEnQn"));
  static final Message_Type ADDCHATBOXMEMBERREQ = Message_Type._(303, _omitEnumNames ? '' : StringTranslate.e2z("AaDaDeCwHnAeTaBwOnXaMaEaMnBnEaRaRnEnQw"));
  static final Message_Type REMOVECHATBOXMEMBERREQ = Message_Type._(304, _omitEnumNames ? '' : StringTranslate.e2z("RaEeMeOaVwEeCnHnAaTwBeOaXaMnEeMeBnEnReRnEeQw"));
  static final Message_Type STARCHABOXREQ = Message_Type._(305, _omitEnumNames ? '' : StringTranslate.e2z("SnTwAaReCeHaAwBaOnXwRwEeQn"));
  static final Message_Type MUTECHATBOXREQ = Message_Type._(306, _omitEnumNames ? '' : StringTranslate.e2z("MnUeTaEnCaHaAaTwBnOeXwRnEeQn"));
  static final Message_Type REMOVECHATBOXREQ = Message_Type._(307, _omitEnumNames ? '' : StringTranslate.e2z("RnEaMeOaVeEeCwHaAnTnBeOaXeRwEnQe"));
  static final Message_Type EXITCHATBOXREQ = Message_Type._(308, _omitEnumNames ? '' : StringTranslate.e2z("EnXeIeTaCaHnAnTwBnOeXnReEnQa"));
  static final Message_Type REPORTCHATBOXREQ = Message_Type._(309, _omitEnumNames ? '' : StringTranslate.e2z("RnEaPaOnRnTwCnHaAnTaBnOeXnRaEnQw"));
  static final Message_Type JOINCHATBOXREQ = Message_Type._(310, _omitEnumNames ? '' : StringTranslate.e2z("JeOnIeNaCnHeAwTnBwOnXnRnEnQa"));
  static final Message_Type JOINCHATBOXRSP = Message_Type._(311, _omitEnumNames ? '' : StringTranslate.e2z("JnOnInNnCeHwAaTnBwOnXnRwSaPe"));
  static final Message_Type CREATECHATBOXRSP = Message_Type._(312, _omitEnumNames ? '' : StringTranslate.e2z("CeRnEnAnTnEaCaHnAnTnBaOnXnReSwPa"));
  static final Message_Type UPDATECHATBOXREADEDSTATUSREQ = Message_Type._(313, _omitEnumNames ? '' : StringTranslate.e2z("UePwDnAnTnEwCaHwAeTeBwOwXnRnEwAwDnEnDeSaTnAnTnUnSnRnEaQn"));
  static final Message_Type UPDATECHATBOXPUBLICSETTINGREQ = Message_Type._(314, _omitEnumNames ? '' : StringTranslate.e2z("UnPnDnAwTwEwCwHnAaTnBnOnXwPnUeBaLnIwCwSeEeTwTeIwNnGwRnEaQw"));
  static final Message_Type GETCHATBOXINFOREQ = Message_Type._(315, _omitEnumNames ? '' : StringTranslate.e2z("GaEwTeCnHnAaTnBeOnXeIwNnFaOnRaEaQe"));
  static final Message_Type GETCHATBOXINFORSP = Message_Type._(316, _omitEnumNames ? '' : StringTranslate.e2z("GnEnTwCaHnAaTnBnOwXwIeNwFeOeRnSnPw"));
  static final Message_Type UPDATECHATBOXCATEGORYREQ = Message_Type._(317, _omitEnumNames ? '' : StringTranslate.e2z("UwPwDnAwTnEnCnHeAaTaBnOeXaCnAnTaEnGnOnRaYeReEnQn"));
  static final Message_Type SETCHATBOXDESCREQ = Message_Type._(318, _omitEnumNames ? '' : StringTranslate.e2z("SnEnTwCeHnAnTnBnOnXaDwEwSeCaRaEaQn"));
  static final Message_Type BATCHGETCHATBOXINFOREQ = Message_Type._(319, _omitEnumNames ? '' : StringTranslate.e2z("BnAnTnCeHnGaEeTeCnHnAnTwBeOeXnInNaFaOnRwEnQw"));
  static final Message_Type BATCHGETCHATBOXINFORSP = Message_Type._(320, _omitEnumNames ? '' : StringTranslate.e2z("BnAaTnCnHnGeEnTnCaHnAeTnBnOnXwIeNnFnOaReSnPa"));
  static final Message_Type MAXCHATBOXTYPE = Message_Type._(399, _omitEnumNames ? '' : StringTranslate.e2z("MaAnXeCwHeAwTnBaOnXnTnYaPeEn"));
  static final Message_Type CREATESNAPREQ = Message_Type._(400, _omitEnumNames ? '' : StringTranslate.e2z("CeRnEeAnTeEaSwNwAnPnRnEwQe"));
  static final Message_Type CREATESNAPRSP = Message_Type._(401, _omitEnumNames ? '' : StringTranslate.e2z("CaRnEnAeTnEaSnNnAnPeRwSnPn"));
  static final Message_Type STARTRECORDSNAPNOTIFY = Message_Type._(402, _omitEnumNames ? '' : StringTranslate.e2z("SnTnAeRnTnRaEnCnOeRwDeSwNnAnPnNaOnTeIwFaYe"));
  static final Message_Type STOPRECORDSNAPNOTIFY = Message_Type._(403, _omitEnumNames ? '' : StringTranslate.e2z("SwTnOePnRnEaCnOnReDaSwNnAaPaNeOwTwInFnYe"));
  static final Message_Type STARTPLAYSNAPNOTIFY = Message_Type._(404, _omitEnumNames ? '' : StringTranslate.e2z("SnTaAeRaTaPwLaAeYaSwNnAnPwNwOnTeInFaYe"));
  static final Message_Type STOPPLAYSNAPNOTIFY = Message_Type._(405, _omitEnumNames ? '' : StringTranslate.e2z("SaTeOnPnPwLnAnYnSnNaAaPwNnOnTeIaFeYw"));
  static final Message_Type DELETESNAPREQ = Message_Type._(406, _omitEnumNames ? '' : StringTranslate.e2z("DwEnLnEwTnEnSnNnAnPwRnEwQe"));
  static final Message_Type GETMORESNAPSFROMREQ = Message_Type._(407, _omitEnumNames ? '' : StringTranslate.e2z("GeEaTnMwOwReEnSnNwAnPwSwFwRwOeMaReEwQn"));
  static final Message_Type GETMORESNAPSFROMRSP = Message_Type._(408, _omitEnumNames ? '' : StringTranslate.e2z("GwEwTaMeOnRnEnSwNnAnPnSaFeRaOnMwRaSnPn"));
  static final Message_Type UPDATESNAPREADEDSTATUSREQ = Message_Type._(409, _omitEnumNames ? '' : StringTranslate.e2z("UwPnDwAaTeEnSnNwAnPwRnEeAeDnEeDeSnTaAnTeUwSnReEaQn"));
  static final Message_Type CHECKREDPACKETREQ = Message_Type._(410, _omitEnumNames ? '' : StringTranslate.e2z("CwHnEwCnKnRaEwDePnAnCnKwEeTaRaEeQn"));
  static final Message_Type CHECKREDPACKETRSP = Message_Type._(411, _omitEnumNames ? '' : StringTranslate.e2z("CwHeEwCaKnRwEeDnPeAaCwKaEwTeRnSnPn"));
  static final Message_Type RECEIVEREDPACKETREQ = Message_Type._(412, _omitEnumNames ? '' : StringTranslate.e2z("RwEnCwEnInVeEnRwEwDePnAnCnKwEeTeReEnQe"));
  static final Message_Type RECEIVEREDPACKETRSP = Message_Type._(413, _omitEnumNames ? '' : StringTranslate.e2z("RnEnCeEnInVwEnRnEnDePeAaCnKaEnTnRnSnPn"));
  static final Message_Type GETREDPACKETINFOTREQ = Message_Type._(414, _omitEnumNames ? '' : StringTranslate.e2z("GaEnTnRaEnDnPeAeCaKeEnTnIwNnFnOnTwRnEaQe"));
  static final Message_Type GETREDPACKETINFOTRSP = Message_Type._(415, _omitEnumNames ? '' : StringTranslate.e2z("GaEnTnReEwDaPeAnCaKeEnTnInNaFaOwTnRnSwPn"));
  static final Message_Type READSNAPREQ = Message_Type._(416, _omitEnumNames ? '' : StringTranslate.e2z("RnEeAnDeSeNeAwPwRnEnQe"));
  static final Message_Type MAXSNAPTYPE = Message_Type._(499, _omitEnumNames ? '' : StringTranslate.e2z("MnAnXwSwNnAaPaTaYnPwEn"));
  static final Message_Type SYNC = Message_Type._(700, _omitEnumNames ? '' : StringTranslate.e2z("SeYeNwCe"));
  static final Message_Type SYNCNOTIFY = Message_Type._(701, _omitEnumNames ? '' : StringTranslate.e2z("SaYnNwCwNnOwTaInFnYn"));
  static final Message_Type SYNCKEYCONFIRMNOTIFY = Message_Type._(702, _omitEnumNames ? '' : StringTranslate.e2z("SnYnNaCaKnEeYnCnOnNnFnIaRnMwNnOnTnIaFwYw"));
  static final Message_Type SYNCPSH = Message_Type._(703, _omitEnumNames ? '' : StringTranslate.e2z("SwYaNwCePeSwHn"));
  static final Message_Type MAXSYNCTYPE = Message_Type._(799, _omitEnumNames ? '' : StringTranslate.e2z("MnAwXnSeYeNeCnTaYwPnEe"));

  static final $core.List<Message_Type> values = <Message_Type> [
    UNKNOWN,
    DELETEBUDDYREQ,
    REMARKBUDDYREQ,
    BLOCKBUDDYREQ,
    STARBUDDYREQ,
    INVITECONTACTBUDDYREQ,
    IGNORERECOMMENDBUDDYREQ,
    BATCHADDRECOMMENDBUDDYREQ,
    GETBUDDYINFOREQ,
    GETBUDDYINFORSP,
    REPORTUSERREQ,
    BATCHUNBLOCKBUDDYREQ,
    MAXBUDDYTYPE,
    SENDBUDDYREQUESTREQ,
    CONFIRMBUDDYREQUESTREQ,
    DELETEBUDDYREQUESTREQ,
    SETALLBUDDYREQUESTREADEDREQ,
    MAXBUDDYREQUESTTYPE,
    CREATECHATBOXREQ,
    SETCHATBOXNAMEREQ,
    SETCHATBOXCOVERREQ,
    ADDCHATBOXMEMBERREQ,
    REMOVECHATBOXMEMBERREQ,
    STARCHABOXREQ,
    MUTECHATBOXREQ,
    REMOVECHATBOXREQ,
    EXITCHATBOXREQ,
    REPORTCHATBOXREQ,
    JOINCHATBOXREQ,
    JOINCHATBOXRSP,
    CREATECHATBOXRSP,
    UPDATECHATBOXREADEDSTATUSREQ,
    UPDATECHATBOXPUBLICSETTINGREQ,
    GETCHATBOXINFOREQ,
    GETCHATBOXINFORSP,
    UPDATECHATBOXCATEGORYREQ,
    SETCHATBOXDESCREQ,
    BATCHGETCHATBOXINFOREQ,
    BATCHGETCHATBOXINFORSP,
    MAXCHATBOXTYPE,
    CREATESNAPREQ,
    CREATESNAPRSP,
    STARTRECORDSNAPNOTIFY,
    STOPRECORDSNAPNOTIFY,
    STARTPLAYSNAPNOTIFY,
    STOPPLAYSNAPNOTIFY,
    DELETESNAPREQ,
    GETMORESNAPSFROMREQ,
    GETMORESNAPSFROMRSP,
    UPDATESNAPREADEDSTATUSREQ,
    CHECKREDPACKETREQ,
    CHECKREDPACKETRSP,
    RECEIVEREDPACKETREQ,
    RECEIVEREDPACKETRSP,
    GETREDPACKETINFOTREQ,
    GETREDPACKETINFOTRSP,
    READSNAPREQ,
    MAXSNAPTYPE,
    SYNC,
    SYNCNOTIFY,
    SYNCKEYCONFIRMNOTIFY,
    SYNCPSH,
    MAXSYNCTYPE,
  ];

  static final $core.Map<$core.int, Message_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_Type? valueOf($core.int value) => _byValue[value];

  const Message_Type._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
