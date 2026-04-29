import 'package:wenan/StringTranslate.dart';

//
//  Generated code. Do not modify.
//  source: we_ps_bu_message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Message_Type extends $pb.ProtobufEnum {
  static final Message_Type UNKNOWN = Message_Type._(0, _omitEnumNames ? '' : StringTranslate.e2z("UeNaKaNnOwWaNn"));
  static final Message_Type CREATEROOMREQ = Message_Type._(2000, _omitEnumNames ? '' : StringTranslate.e2z("CaRnEwAnTnEeRnOaOnMaRnEeQe"));
  static final Message_Type CREATEROOMRSP = Message_Type._(2001, _omitEnumNames ? '' : StringTranslate.e2z("CnReEaAnTnEwRnOeOeMeReSnPe"));
  static final Message_Type JOINROOMREQ = Message_Type._(2002, _omitEnumNames ? '' : StringTranslate.e2z("JnOeInNeReOwOnMeReEaQw"));
  static final Message_Type JOINROOMRSP = Message_Type._(2003, _omitEnumNames ? '' : StringTranslate.e2z("JaOeIeNeRaOeOnMaReSePa"));
  static final Message_Type SENDROOMMESSAGEREQ = Message_Type._(2004, _omitEnumNames ? '' : StringTranslate.e2z("SeEnNnDnRaOwOnMaMnEaSeSwAnGeEeReEnQn"));
  static final Message_Type SENDROOMMGIFTREQ = Message_Type._(2005, _omitEnumNames ? '' : StringTranslate.e2z("SnEaNaDwReOnOeMwMnGwInFnTnReEaQe"));
  static final Message_Type APPLYCHATREQ = Message_Type._(2006, _omitEnumNames ? '' : StringTranslate.e2z("AwPnPwLeYeCeHnAwTaRnEnQe"));
  static final Message_Type INVITECHATREQ = Message_Type._(2007, _omitEnumNames ? '' : StringTranslate.e2z("IaNnVnInTwEnCwHaAeTnReEnQn"));
  static final Message_Type CONFIRMCHATINVITEREQ = Message_Type._(2008, _omitEnumNames ? '' : StringTranslate.e2z("CeOeNnFaInReMnCwHnAeTaInNwVwIaTnEaRwEwQe"));
  static final Message_Type REJECTCHATAPPLYREQ = Message_Type._(2009, _omitEnumNames ? '' : StringTranslate.e2z("RaEaJaEaCeTnCeHwAwTaAePwPwLaYwRnEwQn"));
  static final Message_Type QUITCHATREQ = Message_Type._(2010, _omitEnumNames ? '' : StringTranslate.e2z("QeUwInTaCnHnAaTaRaEnQe"));
  static final Message_Type ROOMPAYLOADNOTIFY = Message_Type._(2011, _omitEnumNames ? '' : StringTranslate.e2z("RaOnOwMnPnAaYnLaOnAnDaNeOwTeInFeYe"));
  static final Message_Type UPDATECAMMICSTATUSREQ = Message_Type._(2012, _omitEnumNames ? '' : StringTranslate.e2z("UePnDnAwTnEwCwAaMeMwIeCeSnTnAaTwUnSwReEaQa"));
  static final Message_Type RESUMEROOMREQ = Message_Type._(2013, _omitEnumNames ? '' : StringTranslate.e2z("RnEwSwUnMeEnRwOnOnMwReEnQn"));
  static final Message_Type ENDROOMREQ = Message_Type._(2014, _omitEnumNames ? '' : StringTranslate.e2z("EeNnDnRwOnOnMeRnEaQn"));
  static final Message_Type ENDROOMRSP = Message_Type._(2015, _omitEnumNames ? '' : StringTranslate.e2z("EaNnDeRnOnOnMeReSwPe"));
  static final Message_Type KICKMEMBERREQ = Message_Type._(2016, _omitEnumNames ? '' : StringTranslate.e2z("KnIwCnKnMeEnMnBnEaReReEnQn"));
  static final Message_Type GETROOMMEMBERSREQ = Message_Type._(2017, _omitEnumNames ? '' : StringTranslate.e2z("GaEnTnReOaOwMaMaEwMwBnEaRwSnRnEnQe"));
  static final Message_Type GETROOMMEMBERSRSP = Message_Type._(2018, _omitEnumNames ? '' : StringTranslate.e2z("GeEwTnRnOnOnMaMnEnMwBnEnRnSeRnSePw"));
  static final Message_Type GETROOMINFOREQ = Message_Type._(2019, _omitEnumNames ? '' : StringTranslate.e2z("GeEnTnRnOnOeMwInNwFnOeRnEeQe"));
  static final Message_Type GETROOMINFORSP = Message_Type._(2020, _omitEnumNames ? '' : StringTranslate.e2z("GeEaTwRnOwOaMaIeNeFnOwRwSwPe"));
  static final Message_Type GETUSERONLINETIMEREQ = Message_Type._(2021, _omitEnumNames ? '' : StringTranslate.e2z("GaEeTnUwSaEwRwOeNwLnInNnEnTeInMeEnRnEnQe"));
  static final Message_Type GETUSERONLINETIMERSP = Message_Type._(2022, _omitEnumNames ? '' : StringTranslate.e2z("GnEwTwUeSeEeReOeNeLnIaNeEnTnInMnEaReSnPe"));
  static final Message_Type QUITROOMREQ = Message_Type._(2023, _omitEnumNames ? '' : StringTranslate.e2z("QaUnIaTwReOwOnMaReEnQn"));
  static final Message_Type KICKCHATMEMBERREQ = Message_Type._(2024, _omitEnumNames ? '' : StringTranslate.e2z("KnIeCeKwCeHnAeTwMwEnMaBnEnRnRwEnQw"));
  static final Message_Type CANCELCHATINVITEREQ = Message_Type._(2025, _omitEnumNames ? '' : StringTranslate.e2z("CnAnNaCwEnLeCnHnAaTnIaNnVnIeTeEwRwEeQw"));
  static final Message_Type ORDERSTATUSNOTIFY = Message_Type._(2026, _omitEnumNames ? '' : StringTranslate.e2z("OaRaDwEnRaSeTnAwTaUwSaNeOnTwInFwYa"));
  static final Message_Type SYSNOTIFICATIONNOTIFY = Message_Type._(2027, _omitEnumNames ? '' : StringTranslate.e2z("SeYaSwNnOwTwIeFwIeCwAnTnIaOeNeNaOnTwIwFnYn"));
  static final Message_Type ACTIVITYNOTIFY = Message_Type._(2028, _omitEnumNames ? '' : StringTranslate.e2z("AnCnTaIeVnInTaYnNnOnTnInFnYa"));
  static final Message_Type FEEDFOLLOWNOTIFY = Message_Type._(2029, _omitEnumNames ? '' : StringTranslate.e2z("FnEwEnDeFeOaLwLaOeWnNeOeTeInFnYe"));
  static final Message_Type MODIFYROOMREQ = Message_Type._(2030, _omitEnumNames ? '' : StringTranslate.e2z("MwOnDnIwFnYeReOaOaMwRaEnQe"));
  static final Message_Type MODIFYROOMRSP = Message_Type._(2031, _omitEnumNames ? '' : StringTranslate.e2z("MeOwDnIaFaYaReOaOaMeRnSePn"));
  static final Message_Type ORDERREFUNDSTATUSNOTIFY = Message_Type._(2032, _omitEnumNames ? '' : StringTranslate.e2z("OnRnDnEeReRwEaFwUnNnDnSwTnAnTaUwSnNnOeTnIeFaYn"));
  static final Message_Type MARKUSERSTARREQ = Message_Type._(2033, _omitEnumNames ? '' : StringTranslate.e2z("MeAwRnKnUaSeEnRnSeTnAnRnRnEnQe"));
  static final Message_Type CANCELCHATAPPLYREQ = Message_Type._(2034, _omitEnumNames ? '' : StringTranslate.e2z("CnAnNnCwEwLnCnHwAnTnAnPnPwLnYnReEaQn"));
  static final Message_Type REJECTCHATINVITEREQ = Message_Type._(2035, _omitEnumNames ? '' : StringTranslate.e2z("RaEaJeEwCeTnCnHnAeTeInNaVnIwTeEeRaEwQa"));
  static final Message_Type CHATCALLREQ = Message_Type._(2036, _omitEnumNames ? '' : StringTranslate.e2z("CwHeAnTnCnAwLaLeRaEnQn"));
  static final Message_Type CHATCALLRSP = Message_Type._(2037, _omitEnumNames ? '' : StringTranslate.e2z("CnHeAaTnCeAaLnLnRaSaPa"));
  static final Message_Type CHATCALLPSH = Message_Type._(2038, _omitEnumNames ? '' : StringTranslate.e2z("CnHnAwTnCeAwLwLwPeSnHe"));
  static final Message_Type USERSKILLAUDITSTATUSCHANGE = Message_Type._(2039, _omitEnumNames ? '' : StringTranslate.e2z("UnSeEwReSeKnInLnLwAnUnDnIwTaSnTwAeTeUeSeCwHeAnNeGeEn"));
  static final Message_Type GODSTATUSCHANGE = Message_Type._(2040, _omitEnumNames ? '' : StringTranslate.e2z("GnOwDnSnTwAeTwUaSwCaHeAnNwGnEn"));
  static final Message_Type AVATARAUDITSTATUSCHANGE = Message_Type._(2041, _omitEnumNames ? '' : StringTranslate.e2z("AaVnAaTnAaRwAwUnDaIwTnSnTnAnTwUaSnCnHaAaNaGeEn"));
  static final Message_Type CUSTOMERSERVICEREQ = Message_Type._(2042, _omitEnumNames ? '' : StringTranslate.e2z("CnUwSnTwOnMwEnRaSnEeRnVaInCnEaRnEaQa"));
  static final Message_Type CUSTOMERSERVICERSP = Message_Type._(2043, _omitEnumNames ? '' : StringTranslate.e2z("CnUeSnTnOaMwEnRnSaEwRnVnIeCnEwReSePn"));
  static final Message_Type RESTOREROOMPSH = Message_Type._(2044, _omitEnumNames ? '' : StringTranslate.e2z("RnEeSaTnOwRwEnRwOnOaMwPwSaHn"));
  static final Message_Type ASSIGNROOMMANAGERREQ = Message_Type._(2045, _omitEnumNames ? '' : StringTranslate.e2z("AnSnSnInGwNeRnOaOwMaMeAaNaAnGwEeReReEwQa"));
  static final Message_Type CANCELROOMMANAGERREQ = Message_Type._(2046, _omitEnumNames ? '' : StringTranslate.e2z("CnAwNaCaEnLeReOnOeMeMaAaNwAaGnEwReRnEnQw"));
  static final Message_Type UNBLOCKROOMMEMBERREQ = Message_Type._(2047, _omitEnumNames ? '' : StringTranslate.e2z("UnNnBwLwOaCwKnReOeOeMwMnEwMnBeEeRaReEnQw"));
  static final Message_Type PUBLISHROOMANNOUNCEMENTREQ = Message_Type._(2048, _omitEnumNames ? '' : StringTranslate.e2z("PaUeBaLnInSaHnRwOaOnMnAwNwNnOwUwNnCnEeMwEwNaTaReEaQn"));
  static final Message_Type DELETEROOMANNOUNCEMENTREQ = Message_Type._(2049, _omitEnumNames ? '' : StringTranslate.e2z("DwEwLnEwTeEwRnOaOeMwAwNnNeOwUeNaCaEaMeEnNeTeReEwQn"));
  static final Message_Type RECRUITROOMMEMBERREQ = Message_Type._(2050, _omitEnumNames ? '' : StringTranslate.e2z("RaEeCaRnUeInTaRnOwOwMeMaEnMnBwEnReRaEaQn"));
  static final Message_Type RECRUITROOMMEMBERPSH = Message_Type._(2051, _omitEnumNames ? '' : StringTranslate.e2z("RnEnCnRwUnIwTnRwOaOeMaMeEeMnBnEwRnPnSnHa"));
  static final Message_Type LOCKROOMMICSREQ = Message_Type._(2052, _omitEnumNames ? '' : StringTranslate.e2z("LnOnCwKnRaOnOwMnMaInCaSnRnEeQn"));
  static final Message_Type BANROOMMEMBERMICREQ = Message_Type._(2053, _omitEnumNames ? '' : StringTranslate.e2z("BeAaNnRnOnOwMwMeEnMaBeEeRnMnIaCnReEeQw"));
  static final Message_Type GETROOMMEMBERINFOREQ = Message_Type._(2054, _omitEnumNames ? '' : StringTranslate.e2z("GaEeTnRwOwOwMaMaEwMwBaEwRnIwNnFeOnReEnQw"));
  static final Message_Type GETROOMMEMBERINFORSP = Message_Type._(2055, _omitEnumNames ? '' : StringTranslate.e2z("GaEaTaRnOeOaMaMwEeMnBnEwReIwNnFnOeRaSnPa"));
  static final Message_Type SENDCHATCALLGIFTREQ = Message_Type._(2056, _omitEnumNames ? '' : StringTranslate.e2z("SaEaNnDnCeHeAaTnCwAnLnLnGaIwFaTnRnEaQa"));
  static final Message_Type CHATCALLGIFTPSH = Message_Type._(2057, _omitEnumNames ? '' : StringTranslate.e2z("CnHnAnTeCnAwLeLaGwIeFnTnPwSaHw"));
  static final Message_Type RATECHATCALLREQ = Message_Type._(2058, _omitEnumNames ? '' : StringTranslate.e2z("ReAeTaEeCnHnAnTwCwAnLaLnRaEaQa"));
  static final Message_Type CHECKCALLREQ = Message_Type._(2059, _omitEnumNames ? '' : StringTranslate.e2z("CaHnEwCwKaCeAnLnLnRnEnQw"));
  static final Message_Type CHECKCALLRSP = Message_Type._(2060, _omitEnumNames ? '' : StringTranslate.e2z("CnHeEnCwKeCnAnLaLeRnSaPn"));
  static final Message_Type CHATCALLMATCHREQ = Message_Type._(2061, _omitEnumNames ? '' : StringTranslate.e2z("CaHnAnTaCeAaLnLnMnAwTnCnHaReEeQw"));
  static final Message_Type CHATCALLMATCHRSP = Message_Type._(2062, _omitEnumNames ? '' : StringTranslate.e2z("CaHnAnTwCwAwLnLwMaAnTnCwHnRwSaPa"));
  static final Message_Type CHATCALLMATCHPSH = Message_Type._(2063, _omitEnumNames ? '' : StringTranslate.e2z("CnHnAaTaCeAnLnLaMeAwTnCnHePwSeHn"));
  static final Message_Type CANCELCHATCALLMATCHREQ = Message_Type._(2064, _omitEnumNames ? '' : StringTranslate.e2z("CnAnNnCaEwLeCaHnAnTnCeAaLnLnMwAwTeCwHwRnEeQn"));
  static final Message_Type TIPNOTIFY = Message_Type._(2065, _omitEnumNames ? '' : StringTranslate.e2z("TeInPnNaOeTwIwFnYw"));
  static final Message_Type BALANCEINSUFFICIENTNOTIFY = Message_Type._(2066, _omitEnumNames ? '' : StringTranslate.e2z("BeAaLaAaNwCnEwIwNnSwUnFnFnInCaInEwNnTwNnOeTnInFnYa"));
  static final Message_Type CUSTOMERONLINENOTIY = Message_Type._(2067, _omitEnumNames ? '' : StringTranslate.e2z("CnUaSnTwOaMnEaReOnNeLnInNaEnNwOnTeInYw"));
  static final Message_Type PICVIDEOSAUDITSTATUSCHANGENOTIFY = Message_Type._(2068, _omitEnumNames ? '' : StringTranslate.e2z("PaIaCnVeInDeEeOnSnAnUnDaIwTeSnTnAnTnUaSnCnHaAaNeGaEnNnOnTnInFwYe"));
  static final Message_Type RECOVERSTATEREQ = Message_Type._(2069, _omitEnumNames ? '' : StringTranslate.e2z("RnEeCnOnVwEnReSeTnAeTeEwRaEeQn"));
  static final Message_Type VIEWAICVIDEOREQ = Message_Type._(2070, _omitEnumNames ? '' : StringTranslate.e2z("VnInEnWaAaInCnVnInDaEnOaRaEnQa"));
  static final Message_Type AICALLREQ = Message_Type._(2071, _omitEnumNames ? '' : StringTranslate.e2z("AaIwCeAnLeLeRnEwQa"));
  static final Message_Type RATEAPPNOTIFY = Message_Type._(2072, _omitEnumNames ? '' : StringTranslate.e2z("RnAnTnEnAaPnPeNnOwTnInFnYn"));
  static final Message_Type BEGGIFTREQ = Message_Type._(2073, _omitEnumNames ? '' : StringTranslate.e2z("BeEwGaGaInFnTaRwEnQn"));
  static final Message_Type BEGGIFTPSH = Message_Type._(2074, _omitEnumNames ? '' : StringTranslate.e2z("BaEwGwGwIeFnTaPeSnHe"));
  static final Message_Type CONFIRMCHATCALLMATCHREQ = Message_Type._(2075, _omitEnumNames ? '' : StringTranslate.e2z("CnOeNwFwIwRaMaCaHwAnTnCnAaLwLwMaAnTaCwHnRwEeQa"));

  static final $core.List<Message_Type> values = <Message_Type> [
    UNKNOWN,
    CREATEROOMREQ,
    CREATEROOMRSP,
    JOINROOMREQ,
    JOINROOMRSP,
    SENDROOMMESSAGEREQ,
    SENDROOMMGIFTREQ,
    APPLYCHATREQ,
    INVITECHATREQ,
    CONFIRMCHATINVITEREQ,
    REJECTCHATAPPLYREQ,
    QUITCHATREQ,
    ROOMPAYLOADNOTIFY,
    UPDATECAMMICSTATUSREQ,
    RESUMEROOMREQ,
    ENDROOMREQ,
    ENDROOMRSP,
    KICKMEMBERREQ,
    GETROOMMEMBERSREQ,
    GETROOMMEMBERSRSP,
    GETROOMINFOREQ,
    GETROOMINFORSP,
    GETUSERONLINETIMEREQ,
    GETUSERONLINETIMERSP,
    QUITROOMREQ,
    KICKCHATMEMBERREQ,
    CANCELCHATINVITEREQ,
    ORDERSTATUSNOTIFY,
    SYSNOTIFICATIONNOTIFY,
    ACTIVITYNOTIFY,
    FEEDFOLLOWNOTIFY,
    MODIFYROOMREQ,
    MODIFYROOMRSP,
    ORDERREFUNDSTATUSNOTIFY,
    MARKUSERSTARREQ,
    CANCELCHATAPPLYREQ,
    REJECTCHATINVITEREQ,
    CHATCALLREQ,
    CHATCALLRSP,
    CHATCALLPSH,
    USERSKILLAUDITSTATUSCHANGE,
    GODSTATUSCHANGE,
    AVATARAUDITSTATUSCHANGE,
    CUSTOMERSERVICEREQ,
    CUSTOMERSERVICERSP,
    RESTOREROOMPSH,
    ASSIGNROOMMANAGERREQ,
    CANCELROOMMANAGERREQ,
    UNBLOCKROOMMEMBERREQ,
    PUBLISHROOMANNOUNCEMENTREQ,
    DELETEROOMANNOUNCEMENTREQ,
    RECRUITROOMMEMBERREQ,
    RECRUITROOMMEMBERPSH,
    LOCKROOMMICSREQ,
    BANROOMMEMBERMICREQ,
    GETROOMMEMBERINFOREQ,
    GETROOMMEMBERINFORSP,
    SENDCHATCALLGIFTREQ,
    CHATCALLGIFTPSH,
    RATECHATCALLREQ,
    CHECKCALLREQ,
    CHECKCALLRSP,
    CHATCALLMATCHREQ,
    CHATCALLMATCHRSP,
    CHATCALLMATCHPSH,
    CANCELCHATCALLMATCHREQ,
    TIPNOTIFY,
    BALANCEINSUFFICIENTNOTIFY,
    CUSTOMERONLINENOTIY,
    PICVIDEOSAUDITSTATUSCHANGENOTIFY,
    RECOVERSTATEREQ,
    VIEWAICVIDEOREQ,
    AICALLREQ,
    RATEAPPNOTIFY,
    BEGGIFTREQ,
    BEGGIFTPSH,
    CONFIRMCHATCALLMATCHREQ,
  ];

  static final $core.Map<$core.int, Message_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Message_Type? valueOf($core.int value) => _byValue[value];

  const Message_Type._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
