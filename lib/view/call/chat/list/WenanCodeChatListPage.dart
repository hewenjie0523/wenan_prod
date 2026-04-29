import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/view/match/discover/gift/WenanCodeGiftPage.dart';

import 'package:left_scroll_actions/left_scroll_actions.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatBox.dart';
import 'package:wenan/data/chat/WenanCodeChatListOtherEvent.dart';
import 'package:wenan/data/chat/WenanCodeChatListOtherItem.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/http/push/WenanCodePushHelper.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/http/socket/WenanCodechat_api.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/WenanCodeSharedViewLogic.dart';
import 'package:wenan/view/call/chat/detail/WenanCodeChatPageStartup.dart';
import 'package:wenan/view/call/chat/list/listOther/WenanCodeChatListOtherItemCell.dart';
import 'package:wenan/view/call/chat/list/view/WenanCodeChatListCell.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/StringTranslate.dart';

import '../../../../base/WenanCodeSpHelper.dart';

class ChatListPage extends ConsumerStatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends ConsumerState<ChatListPage> with AutomaticKeepAliveClientMixin {
  final _topList = <ChatListOtherItem>[];
  final _chatBoxes = <ChatBox>[];
  final _closeTag = const LeftScrollCloseTag('imPage');
  final _controller = ScrollController();
  late StreamSubscription _chatEventSubscription, _otherEventSubscription;
  bool showNotificationTip = false;
  bool isAr = Application.isARLanguage();
  // _userInfoSubscription,
  // _tabEventSubscription;

