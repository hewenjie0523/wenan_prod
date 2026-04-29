
import 'package:drift/drift.dart';

@DataClassName('ChatBoxEntity')
class ChatBoxEntities extends Table {
  IntColumn get id => integer()();

  // ChatBox 类型 Chatbox_Type values
  IntColumn get type => integer().withDefault(const Constant(0))();

  TextColumn get name => text().nullable()();

  TextColumn get coverURL => text().nullable()();

  IntColumn get owner => integer().withDefault(const Constant(0))();

  TextColumn get qrCodeURL => text().nullable()();

  // ChatBox 显示权重, 第一排序为 weight 从大到小排序, weight 相同时, 使用第二排序 update_time 倒序排列
  IntColumn get weight => integer().withDefault(const Constant(-1))();

  // 是否免打扰
  BoolColumn get muted => boolean().withDefault(const Constant(false))();

  // ChatBox 中未读 snap 数量 (对于本地存储聊天消息，在读取的时候会重新计算)
  IntColumn get unreadCount => integer().withDefault(const Constant(0))();

  // 最后更新时间
  IntColumn get updateTime => integer().withDefault(const Constant(0))();

  // 附加信息, 暂时只用在标识陌生人 ChatBox 来源
  TextColumn get additionalInfo => text().nullable()();

  // 描述信息
  TextColumn get desc => text().nullable()();

  /// Added Properties

  BoolColumn get serviceChat => boolean().withDefault(const Constant(false))();

  BoolColumn get hasChat => boolean().withDefault(const Constant(false))();

  // 计算“更多 snap 数目”
  IntColumn get lastReadSnapTime => integer().withDefault(const Constant(0))();

  // 判断 snap 中 media 资源是否过期
  IntColumn get clearCacheTime => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
