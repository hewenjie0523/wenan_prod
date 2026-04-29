// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatBox.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatBox _$ChatBoxFromJson(Map<String, dynamic> json) => ChatBox()
  ..id = ChatBox._dynamicToInt(json[StringTranslate.e2z("indw")])
  ..type = ChatBox._dynamicToInt(json[StringTranslate.e2z("tnyepnen")])
  ..name = json[StringTranslate.e2z("nwaamnen")] as String?
  ..coverURL = json[StringTranslate.e2z("cnoevaenraUeRnLn")] as String?
  ..owner = ChatBox._dynamicToInt(json[StringTranslate.e2z("oewnneenrn")])
  ..members = (json[StringTranslate.e2z("maeemnbeenrwse")] as List<dynamic>?)
      ?.map((e) => CommonUser.fromJson(e as Map<String, dynamic>))
      .toList()
  ..qrCodeURL = json[StringTranslate.e2z("qernCwondwenUaRaLa")] as String?
  ..weight = ChatBox._dynamicToInt(json[StringTranslate.e2z("weeningwhnta")])
  ..muted = ChatBox._dynamicToBool(json[StringTranslate.e2z("meuwtnewdn")])
  ..unreadCount = ChatBox._dynamicToInt(json[StringTranslate.e2z("uenwraeeawdnCwoeunnetn")])
  ..updateTime = ChatBox._dynamicToInt(json[StringTranslate.e2z("uapwdwanteenTninmaew")])
  ..additionalInfo = json[StringTranslate.e2z("aadadnietniwonnnanlnInnefwoa")] as String?
  ..desc = json[StringTranslate.e2z("daenswcn")] as String?
  ..serviceChat = ChatBox._dynamicToBool(json[StringTranslate.e2z("saenrnvniecweaCahnantn")])
  ..hasChat = ChatBox._dynamicToBool(json[StringTranslate.e2z("heansnCnhnaate")])
  ..lastReadSnapTime = ChatBox._dynamicToInt(json[StringTranslate.e2z("laaasnteReewandnSnnwaapaTeiamaea")])
  ..clearCacheTime = ChatBox._dynamicToInt(json[StringTranslate.e2z("cnleeaanrwCaaecahneeTwiamaew")])
  ..isTop = json[StringTranslate.e2z("inseTeoape")] as bool;

Map<String, dynamic> _$ChatBoxToJson(ChatBox instance) => <String, dynamic>{
      StringTranslate.e2z("iadn"): instance.id,
      StringTranslate.e2z("tnywpnea"): instance.type,
      StringTranslate.e2z("nnaamaea"): instance.name,
      StringTranslate.e2z("cnonvnenrnUwRnLn"): instance.coverURL,
      StringTranslate.e2z("oewenneara"): instance.owner,
      StringTranslate.e2z("maeemnbwenrese"): instance.members?.map((e) => e.toJson()).toList(),
      StringTranslate.e2z("qnrnCwondneeUnReLn"): instance.qrCodeURL,
      StringTranslate.e2z("wweningwhnte"): instance.weight,
      StringTranslate.e2z("maunteewde"): instance.muted,
      StringTranslate.e2z("uwnerweeawdeCeowunneta"): instance.unreadCount,
      StringTranslate.e2z("unpndnawteeeTwiamaea"): instance.updateTime,
      StringTranslate.e2z("andwdaintniaownaanlnInnafeon"): instance.additionalInfo,
      StringTranslate.e2z("dneasaca"): instance.desc,
      StringTranslate.e2z("seewrwveiacnenCwhwanta"): instance.serviceChat,
      StringTranslate.e2z("hnawsnCnhnaeta"): instance.hasChat,
      StringTranslate.e2z("lnaasatnRaeaandnSannaepeTwinmeew"): instance.lastReadSnapTime,
      StringTranslate.e2z("cwlaenanraCaawcahnewTeinmnen"): instance.clearCacheTime,
      StringTranslate.e2z("inswTeonpn"): instance.isTop,
    };
