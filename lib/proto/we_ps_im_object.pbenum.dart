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

import 'package:protobuf/protobuf.dart' as $pb;

class Chatbox_Type extends $pb.ProtobufEnum {
  static final Chatbox_Type SINGLE = Chatbox_Type._(0, _omitEnumNames ? '' : StringTranslate.e2z("SwInNeGaLnEe"));
  static final Chatbox_Type GROUP = Chatbox_Type._(1, _omitEnumNames ? '' : StringTranslate.e2z("GnReOwUwPn"));
  static final Chatbox_Type HORDE = Chatbox_Type._(2, _omitEnumNames ? '' : StringTranslate.e2z("HeOeReDnEn"));
  static final Chatbox_Type PARTY = Chatbox_Type._(3, _omitEnumNames ? '' : StringTranslate.e2z("PnAwRnTwYn"));
  static final Chatbox_Type ANONYMOUS = Chatbox_Type._(4, _omitEnumNames ? '' : StringTranslate.e2z("AeNnOnNaYnMaOnUnSa"));

  static final $core.List<Chatbox_Type> values = <Chatbox_Type> [
    SINGLE,
    GROUP,
    HORDE,
    PARTY,
    ANONYMOUS,
  ];

  static final $core.Map<$core.int, Chatbox_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Chatbox_Type? valueOf($core.int value) => _byValue[value];

  const Chatbox_Type._($core.int v, $core.String n) : super(v, n);
}

class Chatbox_EventFrequency extends $pb.ProtobufEnum {
  static final Chatbox_EventFrequency NEVER = Chatbox_EventFrequency._(0, _omitEnumNames ? '' : StringTranslate.e2z("NaEnVnEnRn"));
  static final Chatbox_EventFrequency EVERYDAY = Chatbox_EventFrequency._(1, _omitEnumNames ? '' : StringTranslate.e2z("EnVnEwRnYaDnAeYn"));
  static final Chatbox_EventFrequency EVERYWEEK = Chatbox_EventFrequency._(2, _omitEnumNames ? '' : StringTranslate.e2z("EnVwEnReYnWwEaEwKw"));
  static final Chatbox_EventFrequency EVERYMONTH = Chatbox_EventFrequency._(3, _omitEnumNames ? '' : StringTranslate.e2z("EeVwEwRaYnMnOaNnTaHa"));

  static final $core.List<Chatbox_EventFrequency> values = <Chatbox_EventFrequency> [
    NEVER,
    EVERYDAY,
    EVERYWEEK,
    EVERYMONTH,
  ];

  static final $core.Map<$core.int, Chatbox_EventFrequency> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Chatbox_EventFrequency? valueOf($core.int value) => _byValue[value];

  const Chatbox_EventFrequency._($core.int v, $core.String n) : super(v, n);
}

class RedPacket_PacketType extends $pb.ProtobufEnum {
  static final RedPacket_PacketType NORMAL = RedPacket_PacketType._(0, _omitEnumNames ? '' : StringTranslate.e2z("NnOnRwMnAnLa"));
  static final RedPacket_PacketType LUCKY = RedPacket_PacketType._(1, _omitEnumNames ? '' : StringTranslate.e2z("LaUwCwKnYa"));

  static final $core.List<RedPacket_PacketType> values = <RedPacket_PacketType> [
    NORMAL,
    LUCKY,
  ];

  static final $core.Map<$core.int, RedPacket_PacketType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RedPacket_PacketType? valueOf($core.int value) => _byValue[value];

  const RedPacket_PacketType._($core.int v, $core.String n) : super(v, n);
}

class Snap_SnapType extends $pb.ProtobufEnum {
  static final Snap_SnapType VIDEO_SNAP = Snap_SnapType._(0, _omitEnumNames ? '' : StringTranslate.e2z("VeIwDeEnOn_nSeNnAnPw"));
  static final Snap_SnapType TXT_SNAP = Snap_SnapType._(1, _omitEnumNames ? '' : StringTranslate.e2z("TwXaTa_nSwNnAaPn"));
  static final Snap_SnapType IMG_SNAP = Snap_SnapType._(2, _omitEnumNames ? '' : StringTranslate.e2z("IeMwGw_eSnNeAaPw"));
  static final Snap_SnapType PARTY_SNAP = Snap_SnapType._(3, _omitEnumNames ? '' : StringTranslate.e2z("PnAwRaTnYn_aSnNaAaPe"));
  static final Snap_SnapType WEAK_SNAP = Snap_SnapType._(4, _omitEnumNames ? '' : StringTranslate.e2z("WwEwAeKn_nSnNwAnPe"));
  static final Snap_SnapType VOICE_SNAP = Snap_SnapType._(5, _omitEnumNames ? '' : StringTranslate.e2z("VwOnIwCeEn_nSnNnAwPn"));
  static final Snap_SnapType JSON_SNAP = Snap_SnapType._(6, _omitEnumNames ? '' : StringTranslate.e2z("JwSaOnNn_aSnNnAnPe"));
  static final Snap_SnapType RED_PACKET_SNAP = Snap_SnapType._(7, _omitEnumNames ? '' : StringTranslate.e2z("RwEeDw_nPeAaCnKnEwTn_nSnNeAnPe"));
  static final Snap_SnapType MULTI_IMG_SNAP = Snap_SnapType._(8, _omitEnumNames ? '' : StringTranslate.e2z("MeUaLwTaIe_aIaMaGn_nSeNeAnPa"));
  static final Snap_SnapType STICKER_SNAP = Snap_SnapType._(9, _omitEnumNames ? '' : StringTranslate.e2z("SwTeIaCnKnEeRn_eSwNwAnPe"));
  static final Snap_SnapType LOCATION_SNAP = Snap_SnapType._(10, _omitEnumNames ? '' : StringTranslate.e2z("LaOwCaAeTwInOaNw_nSwNaAwPw"));

  static final $core.List<Snap_SnapType> values = <Snap_SnapType> [
    VIDEO_SNAP,
    TXT_SNAP,
    IMG_SNAP,
    PARTY_SNAP,
    WEAK_SNAP,
    VOICE_SNAP,
    JSON_SNAP,
    RED_PACKET_SNAP,
    MULTI_IMG_SNAP,
    STICKER_SNAP,
    LOCATION_SNAP,
  ];

  static final $core.Map<$core.int, Snap_SnapType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Snap_SnapType? valueOf($core.int value) => _byValue[value];

  const Snap_SnapType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
