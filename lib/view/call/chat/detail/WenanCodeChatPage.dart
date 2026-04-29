import 'dart:async';
import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pag/pag.dart';
import 'package:tapped/tapped.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeAuvState.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/Gift.dart';
import 'package:wenan/data/chat/ChatBox.dart';
import 'package:wenan/data/chat/WenanCodeChatDateItem.dart';
import 'package:wenan/data/chat/ChatGiftSnap.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/data/chat/ChatSnapJsonContent.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/state/event/WenanChatPriceEvent.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/state/event/WenanCodeEvents.dart';
import 'package:wenan/state/event/WenanCodediscover_event.dart';
import 'package:wenan/http/UserApi.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/http/push/WenanCodePushHelper.dart';
import 'package:wenan/db/repository/im/WenanCodeChatSnapCreator.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/http/socket/WenanCodechat_api.dart';
import 'package:wenan/utils/WenanCodeAuvAudioPlayerManager.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/WenanCodeSharedViewLogic.dart';
import 'package:wenan/view/WenanCodeUserOSView.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';
import 'package:wenan/view/call/chat/detail/WenanCodeChatPageDataSource.dart';
import 'package:wenan/view/call/chat/detail/WenanCodeChatPageStartup.dart';
import 'package:wenan/view/call/chat/detail/views/WenanCodeChatCell.dart';
import 'package:wenan/view/call/chat/detail/views/WenanCodeChatDateCell.dart';
import 'package:wenan/view/call/chat/detail/views/inputToolBar/WenanCodeChatInputToolBar.dart';
import 'package:wenan/view/call/chat/detail/views/inputToolBar/WenanCodeChatInputToolBarFuncPanel.dart';
import 'package:wenan/view/profile/WenanCodepay_handler.dart';
import 'package:wenan/view/profile/view/WenanCodeReportSheet.dart';
import 'package:wenan/view/widgets/WenanCodeAuvNavBar.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/view/match/discover/gift/WenanCodeGiftPage.dart';

import '../../../../utils/WenanCodeDataReporter.dart';

enum ChatScrollPosition {
  start,
  end,
  offset,
}

