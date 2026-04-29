
enum ChatEventType {
  chatBoxSync, // 对应 affects
  chatBoxReloadByIds, // 对应 chatIds
  chatBoxReloadCompletion,
  snapSync, // 对应 affects
  snapFeedback, // 对应 chatIds
  snapSendStatus, // 对应 object
  snapResend, // 对应 object
  snapRecall, // 对应 object
}

class ChatEvent {
  static const String AFFECT_ADD = 'AFFECT_ADD';
  static const String AFFECT_UPDATE = 'AFFECT_UPDATE';
  static const String AFFECT_DELETE = 'AFFECT_DELETE';

  final ChatEventType type;
  final dynamic object;
  final List<int>? chatIds;
  final Map<String, List>? affects;

  ChatEvent(
    this.type, {
    this.object,
    this.chatIds,
    this.affects,
  });

  @override
  String toString() {
    return "type:$type,affects:$affects";
  }
}
