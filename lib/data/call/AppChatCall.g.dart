// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppChatCall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppChatCall _$AppChatCallFromJson(Map<String, dynamic> json) => AppChatCall()
  ..id = AppChatCall._dynamicToIntNotNull(json[StringTranslate.e2z("indw")])
  ..chatId = AppChatCall._dynamicToInt(json[StringTranslate.e2z("cwhnantnIade")])
  ..from = AppChatCall._dynamicToInt(json[StringTranslate.e2z("fernonmn")])
  ..subscriberId = AppChatCall._dynamicToInt(json[StringTranslate.e2z("sauwbwsncwrniwbnenrwIedw")])
  ..deductionTime = AppChatCall._dynamicToInt(json[StringTranslate.e2z("dneadeuncntainoeneTeiwmaen")])
  ..duration = AppChatCall._dynamicToInt(json[StringTranslate.e2z("dnueraaetninonnw")])
  ..cost = AppChatCall._dynamicToInt(json[StringTranslate.e2z("ceonsntn")])
  ..income = AppChatCall._dynamicToInt(json[StringTranslate.e2z("innecnowmeen")])
  ..balance = AppChatCall._dynamicToInt(json[StringTranslate.e2z("baanlaawnncaen")])
  ..chatPrice = AppChatCall._dynamicToInt(json[StringTranslate.e2z("cahnantePnrnincnee")])
  ..media = AppChatCall._dynamicToInt(json[StringTranslate.e2z("mwendniwaw")])
  ..channelKey = json[StringTranslate.e2z("cahwaannnnealaKaeayn")] as String?
  ..status = AppChatCall._dynamicToChatCallStatus(json[StringTranslate.e2z("sntnantauasw")])
  ..isInduce = AppChatCall._dynamicToBool(json[StringTranslate.e2z("insnInnwdauacaen")])
  ..induceVideo = json[StringTranslate.e2z("innednuncaeeVwiwdneaow")] as String
  ..byeReason = AppChatCall._dynamicToInt(json[StringTranslate.e2z("bayaenRaenaesnonnw")])
  ..sourceType = AppChatCall._dynamicToInt(json[StringTranslate.e2z("saonunrncwenTwynpnea")])
  ..sourceId = AppChatCall._dynamicToInt(json[StringTranslate.e2z("snoeuwrecwenIndn")]);

Map<String, dynamic> _$AppChatCallToJson(AppChatCall instance) =>
    <String, dynamic>{
      StringTranslate.e2z("inde"): instance.id,
      StringTranslate.e2z("cahaanteIwdw"): instance.chatId,
      StringTranslate.e2z("fareoamn"): instance.from,
      StringTranslate.e2z("snunbesacerniwbwewraIadn"): instance.subscriberId,
      StringTranslate.e2z("dnendwuncateiaoeneTninmnen"): instance.deductionTime,
      StringTranslate.e2z("daunrwawtnieoenn"): instance.duration,
      StringTranslate.e2z("cwoaswtn"): instance.cost,
      StringTranslate.e2z("innecnoamaea"): instance.income,
      StringTranslate.e2z("bnanlnannncwee"): instance.balance,
      StringTranslate.e2z("cahaantnPnreincnew"): instance.chatPrice,
      StringTranslate.e2z("mweedeinan"): instance.media,
      StringTranslate.e2z("cwhnannenneeleKneeyn"): instance.channelKey,
      StringTranslate.e2z("sntaaateunse"): _$ChatCallStatusEnumMap[instance.status]!,
      StringTranslate.e2z("iaswIenwdeuecnee"): instance.isInduce,
      StringTranslate.e2z("iwnwdnuncnenVaiwdnewon"): instance.induceVideo,
      StringTranslate.e2z("baywewRaeeaasnoann"): instance.byeReason,
      StringTranslate.e2z("snoauarnceenTnyepnew"): instance.sourceType,
      StringTranslate.e2z("seoaunrwcnewIedn"): instance.sourceId,
    };

const _$ChatCallStatusEnumMap = {
  ChatCallStatus.trying: 'trying',
  ChatCallStatus.ringing: 'ringing',
  ChatCallStatus.pickup: 'pickup',
  ChatCallStatus.confirmed: 'confirmed',
  ChatCallStatus.requestTimeout: 'requestTimeout',
  ChatCallStatus.busyHere: 'busyHere',
  ChatCallStatus.rejected: 'rejected',
  ChatCallStatus.canceled: 'canceled',
  ChatCallStatus.unreachable: 'unreachable',
  ChatCallStatus.bye: 'bye',
};
