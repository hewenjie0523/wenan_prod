import 'dart:async';
import 'dart:convert';

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/data/chat/WenanCodeChatListOtherEvent.dart';
import 'package:wenan/data/chat/WenanCodeChatListOtherItem.dart';
import 'package:wenan/data/chat/NotifyLatestItem.dart';
import 'package:wenan/http/SysNotifyApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';

class ChatListOtherManager {
  ChatListOtherItem _notifyItem = ChatListOtherItem();

  ChatListOtherItem get notifyItem => _notifyItem;

  late StreamSubscription _subscription;

  int get unreadCount {
    int count = 0;
    count += _notifyItem.count ?? 0;
    return count;
  }

  void dispose() {
    _subscription.cancel();
  }

  void initialize() {
    reloadNotifyMessage(null);
    Application.eventBus
        .fire(ChatListOtherEvent(ChatListOtherEventType.updateCompleted));

    _subscription =
        Application.eventBus.on<ChatListOtherEvent>().listen((event) {
      AuvChatLog.d(
          'ChatListOtherManager - initialize : ChatListOtherEvent ${event.type}');
      switch (event.type) {
        case ChatListOtherEventType.notifyMessageChanged:
          loadNotifyMessage();
          // FeedbackUtils.playSoundVibraAccordingToSettings();
          break;
        // case ChatListOtherEventType.activityMessageChanged:
        //   loadActivityMessage();
        //   FeedbackUtils.playSoundVibraAccordingToSettings();
        //   break;
        default:
          break;
      }
    });

    loadAllData();
  }

  void loadAllData() async {
    loadNotifyMessage();

    // List<Future<BaseResponse>> futures = [];
    // futures.add(OrderAPI.orderNoticeLatest());
    // futures.add(NotifyAPI.notifyLatest());
    // futures.add(ActivityAPI.activityLatest());
    // Future.wait(futures).then((responses) {
    //   if (Utils.isEmptyList(responses)) return;
    //
    //
    //   final notifyRsp = responses[1];
    //   if (notifyRsp.isSuccess()) {
    //     reloadNotifyMessage(notifyRsp.data);
    //   }
    //
    //
    //   Application.eventBus
    //       .fire(ChatListOtherEvent(ChatListOtherEventType.updateCompleted));
    // });
    return;
  }

  void loadNotifyMessage() async {
    try {
      if (!Application.isLogin()) {
        return;
      }
      var latestInfo = await SysNotifyApi(DioHelper.getInstance()).latestInfo();
      if (latestInfo.data != null) {
        AuvChatLog.d("latestInfo.data=${latestInfo.data.toString()}");
        reloadNotifyMessage(latestInfo.data);
        Application.eventBus
            .fire(ChatListOtherEvent(ChatListOtherEventType.updateCompleted));
      }
    } catch (e) {
      AuvChatLog.printE(e);
    }
  }

  void reloadNotifyMessage(NotifyLatestItem? info) {
    AuvChatLog.d('ChatListOtherManager - reloadNotifyMessage : start');
    try {
      if (info == null) {
        info = _cachedInfo(_CACHE_KEY_NOTIFY);
      } else {
        _cacheInfo(_CACHE_KEY_NOTIFY, info);
      }
    } catch (e) {
      AuvChatLog.printE(e);
    }

    AuvChatLog.d('ChatListOtherManager - reloadNotifyMessage : $info');

    _notifyItem = ChatListOtherItem();
    _notifyItem.type = ChatListOtherItemType.notify;
    _notifyItem.icon = 'chat/wwecnuaMnE_KryeysK_Xi3cs_zl9iisAt4_qnToTtNiufJyn';
    _notifyItem.name = StringTranslate.e2z(Application.appLocalizations?.wenan_string_system_notice);

    Utils.nullSafe<NotifyLatestItem>(info, notNullBlock: (item) {
      _notifyItem.content = item.content;
      _notifyItem.time = item.time;
      _notifyItem.count = item.unreadCount;
    });
    if (Utils.isEmptyString(_notifyItem.content)) {
      _notifyItem.content = StringTranslate.e2z(Application.appLocalizations?.wenan_string_no_new_message);
      _notifyItem.time = 0;
    }
  }

  void resetCount(ChatListOtherItemType type) {
    switch (type) {
      case ChatListOtherItemType.notify:
        if ((_notifyItem.count ?? 0) > 0) {
          final info = _cachedInfo(_CACHE_KEY_NOTIFY);
          info?.unreadCount = 0;
          reloadNotifyMessage(info!);
          Application.eventBus
              .fire(ChatListOtherEvent(ChatListOtherEventType.updateCompleted));
        }
        break;
      case ChatListOtherItemType.feedback:
        // no-op for now
        break;
    }
  }

  /// Store

  static const String _CACHE_KEY_NOTIFY = 'sp_chat_cache_key_notify';

  static NotifyLatestItem? _cachedInfo(String key) {
    var cache = SpHelper.getCurrUserString(key);
    if (Utils.isEmpty(cache)) return null;
    return NotifyLatestItem.fromJson(jsonDecode(cache!));
  }

  static void _cacheInfo(String key, NotifyLatestItem info) {
    String cache = jsonEncode(info.toJson());
    SpHelper.putCurrUserString(key, cache);
  }
}
