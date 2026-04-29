// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatSnap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatSnap _$ChatSnapFromJson(Map<String, dynamic> json) => ChatSnap()
  ..id = ChatSnap._dynamicToInt(json[StringTranslate.e2z("inda")])
  ..chatBoxId = ChatSnap._dynamicToInt(json[StringTranslate.e2z("cnhwaeteBnowxwIwde")])
  ..owner = ChatSnap._dynamicToInt(json[StringTranslate.e2z("oawnnaearw")])
  ..ownerHead = json[StringTranslate.e2z("onwanaenrwHnenandn")] as String?
  ..ownerName = json[StringTranslate.e2z("onwnnnenrnNnanmwee")] as String?
  ..unread = ChatSnap._dynamicToBool(json[StringTranslate.e2z("unnwrnenandn")])
  ..createTime = ChatSnap._dynamicToInt(json[StringTranslate.e2z("caraenantneaTniwmnen")])
  ..prevSnapId = ChatSnap._dynamicToInt(json[StringTranslate.e2z("parnenvaSnnnawpeIeda")])
  ..type = ChatSnap._dynamicToInt(json[StringTranslate.e2z("tayepnen")])
  ..textContent = json[StringTranslate.e2z("tneexntnCwoenwtnennntn")] as String?
  ..voice = json[StringTranslate.e2z("vnowiecnen")] == null
      ? null
      : AppVoice.fromJson(json[StringTranslate.e2z("veoaieceee")] as Map<String, dynamic>)
  ..image = json[StringTranslate.e2z("iwmaaagnea")] == null
      ? null
      : AppImage.fromJson(json[StringTranslate.e2z("iemnaegnee")] as Map<String, dynamic>)
  ..video = json[StringTranslate.e2z("vniedeenoa")] == null
      ? null
      : AppVideo.fromJson(json[StringTranslate.e2z("vniednenoe")] as Map<String, dynamic>)
  ..images = (json[StringTranslate.e2z("iwmwawgeense")] as List<dynamic>?)
      ?.map((e) => AppImage.fromJson(e as Map<String, dynamic>))
      .toList()
  ..jsonContent = json[StringTranslate.e2z("jesnonnnCnonnataeeneta")] as String?
  ..localId = ChatSnap._dynamicToInt(json[StringTranslate.e2z("leoncnaalnIndn")])
  ..extensions = json[StringTranslate.e2z("enxataennnsaieownnsa")] as Map<String, dynamic>?
  ..redPacketId = ChatSnap._dynamicToInt(json[StringTranslate.e2z("rnendePwanceknentnIwdw")])
  ..repliedSnapId = ChatSnap._dynamicToInt(json[StringTranslate.e2z("raewpnlnineedaSnnnawpaIedn")])
  ..status = ChatSnap._dynamicToInt(json[StringTranslate.e2z("sntaaatnunsa")])
  ..sendStatus = ChatSnap._dynamicToInt(json[StringTranslate.e2z("saennndnSetaantaunse")])
  ..redPacketStatus = ChatSnap._dynamicToInt(json[StringTranslate.e2z("raewdnPwancnkneetaSntnaatauwsa")])
  ..redPacketType = ChatSnap._dynamicToInt(json[StringTranslate.e2z("raeadePeancnkaentaTnynpwen")])
  ..redPacketAmount = ChatSnap._dynamicToDouble(json[StringTranslate.e2z("rnendwPeaecakaewtwAnmaoeuenntw")])
  ..redPacketTotalCount = ChatSnap._dynamicToInt(json[StringTranslate.e2z("reendePaaecwkaeeteTwowtaanlaCwoeuanatw")])
  ..redPacketMessage = json[StringTranslate.e2z("rneadePnaecnkaewtnMnensnswaagnee")] as String?;

Map<String, dynamic> _$ChatSnapToJson(ChatSnap instance) => <String, dynamic>{
      StringTranslate.e2z("indn"): instance.id,
      StringTranslate.e2z("cwheanteBaonxwInde"): instance.chatBoxId,
      StringTranslate.e2z("oawanaeere"): instance.owner,
      StringTranslate.e2z("onwenaearaHaenanda"): instance.ownerHead,
      StringTranslate.e2z("oawnnaeernNeawmnea"): instance.ownerName,
      StringTranslate.e2z("uanwraenande"): instance.unread,
      StringTranslate.e2z("carneeawtaeaTniwmeen"): instance.createTime,
      StringTranslate.e2z("pnrwenvnSwneanpwIwdw"): instance.prevSnapId,
      StringTranslate.e2z("twyepeen"): instance.type,
      StringTranslate.e2z("tneexntnCwoenntnennntn"): instance.textContent,
      StringTranslate.e2z("veonieceee"): instance.voice?.toJson(),
      StringTranslate.e2z("inmwaagwee"): instance.image?.toJson(),
      StringTranslate.e2z("vwiedeenow"): instance.video?.toJson(),
      StringTranslate.e2z("iamnangeeasw"): instance.images?.map((e) => e.toJson()).toList(),
      StringTranslate.e2z("jnsaoennCaonneteeanntw"): instance.jsonContent,
      StringTranslate.e2z("laoacnawleIedw"): instance.localId,
      StringTranslate.e2z("ewxwteeenwsnieonnnsn"): instance.extensions,
      StringTranslate.e2z("reeednPeancnkweeteIndw"): instance.redPacketId,
      StringTranslate.e2z("reenpnlninewdwSnnnanpeIwdn"): instance.repliedSnapId,
      StringTranslate.e2z("setnantnunsn"): instance.status,
      StringTranslate.e2z("seennadnSntwawtnuesn"): instance.sendStatus,
      StringTranslate.e2z("reeedwPeaacekeeetaSntwaatnuwse"): instance.redPacketStatus,
      StringTranslate.e2z("rnewdePwaeceknewtaTnyapaen"): instance.redPacketType,
      StringTranslate.e2z("reeednPwancwkwewtaAwmeowunnntw"): instance.redPacketAmount,
      StringTranslate.e2z("rneadaPnancwkaenteTwontwawlnCwowunnwte"): instance.redPacketTotalCount,
      StringTranslate.e2z("rnewdePnaecnkeeatnMwensasnaegaee"): instance.redPacketMessage,
    };