  @override
  void dispose() {
    AuvChatLog.d('[ChatListPage] dispose');
    _chatEventSubscription.cancel();
    _otherEventSubscription.cancel();
    // _userInfoSubscription.cancel();
    // _tabEventSubscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _updateListData();

    _controller.addListener(() {
      _closeItemActions();
    });

    _chatEventSubscription = Application.eventBus.on<ChatEvent>().listen((event) {
      if (event.type == ChatEventType.chatBoxReloadCompletion) {
        _updateListData();
      }
    });

    // Application.eventBus.on<ChatEvent>().listen((event) {
    //   AuvChatLog.d("ChatEvent:$event",tag: "ChatListPage");
    // });

    _otherEventSubscription = Application.eventBus.on<ChatListOtherEvent>().listen((event) {
      if (event.type == ChatListOtherEventType.updateCompleted) {
        _updateListData();
      }
    });

    // _userInfoSubscription =
    //     Application.eventBus.on<UserUpdateCompletionEvent>().listen((event) {
    //   Utils.callSetStateSafely(this, () {});
    // });

    // _tabEventSubscription =
    //     Application.eventBus.on<HomeTabEvent>().listen((event) {
    //   if (event.type == HomeTabEventType.DoubleTap &&
    //       event.tab == HomeTab.IM &&
    //       mounted &&
    //       _controller.hasClients) {
    //     _controller.animateTo(
    //       0.0,
    //       duration: const Duration(milliseconds: 500),
    //       curve: Curves.linearToEaseOut,
    //     );
    //   }
    // });
    PushHelper.cleanNotifications(PushHelper.TYPE_CHAT_LIST);

    Permission.notification.status.isGranted.then((value) => Utils.callSetStateSafely(this, () {
          showNotificationTip = !value;
        }));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      int tipCount = SpHelper.getImTipShowCount();
      if(tipCount < 3 && !Application.showImTips){
        Application.showImTips = true;
        tipCount ++;
        SpHelper.setImTipShowCount(tipCount);
        SharedViewLogic.showChatListTipDlg(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var coins = ref.watch(currUserCoins).value;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: const Color(0xFF1D002A),
          resizeToAvoidBottomInset: false,
          extendBodyBehindAppBar: true,
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(top: showNotificationTip ? 136 : 88),
                child: CustomScrollView(
                  controller: _controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: <Widget>[
                    /// Top List
                    SliverFixedExtentList(
                      itemExtent: 88,
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return _otherItemCell(_topList[index]);
                        },
                        childCount: _topList.length,
                      ),
                    ),

                    /// Chat List
                    SliverFixedExtentList(
                      itemExtent: 88,
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return _chatBoxCell(_chatBoxes[index]);
                        },
                        childCount: _chatBoxes.length,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 48.0,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringTranslate.e2z(
                          Application.appLocalizations!.wenan_string_message),
                      style: AppTextStyle.style(
                        color: const Color(0xFF635BFF),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        DataReporter.sendTrackCountEvent(
                            DataReporter.CLICK_ON_ME_VIP, 1);
                        PageRouter.pushPage(context, PageRouter.VipPage);
                      },
                      child: ImageLoader.loadLocalImage(
                        "chat/wLeWnpaunQ_nrKeasa_yckhLaotL_Bv4ibpL_Zb7tMnO",
                        width: 90,
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: showNotificationTip,
                child: Container(
                  margin: const EdgeInsets.only(top: 88, left: 0, right: 0, bottom: 8),
                  child: GestureDetector(
                    onTap: () async {
                      var status = await Permission.notification.request();
                      if (status.isGranted) {
                        Utils.callSetStateSafely(this, () {
                          showNotificationTip = false;
                        });
                      } else {
                        openAppSettings().then(
                          (value) => Permission.notification.status.isGranted.then(
                            (granted) => Utils.callSetStateSafely(this, () {
                              showNotificationTip = !granted;
                            }),
                          ),
                        );
                      }
                    },
                    child: Container(
                      height: 48,
                      color: AppColor.white_20p,
                      child: Stack(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: ImageLoader.loadLocalImage(
                                'chat/w3epnOainR_5rFers0_0i4cF_GnCoJtuiIfmi0cGaWtli2oLnN',
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 48),
                              child: Text(
                                StringTranslate.e2z(Application.appLocalizations!.wenan_string_notification_is_closed),
                                style: AppTextStyle.white14,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: ImageLoader.loadLocalImage(
                                'w3evnJaInc_CrIeBsl_RikcW_pa2rOrboBwv_Cb8lfaVc1ke',
                                width: 12,
                                height: 12,
                                color: AppColor.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _chatBoxCell(ChatBox chatBox) {
    return Material(
      color: AppColor.transparent,
      child: GestureDetector(
        onTap: () {
          _closeItemActions();
          PageRouter.startChatDetailPage(context, {ChatPageStartup.kParamsChatBox: chatBox});
        },
        child: Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
            extentRatio: 0.32,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                flex: 1,
                onPressed: (context) => _deleteChatBox(chatBox),
                backgroundColor: const Color(0xFFFF0000),
                foregroundColor: Colors.white,
                spacing: 0,
                label: StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_delete),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              _closeItemActions();
              PageRouter.startChatDetailPage(context, {ChatPageStartup.kParamsChatBox: chatBox});
            },
            child: ChatListCell(chatBox),
          ),
        ),
      ),
    );
  }


  Widget _otherItemCell(ChatListOtherItem e) {
    return GestureDetector(
      child: ChatListOtherItemCell(e),
      onTap: () {
        switch (e.type) {
        // case ChatListOtherItemType.order:
        //   Routes.open(Routes.AuvFlutterRouteChatOrderList);
        //   break;
          case ChatListOtherItemType.notify:
          // Routes.open(Routes.AuvFlutterRouteChatNotifyList);
            PageRouter.routePage(context, PageRouter.PageChatNotifyList);
            break;
        // case ChatListOtherItemType.activity:
        //   Routes.open(Routes.AuvFlutterRouteChatActivityList);
        //   break;
          case ChatListOtherItemType.feedback:
            SharedViewLogic.showFeedbackDialog(context);
            break;
        }
      },
    );
  }

  void _updateListData() {
    _topList.clear();
    _topList.add(Application.chatContext.otherManager.notifyItem);

    // add service cell
    final ChatListOtherItem serviceItem = ChatListOtherItem();
    serviceItem.type = ChatListOtherItemType.feedback;
    serviceItem.icon = 'chat/wFeQnzagnK_prNelsL_1iZcJ_sl2iCsHt3_nsYeNrkv1iocaet';
    serviceItem.name =
        StringTranslate.e2z(Application.appLocalizations?.wenan_string_customer_service);
    serviceItem.content =
        StringTranslate.e2z(Application.appLocalizations?.wenan_string_customer_service_tip);
    _topList.add(serviceItem);

    AuvChatLog.d('ChatTopList - $_topList');
    _chatBoxes.clear();
    if (Application.chatContext.listModule.chatBoxes.isNotEmpty) {
      _chatBoxes.addAll(Application.chatContext.listModule.chatBoxes);
    }
    AuvChatLog.d('ChatList - $_chatBoxes');
    Utils.callSetStateSafely(this, () {});
  }

  Future<void> _deleteChatBox(ChatBox cb) async {
    ChatApi.removeChatBox(cId: cb.id);
    // Application.onlineStatusManager.removeUserId(cb.chatUser.uid);
  }

  void _closeItemActions() {
    GlobalLeftScroll.instance?.needCloseOtherRowOfTag(_closeTag, null);
  }



  @override
  bool get wantKeepAlive => false;
}
