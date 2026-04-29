import 'dart:async';

import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/db/WenanCodeChatDBService.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/proto/we_ps_auth.pb.dart';
import 'package:wenan/proto/we_ps_sync.pbenum.dart';
import 'package:wenan/db/repository/im/WenanCodeChatDraftManager.dart';
import 'package:wenan/db/repository/im/WenanCodeChatListModule.dart';
import 'package:wenan/db/repository/im/WenanCodeChatListOtherManager.dart';
import 'package:wenan/db/repository/im/WenanCodeChatSnapModule.dart';
import 'package:wenan/db/repository/im/WenanCodeChatSnapSendQueue.dart';
import 'package:wenan/http/socket/WenanCodesocket_api.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:fixnum/fixnum.dart';


class ChatContext {
  late ChatListModule _listModule;

  ChatListModule get listModule => _listModule;

  late ChatSnapModule _snapModule;

  ChatSnapModule get snapModule => _snapModule;

  late ChatSnapSendQueue _sendQueue;

  ChatSnapSendQueue get sendQueue => _sendQueue;

  late ChatDraftManager _draftManager;

  ChatDraftManager get draftManager => _draftManager;

  late ChatDBService _dbService;

  ChatDBService get dbService => _dbService;

  late ChatListOtherManager _otherManager;

  ChatListOtherManager get otherManager => _otherManager;

  int get unreadCount => listModule.chatCount + _otherManager.unreadCount;

  bool get hasUnreadPoint => listModule.hasChatUnread;

  int _currentChatId = 0;

  get currentChatId => _currentChatId;

  set currentChatId(id) {
    _currentChatId = id;
    _listModule.updateChatBoxLastReadTime(id);
  }

  late StreamSubscription _authSubscription, _chatEventSubscription;

  void resetCurrentChatIdByCheckId(int checkId) {
    if (_currentChatId == checkId) _currentChatId = 0;
    _listModule.updateChatBoxLastReadTime(checkId);
  }

  Future dispose() async {
    _authSubscription.cancel();
    _chatEventSubscription.cancel();
    _otherManager.dispose();
    await _draftManager.saveChatDrafts();
    await _dbService.dispose();
  }

  Future init() async {
    AuvChatLog.d("ChatContext init start");
    _draftManager = ChatDraftManager();
    _listModule = ChatListModule();
    _snapModule = ChatSnapModule();
    _sendQueue = ChatSnapSendQueue();
    _dbService = ChatDBService();
    await _dbService.init();
    _otherManager = ChatListOtherManager();

    _draftManager.loadDrafts();
    _listModule.reloadChatBoxes().then((value) {
      Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadCompletion));
    });
    _otherManager.initialize();
    AuvChatLog.d("ChatContext _syncMessage init");
    _syncMessage();
    AuvChatLog.d("ChatContext _listenAuthEvent init");
    _listenAuthEvent();
    _listenChatEvent();
  }

  //发生在退出登录和登录后
  void onUserChange(bool quit) async{
    AuvChatLog.d("onUserChange:$quit");
    await _dbService.dispose();
    if(!quit){
      _dbService = ChatDBService();
      await _dbService.init();
      _draftManager.loadDrafts();
      _listModule.reloadChatBoxes().then((value) {
        Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadCompletion));
      });
      _otherManager.initialize();
    }
  }

  void _syncMessage() {
    if (!Application.isSocketAuthed()) return;
    AuvChatLog.d('_syncMessage - '
        '\n\tchatBox key: ${_dbService.chatBoxDao.lastSyncKey}'
        '\n\tsnap key: ${_dbService.snapDao.lastSyncKey}');
    SocketApi.sendSync(SyncType.CHATBOX, Int64(_dbService.chatBoxDao.lastSyncKey));
    SocketApi.sendSync(SyncType.SNAP, Int64(_dbService.snapDao.lastSyncKey));
  }

  void _listenAuthEvent() {
    _authSubscription = Application.eventBus.on<AuthRsp>().listen((event) {
      if (event.needUpgrade != 2) {
        _syncMessage();
      }
    });
  }

  void _listenChatEvent() {
    AuvChatLog.d('ChatContext - _listenChatEvent: init');
    Application.eventBus.on<ChatEvent>().listen((event) {
      AuvChatLog.d('ChatContext - ChatEvent: ${event.toString()}');
    });
    _chatEventSubscription = Application.eventBus.on<ChatEvent>().listen((event) {
      AuvChatLog.d('ChatContext - _listenChatEvent: ${event.toString()}');
      switch (event.type) {
        case ChatEventType.chatBoxSync:
          _listModule.reloadChatBoxByAffectChatBoxes(event.affects).then((value) {
            if (value) {
              Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadCompletion));
            }
          });
          break;
        case ChatEventType.chatBoxReloadByIds:
          _listModule.reloadChatBoxByIds(event.chatIds).then((value) {
            if (value) {
              Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadCompletion));
            }
          });
          break;
        case ChatEventType.snapFeedback:
          playNewSnapFeedback(event.chatIds);
          break;
        default:
          break;
      }
    });
  }

  void playNewSnapFeedback(List<int>? chatIds) {
    if (chatIds == null || chatIds.isEmpty) return;
    bool play = false;
    for (final id in chatIds) {
      if (_currentChatId != id) {
        /// 无 mute ，所以直接设置为 播放
        play = true;
        break;
//        ChatBox c = ChatBox();
//        c.id = id;
//        final index = _listModule.chatBoxes.indexOf(c);
//        if (index > -1) play = !_listModule.chatBoxes[index].muted;
//        if (play) break;
      }
    }
    // if (play) FeedbackUtils.playSoundVibraAccordingToSettings();
  }
}
