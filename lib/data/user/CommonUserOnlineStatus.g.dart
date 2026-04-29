// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CommonUserOnlineStatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonUserOnlineStatus _$CommonUserOnlineStatusFromJson(
        Map<String, dynamic> json) =>
    CommonUserOnlineStatus()
      ..uid = CommonUserOnlineStatus._dynamicToInt(json[StringTranslate.e2z("uniwdw")])
      ..onlineTime = CommonUserOnlineStatus._dynamicToInt(json[StringTranslate.e2z("onnwlaiwnnee_atainmaen")])
      ..online = CommonUserOnlineStatus._dynamicToBool(json[StringTranslate.e2z("oenwlaianaen")])
      ..onLive = CommonUserOnlineStatus._dynamicToBool(json[StringTranslate.e2z("oann_alainvnee")])
      ..roomId = CommonUserOnlineStatus._dynamicToInt(json[StringTranslate.e2z("rwoaonmw_ninda")])
      ..isPrivateLive =
          CommonUserOnlineStatus._dynamicToBool(json[StringTranslate.e2z("pwreinvnaetnew_alnieveen")])
      ..roomType = CommonUserOnlineStatus._dynamicToInt(json[StringTranslate.e2z("rwononme_ntwynpnen")])
      ..roomTopicName = json[StringTranslate.e2z("rnowonme_ataoapnincw")] as String?
      ..onCall = CommonUserOnlineStatus._dynamicToBool(json[StringTranslate.e2z("onnn_ncnanlaln")]);

Map<String, dynamic> _$CommonUserOnlineStatusToJson(
        CommonUserOnlineStatus instance) =>
    <String, dynamic>{
      StringTranslate.e2z("uwiada"): instance.uid,
      StringTranslate.e2z("oeneleinneea_wteinmeea"): instance.onlineTime,
      StringTranslate.e2z("onnnlninnaea"): instance.online,
      StringTranslate.e2z("oanw_elwiavnen"): instance.onLive,
      StringTranslate.e2z("rwonoamn_eindn"): instance.roomId,
      StringTranslate.e2z("parwiwvaantwee_elninvnea"): instance.isPrivateLive,
      StringTranslate.e2z("rnoaowma_ntwywpnen"): instance.roomType,
      StringTranslate.e2z("rwowonmn_etwowpniwcn"): instance.roomTopicName,
      StringTranslate.e2z("oena_wcwaelnlw"): instance.onCall,
    };
