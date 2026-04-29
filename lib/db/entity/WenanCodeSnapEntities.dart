
import 'package:drift/drift.dart';
import 'package:wenan/db/converter/WenanCodeDBConverters.dart';

@DataClassName('SnapEntity')
class SnapEntities extends Table {
  IntColumn get pk => integer().autoIncrement()();

  IntColumn get id => integer().withDefault(const Constant(0))();

  IntColumn get cid => integer().withDefault(const Constant(0))();

  IntColumn get owner => integer().nullable()();

  TextColumn get ownerHead => text().nullable()();

  TextColumn get ownerName => text().nullable()();

  BoolColumn get unread => boolean().withDefault(const Constant(false))();

  IntColumn get createTime => integer().withDefault(const Constant(0))();

  IntColumn get prevSnapId => integer().withDefault(const Constant(0))();

  // Snap_SnapType values
  IntColumn get type => integer().withDefault(const Constant(0))();

  // 文本内容TXT_SNAP,图片IMG_SNAP 和 WEAK_SNAP 类型消息有效
  TextColumn get textContent => text().nullable()();

  TextColumn get image => text().map(const AppImageConverter()).nullable()();

  TextColumn get video => text().map(const AppVideoConverter()).nullable()();

  TextColumn get voice => text().map(const AppVoiceConverter()).nullable()();

  TextColumn get images => text().map(const AppImageListConverter()).nullable()();

  TextColumn get jsonContent => text().nullable()();

  IntColumn get localId => integer().withDefault(const Constant(0))();

  TextColumn get extensions => text().nullable()();

  IntColumn get redPacketId => integer().withDefault(const Constant(0))();

  IntColumn get repliedSnapId => integer().withDefault(const Constant(0))();

  // 0:正常状态 1:已经撤回
  IntColumn get status => integer().withDefault(const Constant(0))();

  /// Added Properties

  // ChatSnapSendStatus values
  IntColumn get sendStatus => integer().withDefault(const Constant(0))();

  // ChatSnapRedPackageStatus values
  IntColumn get redPacketStatus => integer().withDefault(const Constant(0))();

  // RedPacket_PacketType values
  IntColumn get redPacketType => integer().withDefault(const Constant(0))();

  RealColumn get redPacketAmount => real().withDefault(const Constant(0))();

  IntColumn get redPacketTotalCount => integer().withDefault(const Constant(0))();

  TextColumn get redPacketMessage => text().nullable()();
}