class ChatPage extends StatefulWidget {
  final Map<String, dynamic> params;
  final ScrollController scrollController;
  const ChatPage(
    this.params,
    this.scrollController, {
    Key? key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends AuvState<ChatPage> with WidgetsBindingObserver implements ChatInputToolBarObserver {
  final ChatPageDataSource _dataSource = ChatPageDataSource();
  final _chatInputToolBarKey = GlobalKey<ChatInputToolBarState>();
  bool _hasNewSnap = false;
  StreamSubscription? _userInfoSubscription, _chatEventSubscription, _chatPriceEventSubscription;
  var scrollOffset = 0.0;
  double giftPaddingBottom = 78.0;
  CommonUser? currUser;
  UserApi? _userApi;

  _ChatPageState();

  @override
  void dispose() {
    AuvChatLog.d('ChatPage - dispose : $this');
    _userInfoSubscription?.cancel();
    _chatEventSubscription?.cancel();
    _chatPriceEventSubscription?.cancel();
    widget.scrollController.dispose();
    AuvAudioPlayerManager.instance.stopPlayAudio();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    AuvChatLog.d('ChatPage - initState : $this');
    WidgetsBinding.instance.addObserver(this);
    final data = widget.params;
    _dataSource.chatBox = data[ChatPageStartup.kParamsChatBox];
    _dataSource.showSnap = data[ChatPageStartup.kParamsShowSnap];
    _dataSource.shareJson = data[ChatPageStartup.kParamsShareJson];
    AuvChatLog.d('ChatPage - _dataSource.chatBox : ${_dataSource.chatBox}');
    _userApi ??= UserApi(DioHelper.getInstance());
    getUserInfo();
    _listenScroll();
    _listenUserInfo();
    _listenChatEvent();

    _viewDidAppear();

    _loadNormalData();

    PushHelper.cleanNotifications(PushHelper.TYPE_CHAT_DETAIL, chatBoxId: _dataSource.chatBox.id);
  }

  @override
  void deactivate() {
    super.deactivate();
    _viewWillDisappear();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (_) => _sendUpdateReadStatusIfNeed(),
        child: Scaffold(
          backgroundColor: ImColors.color_bg,
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          appBar: AuvCupertinoNavigationBar(
            border: null,
            backgroundColor: AppColor.transparent,
            padding: const EdgeInsetsDirectional.only(top: 0),
            leading: UIUtils.navigationCommonBackButton(
              () => FluroRouter.appRouter.pop(context),
            ),
            middle: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                currUser == null
                    ? const SizedBox()
                    : UserOnlineStatusView(
                        uid: _dataSource.chatBox.chatUser!.uid!,
                      ),
                AppGap.hGap4,
                UIUtils.maxWidthText(
                  Text(
                    _dataSource.chatBox.showName ?? "",
                    style: AppTextStyle.style(
                      color: AppColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  MediaQuery.of(context).size.width - 100,
                ),
              ],
            ),
            trailing: CupertinoButton(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              onPressed: () => onSelectInputFunc(ChatInputFuncType.voice),
              child: ImageLoader.loadLocalImage(
                "chat/wgeGn3aana_frXeysz_aiXcC_Jmoo7rIee_yiBcUo4nr",
                width: 20,
                height: 20,
              ),
            ),
          ),
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _chatInputToolBarKey.currentState?.deactivateInputMethod();
                        },
                        child: Listener(
                          onPointerMove: (event) => _chatInputToolBarKey.currentState?.deactivateInputMethod(),
                          child: ListView.separated(
                            key: const PageStorageKey('list'),
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: widget.scrollController,
                            padding: const EdgeInsets.only(bottom: 20.0),
                            itemBuilder: _itemBuilder,
                            separatorBuilder: (context, index) => AppGap.vGap15,
                            itemCount: _dataSource.itemCount + (_dataSource.hasMoreBackward ? 1 : 0),
                          ),
                        ),
                      ),
                    ),
                    ChatInputToolBar(
                      key: _chatInputToolBarKey,
                      observer: this,
                      cachePath: _dataSource.chatBox.cachePath,
                      hintText: _getHintText(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _handleBlock() async {
    if (currUser?.uid == null) {
      return;
    }
    _userApi ??= UserApi(DioHelper.getInstance());
    if (currUser!.isBlocked) {
      try {
        var result = await _userApi!.unBlock(currUser!.uid!);
        if (result.code == 0) {
          currUser!.isBlocked = false;
        }
      } catch (e, stack) {
        AuvChatLog.printE(e, error: stack);
      }
    } else {
      SharedViewLogic.showBlockConfirmDlg(context, okCallBack: () async {
        try {
          var result = await _userApi!.block(currUser!.uid!);
          if (result.code == 0) {
            currUser!.isBlocked = true;
            currUser!.follow = 0;
          }
        } catch (e, stack) {
          AuvChatLog.printE(e, error: stack);
        }
        Application.eventBus.fire(DiscoverEvent(DiscoverEventType.remove, currUser!));
        ChatApi.removeChatBox(cId: _dataSource.chatBox.id);
        if (!disposed) {
          FluroRouter.appRouter.pop(context);
        }
      });
    }
  }


  Widget _itemBuilder(BuildContext context, int index) {
    if ((_dataSource.hasMoreForward && index == 0) || (_dataSource.hasMoreBackward && index + 1 == _dataSource.itemCount + (_dataSource.hasMoreBackward ? 1 : 0))) {
      return Container(
        height: 50.0,
        child: const Center(
          child: CupertinoActivityIndicator(),
        ),
      );
    }

    final item = _dataSource.itemAtIndex(index);
    if (item is ChatDateItem) {
      return ChatDateCell(item: item);
    } else {
      if (item is ChatSnap && item.jsonContentObj != null) {
        item.jsonContentObj?.gender = _dataSource.chatBox.chatUser?.gender;
      }
      return ChatCell(
        snap: item,
        cachePath: _dataSource.chatBox.cachePath,
      );
    }
  }


  _handleFollow() async {
    if (_dataSource.chatBox.chatUser?.uid == null) {
      return;
    }
    _userApi ??= UserApi(DioHelper.getInstance());
    if (currUser!.isFollowed) {
      SharedViewLogic.showUnFollowConfirmDlg(context, okCallBack: () async {
        try {
          var result = await _userApi!.unFollow(currUser!.uid!);
          if (result.code == 0) {
            if (result.data is Map<String, dynamic>) {
              var follow = Utils.parseInt((result.data as Map<String, dynamic>)["follow"]);
              if (follow != null) {
                currUser!.follow = follow;
              }
            }
            Application.eventBus.fire(FollowEvent(currUser!.uid!));
          }
        } catch (e, stack) {
          AuvChatLog.printE(e, error: stack);
        }
      });
    } else {
      try {
        var result = await _userApi!.follow(currUser!.uid!);
        if (result.code == 0) {
          if (result.data is Map<String, dynamic>) {
            var follow = Utils.parseInt((result.data as Map<String, dynamic>)["follow"]);
            AuvChatLog.d("follow=$follow");
            if (follow != null) {
              currUser!.follow = follow;
              Future.delayed(Duration.zero, () => PushHelper.showNotifyPermissionDialog(context, "follow"));
            }
          }
          Application.eventBus.fire(FollowEvent(currUser!.uid!));
        }
      } catch (e, stack) {
        AuvChatLog.printE(e, error: stack);
      }
    }
  }


  bool _shouldScrollToBottom() {
    return !widget.scrollController.hasClients ? false : (widget.scrollController.position.maxScrollExtent - widget.scrollController.position.pixels).abs() < 50.0;
  }


  void _scrollToBottom({bool animated = true}) {
    _scrollToPosition(pos: ChatScrollPosition.end, animated: animated);
  }

  void _scrollToTop({bool animated = true}) {
    _scrollToPosition(pos: ChatScrollPosition.start, animated: animated);
  }


  void _scrollToOffset(double offset, {bool animated = true}) {
    _scrollToPosition(pos: ChatScrollPosition.offset, offset: offset, animated: animated);
  }

  void _scrollToPosition({required ChatScrollPosition pos, double? offset, bool animated = true}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!widget.scrollController.hasClients) return;
      switch (pos) {
        case ChatScrollPosition.start:
          offset = widget.scrollController.position.minScrollExtent;
          break;
        case ChatScrollPosition.end:
          offset = widget.scrollController.position.maxScrollExtent;
          break;
        default:
          break;
      }
      if (offset == null || widget.scrollController.offset == offset) return;
      if (animated) {
        widget.scrollController.animateTo(
          offset!,
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
        );
      } else {
        widget.scrollController.jumpTo(offset!);
      }
    });
  }


  void _addSnaps(List<ChatSnap>? snaps, [bool scrollToBottom = false]) {
    if (Utils.isEmptyList(snaps)) return;
    bool shouldScrollToBottom = scrollToBottom || _shouldScrollToBottom();
    _dataSource.addSnaps(snaps!).then((value) {
      if (value) {
        Utils.callSetStateSafely(this, () {});
        if (shouldScrollToBottom) _scrollToBottom();
      }
    });
  }


  void _addSnap(ChatSnap? snap, [bool scrollToBottom = false]) {
    if (snap == null) return;
    _addSnaps([snap], scrollToBottom);
  }

  void _deleteSnap(ChatSnap snap) {
    if (snap.isIdValid) {
      try {
        ChatApi.deleteSnap(snap.id!).first.then((rsp) {
          ChatUtils.deleteSnapResources(snap);
        });
      } catch (e) {
        AuvChatLog.printE(e);
      }
    } else {
      ChatUtils.deleteSnapResources(snap);
      Application.chatContext.snapModule.deleteLocalSnap(snap);
      if (snap == _dataSource.lastSnap()) {
        Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadByIds, chatIds: [_dataSource.chatBox.id!]));
      }
      _deleteSnaps([snap]);
    }
  }

  void _updateSnaps(List<ChatSnap> snaps) {
    if (Utils.isEmptyList(snaps)) return;
    _dataSource.updateSnaps(snaps).then((value) {
      if (value) Utils.callSetStateSafely(this, () {});
    });
  }


  void _deleteSnaps(List<ChatSnap> snaps) {
    if (Utils.isEmptyList(snaps)) return;
    _dataSource.deleteSnaps(snaps).then((value) {
      if (value) Utils.callSetStateSafely(this, () {});
    });
  }

  /// Lifecycle

  void _viewWillDisappear() {
    AuvChatLog.d('ChatPage - _viewWillDisappear: ${_dataSource.chatBox.id}');
    _sendUpdateReadStatus();
    Application.chatContext.resetCurrentChatIdByCheckId(_dataSource.chatBox.id!);
    Application.chatContext.draftManager.saveChattingDraftForChatBox(_dataSource.chatBox.id);
  }

  void _viewDidAppear() {
    _listenCheckAndSetDraft();
    Application.chatContext.currentChatId = _dataSource.chatBox.id;
    _sendUpdateReadStatus();
  }


  String? _getHintText() {
    int count = SpHelper.getImMessageCountDone() ? 0 : SpHelper.getImMsgFreeCountRemain();
    if (count < 0) {
      count = 0;
    }
    if (Application.commonUser?.isVip() == true || count > 5) {
      return "";
    }
    return StringTranslate.e2z(Application.appLocalizations?.wenan_string_free_msg_chances_left).replaceFirst("s%",count.toString());
  }

  /// Request


  void _sendSnaps(List<ChatSnap>? snaps) {
    if (snaps == null || snaps.isEmpty) return;
    _addSnaps(snaps, true);
    Application.chatContext.sendQueue.sendSnaps(snaps);
  }


  void _sendSnap(ChatSnap? snap, {bool checkVip = true}) {
    if (snap == null) return;
    //非vip且次数已用完
    if (checkVip && SpHelper.getImMessageCountDone() && Application.commonUser?.isVip() == false) {
      SharedViewLogic.showVipDlg(context, PayFromType.FROM_IM_NO_MORE_FREE_MSG);
      return;
    }
    _addSnap(snap, true);
    Application.chatContext.sendQueue.sendSnap(snap).then((value) {
      if (checkVip && !value && SpHelper.getImMessageCountDone() && Application.commonUser?.isVip() == false) {
        SharedViewLogic.showVipDlg(context, PayFromType.FROM_IM_NO_MORE_FREE_MSG);
        return;
      }
      if (value && Application.commonUser?.isVip() == false && !snap.isGiftJsonSnap) {
        SpHelper.setImMsgFreeCountRemain(SpHelper.getImMsgFreeCountRemain() - 1);
      }
      _chatInputToolBarKey.currentState?.setHintText(_getHintText());
    });
  }

  void _resendSnap(ChatSnap? snap) {
    if (snap == null) return;
    ChatSnapCreator.updateSnapCreateTime(snap);
    AuvChatLog.d("_resendSnap,snap=${snap.toJson()}");
    _sendSnap(snap, checkVip: !snap.isGiftJsonSnap);
  }

  void _updateReadStatus() async {
    final lastSnap = _dataSource.lastSnap();
    if (lastSnap == null || (lastSnap.createTime ?? 0) <= _dataSource.lastReadTime) {
      return;
    }
    Application.chatContext.dbService.chatBoxDao
        .updateModelLastReadSnapTime(_dataSource.chatBox.id!, lastSnap.createTime!)
        .then((value) => Application.eventBus.fire(ChatEvent(ChatEventType.chatBoxReloadByIds, chatIds: [_dataSource.chatBox.id!])));
    AuvChatLog.d('ChatPage - _updateReadStatus End');
  }

  void _sendUpdateReadStatusIfNeed() {
    if (_hasNewSnap) {
      _hasNewSnap = false;
      ChatApi.updateChatBoxReadStatus(cId: _dataSource.chatBox.id);
    }
  }


  void _sendUpdateReadStatus() {
    ChatApi.updateChatBoxReadStatus(cId: _dataSource.chatBox.id);
  }

  /// Load Data

  void _loadNormalData() {
    _dataSource.loadData(ChatLoadDirection.normal).then((loaded) {
      if (!loaded) return;
      Utils.callSetStateSafely(this, () {});
      if (_dataSource.showSnap == null) {
        _scrollToBottom(animated: false);
        Future.delayed(const Duration(milliseconds: 300), () {
          Utils.callSetStateSafely(this, () {});
          AuvChatLog.d("msg,_scrollToBottom delayed");
          _scrollToBottom(animated: false);
        });
      } else {
        _scrollToTop(animated: false);
      }
    });
  }


  void _loadBackwardData() {
    _dataSource.loadData(ChatLoadDirection.backward).then((loaded) {
      if (loaded) Utils.callSetStateSafely(this, () {});
    });
  }

  void _loadForwardData() {
    _dataSource.loadData(ChatLoadDirection.forward).then((loaded) {
      if (loaded) Utils.callSetStateSafely(this, () {});
    });
  }


  /// Listener


  _listenScroll() {
    widget.scrollController.addListener(() {
      // AuvChatLog.d("scrollController.offset=${widget.scrollController.offset}");
      scrollOffset = widget.scrollController.offset;
      if (widget.scrollController.offset <= widget.scrollController.position.minScrollExtent) {
        _loadForwardData();
      } else if (widget.scrollController.offset >= widget.scrollController.position.maxScrollExtent) {
        _loadBackwardData();
      }
    });
  }


  _listenCheckAndSetDraft() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final draft = Application.chatContext.draftManager.chatDraftContentForChatBox(_dataSource.chatBox.id!);
      if (!Utils.isEmptyString(draft)) {
        _chatInputToolBarKey.currentState?.setDraft(draft!);
      }
    });
  }

  _listenUserInfo() {
    // _userInfoSubscription =
    //     Application.eventBus.on<UserUpdateCompletionEvent>().listen((event) {
    //   if (!_dataSource.chatBox.chatUsers.contains(event.userChanged)) return;
    //   Utils.callSetStateSafely(this, () {});
    // });
  }

  Future<void> getUserInfo() async {
    if(_dataSource.chatBox.chatUser!.uid == null){
      return;
    }
    try{
      UserInfoRsp rsp = await _userApi!.userInfo(_dataSource.chatBox.chatUser!.uid!);
      if (rsp.code == 0) {
        CommonUser user = rsp.getData()!;
        setStateSafely(() {
          currUser = user;
        });
      }
    }catch (e) {
      AuvChatLog.printE(e);
    }

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      //进入应用时候不会触发该状态 应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume
      case AppLifecycleState.resumed:
        _viewDidAppear();
        break;
      case AppLifecycleState.detached:
        AuvChatLog.d("当前页面即将退出======");
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        _viewWillDisappear();
        break;
    }
  }

  _listenChatEvent() {
    _chatPriceEventSubscription = Application.eventBus.on<ChatPriceEvent>().listen((event) {
      setStateSafely(() {});
    });
    _chatEventSubscription = Application.eventBus.on<ChatEvent>().listen((event) {
      switch (event.type) {
        case ChatEventType.chatBoxSync:
          if (Utils.isEmptyMap(event.affects)) return;
          final updated = event.affects![ChatEvent.AFFECT_UPDATE] as List<ChatBox>?;
          if (!Utils.isEmptyList(updated)) {
            if (updated!.contains(_dataSource.chatBox)) {
              Application.chatContext.dbService.chatBoxDao.modelById(_dataSource.chatBox.id).then((result) {
                if (result != null) {
                  result.chatUser?.follow = _dataSource.chatBox.chatUser?.follow;
                  _dataSource.chatBox = result;
                  Utils.callSetStateSafely(this, () {});
                }
              });
            }
          }
          break;
        case ChatEventType.snapSync:
          AuvChatLog.d("snapSync,affects=${event.affects}", tag: "ChatPage");
          if (Utils.isEmptyMap(event.affects)) return;
          List<ChatSnap>? updated, deleted, added;
          if (event.affects![ChatEvent.AFFECT_ADD] != null) {
            added = event.affects![ChatEvent.AFFECT_ADD] as List<ChatSnap>?;
          }

          if (event.affects![ChatEvent.AFFECT_UPDATE] != null) {
            updated = event.affects![ChatEvent.AFFECT_UPDATE] as List<ChatSnap>?;
          }
          if (event.affects![ChatEvent.AFFECT_DELETE] != null) {
            deleted = event.affects![ChatEvent.AFFECT_DELETE] as List<ChatSnap>?;
          }
          if (!Utils.isEmptyList(added)) {
            _hasNewSnap = true;
            _addSnaps(added!.where((e) => e.chatBoxId == _dataSource.chatBox.id).toList());
            AuvChatLog.d("added=$added");
            var giftItem = added.firstWhere((element) => element.isGiftJsonSnap, orElse: () => ChatSnap());
            AuvChatLog.d("giftItem=$giftItem");
            if (!Utils.isEmpty(giftItem.jsonContentObj?.animation_url)) {
              PageRouter.startSvgaPlayer(context, giftItem.jsonContentObj!.animation_url!, svgaIcon: giftItem.jsonContentObj!.icon);
            }
          }
          if (!Utils.isEmptyList(updated)) {
            _updateSnaps(updated!.where((e) => e.chatBoxId == _dataSource.chatBox.id).toList());
          }
          if (!Utils.isEmptyList(deleted)) {
            _deleteSnaps(deleted!.where((e) => e.chatBoxId == _dataSource.chatBox.id).toList());
          }
          break;
        case ChatEventType.snapSendStatus:
          ChatSnap snap = event.object;
          if (snap.chatBoxId == _dataSource.chatBox.id) {
            Utils.callSetStateSafely(this, () {});
          }
          break;
        case ChatEventType.snapResend:
          ChatSnap snap = event.object;
          if (snap.chatBoxId == _dataSource.chatBox.id) {
            _resendSnap(snap);
          }
          break;
        case ChatEventType.snapRecall:
          ChatSnap snap = event.object;
          if (snap.chatBoxId == _dataSource.chatBox.id) {
            PageRouter.startChatCall(context, _dataSource.chatBox.chatUser!, PayFromType.FROM_IM_VIDEO_CALL);
          }
          break;
        default:
          break;
      }
    });
  }

  /// ChatInputToolBarObserver

  @override
  void onActiveInputMethod(ChatInputMethod method) {
    _scrollToBottom();
    if(method == ChatInputMethod.none) {
      setStateSafely(() {
        giftPaddingBottom = 78;
      });
    } else {
      setStateSafely(() {
        giftPaddingBottom = 328;
      });
    }
  }

  @override
  void onTextChanged(String text) {
    Application.chatContext.draftManager.saveChattingDraftContentForChatBox(_dataSource.chatBox.id!, text);
    _sendUpdateReadStatusIfNeed();
  }


  @override
  void onSendSticker(AppImage sticker) {
    final snap = ChatSnapCreator.createStickerSnap(_dataSource.chatBox.id!, sticker);
    _sendSnap(snap);
  }


  @override
  void onSendText(String text) {
    final snap = ChatSnapCreator.createTextSnap(_dataSource.chatBox.id!, text);
    _sendSnap(snap);
  }


  @override
  void onSendVideo(String path) {
    ChatSnapCreator.createVideoSnap(_dataSource.chatBox.id!, path).then((snap) {
      _sendSnap(snap);
    });
  }

  @override
  void onSendImage(String path) {
    AuvChatLog.d("onSendImage:$path", tag: "ChatPage");
    ChatSnapCreator.createImageSnap(_dataSource.chatBox.id!, path).then((snap) {
      AuvChatLog.d("createImageSnap:$snap", tag: "ChatPage");
      _sendSnap(snap);
    });
  }


  @override
  void onSendVoice(String path) {
    final snap = ChatSnapCreator.createVoiceSnap(_dataSource.chatBox.id!, path);
    _sendSnap(snap);
  }

  @override
  void onSendGift(Gift gift) {
    //ChatGiftSnap(8, gift.id, user.uid, 1, gift.min_duration, gift.max_duration, gift.name, gift.icon, gift.animation_type,
    // gift.animation_url, gift.price, gift.value)
    var giftSnap = ChatGiftSnap()
      ..id = gift.id
      ..category = ChatSnapJsonContentCategory.imGiftCate.value
      ..to_uid = _dataSource.chatBox.chatUser!.uid
      ..quantity = 1
      ..min_duration = gift.min_duration
      ..max_duration = gift.max_duration
      ..name = gift.name
      ..icon = gift.icon
      ..animation_type = gift.animation_type
      ..animation_url = gift.animation_url
      ..price = gift.price
      ..value = gift.value
      ..gift_type = 0;
    final snap = ChatSnapCreator.createJsonSnap(_dataSource.chatBox.id!, jsonEncode(giftSnap.toJson()));
    _sendSnap(snap, checkVip: false);
  }

  void onSendUserCard(CommonUser user) {
    final snap = ChatSnapCreator.createUserCardJsonSnap(_dataSource.chatBox.id!, user);
    _sendSnap(snap);
  }

  @override
  void onSelectInputFunc(ChatInputFuncType type) {
    switch (type) {
      case ChatInputFuncType.voice:
        _handleMore();
        break;
      case ChatInputFuncType.video:
        final chatUser = _dataSource.chatBox.chatUser;
        // Routes.routerToNativePhoneCall(_dataSource.chatBox.id,
        //     type == ChatInputFuncType.voice ? 0 : 1, chatUser.uid,
        //     uName: chatUser.showName, avatarUrl: chatUser.avatar_url);
        if (chatUser != null) {
          PageRouter.startChatCall(context, chatUser, PayFromType.FROM_IM_VIDEO_CALL);
        }

        break;
//        Routes.open(
//          Routes.AuvFlutterRouteChatLocationSelect,
//          params: {Routes.FNParamPresent: 1},
//        ).then((result) {
//          AuvChatLog.d('[ChatLocationSelect] location Selected: $result');
//          if (Utils.isEmptyMap(result)) return;
//          final locationInfo = jsonDecode(Uri.decodeComponent(
//              result[ChatLocationSelectPage.kResultKeyLocation]));
//          if (Utils.isEmptyMap(locationInfo)) return;
//          onSendLocation(AppLocation.fromJson(locationInfo));
//        });
      case ChatInputFuncType.card:
        // BuddyListPage.show(present: true, isSelection: true).then((value) {
        //   final user = TransferDataSingleton.singleton.transData;
        //   if (user is CommonUser) {
        //     onSendUserCard(user);
        //   }
        // });
        break;
      default:
        break;
    }
  }

  void _handleMore() async {
    // TransferDataSingleton.singleton.transData = _dataSource.chatBox;
    // Routes.open(Routes.AuvFlutterRouteChatSettings);
    List<SheetAction<int>> actions = [];
    var isFollowed = currUser?.isFollowed ?? false;
    var isBlocked = currUser?.isBlocked ?? false;
    actions.add(SheetAction(
        label: isFollowed
            ? StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_unFollow)
            : StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_follow),
        key: 0));
    actions.add(SheetAction(
        label: isBlocked
            ? StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_blacklist)
            : StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_blacklist),
        key: 1));
    actions.add(SheetAction(
        label: StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_report),
        key: 2));
    final result = await showModalActionSheet<int>(
      context: context,
      // title: '',
      // message: 'This is message.',
      actions: actions,
      builder: (context, child) => Theme(
        data: ThemeData(
          cupertinoOverrideTheme: const CupertinoThemeData(
            primaryColor: AppColor.b1,
          ),
          // listTileTheme: const ListTileThemeData(
          //   textColor: AppColor.b1,
          //   iconColor: Colors.orange,
          // ),
        ),
        child: child,
      ),
    );
    AuvChatLog.d(result.toString());
    Utils.nullSafe<int>(result, notNullBlock: (notNull) {
      switch (notNull) {
        case 0:
          _handleFollow();
          break;
        case 1:
          _handleBlock();
          break;
        case 2:
          ReportSheet.show(
              context, _dataSource.chatBox.chatUser?.uid);
          break;
      }
    });
  }
}
