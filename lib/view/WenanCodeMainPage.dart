import 'dart:async';

import 'package:adjust_sdk/adjust.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:pag/pag.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeAppConfiguration.dart' as H5AppConfig;
import 'package:wenan/state/call/WenanCodePhoneCallNotify.dart';
import 'package:wenan/data/chat/WenanCodeChatListOtherEvent.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/state/event/WenanCodeEvents.dart';
import 'package:wenan/main.dart';
import 'package:wenan/http/push/WenanCodePushHelper.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/http/socket/WenanCodesocket_manager.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/WenanCodedicover_page.dart';
import 'package:wenan/view/call/chat/detail/WenanCodeChatPageStartup.dart';
import 'package:wenan/view/match/discover/gift/WenanCodeGiftPage.dart';
import 'package:wenan/view/WenanCodehome_page.dart';
import 'package:wenan/view/profile/WenanCodeme_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/viewmodel/WenanCodepay_vm_provider.dart';
import '../utils/wenan_user_online_status_refresher.dart';
import 'call/chat/list/WenanCodeChatListPage.dart';
import 'package:wenan/view/login/activity/WenanCodeFirstChargeView.dart';

import 'match/WenanCodeMatchPage.dart';
import 'match/WenanCodeMatchingPage.dart';

final unreadImCount = StateProvider((ref) => Application.chatContext.unreadCount);

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  createState() {
    return _MainPageState();
  }
}

class _MainPageState extends ConsumerState<MainPage> with TickerProviderStateMixin, RouteAware {
  static final List<Widget> _views = [const DiscoverPage(), const MatchPage(), const ChatListPage(), const MePage()];
  StreamSubscription? _sessionInvalid;

  static const List<String> _tabs = ['Home', 'Match', 'Chat', 'Me'];
  String selectedTab = 'Home';
  int selectedTabIndex = 0;
  late TabController _tabController;

  late PageController _pageController;
  late StreamSubscription subscription;
  StreamSubscription? _chatEventListener;
  StreamSubscription? _chatListOtherEventListener;
  StreamSubscription? _notificationOpenEventListener;

  @override
  void initState() {
    super.initState();
    SpHelper.setDiscoverFilterRegionCode("");
    SpHelper.setDiscoverFilterRegionVipOnly(false);
    SpHelper.setDiscoverFilterRegionName("");
    _pageController = PageController();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.index = 0;
    _tabController.addListener(() {});
    _sessionInvalid = Application.eventBus.on<OverdueSession>().listen((event) {
      Application.quit();
      ref.refresh(loginStatusProvider);
    });
    subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
      // Got a new connectivity status!
      AuvChatLog.d("onConnectivityChanged:$result");
      if (result != ConnectivityResult.none) {
        SocketManager.instance.connect();
      }
    });

    /// IM Bubble Count
    _chatEventListener = Application.eventBus.on<ChatEvent>().listen((event) {
      if (event.type == ChatEventType.chatBoxReloadCompletion) {
        AuvChatLog.d("unreadCount:${Application.chatContext.unreadCount}");
        ref.refresh(unreadImCount);
      }
    });
    _chatListOtherEventListener = Application.eventBus.on<ChatListOtherEvent>().listen((event) {
      if (event.type == ChatListOtherEventType.updateCompleted) {
        AuvChatLog.d("unreadCount:${Application.chatContext.unreadCount}");
        ref.refresh(unreadImCount);
      }
    });
    _notificationOpenEventListener = Application.eventBus.on<PushOpenEvent>().listen((event) {
      String url = event.url;
      if (url.startsWith(H5AppConfig.AppConfig.h5ChatUrl)) {
        _tabController.animateTo(1);
        _changeTab(1);
        if (!Utils.isEmptyString(event.chatBoxId)) {
          ChatPageStartup.open(context, cid: Utils.parseInt(event.chatBoxId!));
        }
      } else if (url.startsWith(H5AppConfig.AppConfig.h5AnchorOnlineUrl)) {
        _tabController.animateTo(0);
        _changeTab(0);
      } else if (url.startsWith(H5AppConfig.AppConfig.h5SysMsgUrl)) {
        _tabController.animateTo(1);
        _changeTab(1);
        PageRouter.pushPage(context, PageRouter.PageChatNotifyList);
      }
    });

    ref.read(payModel).getBalanceList(isForce: true);
    ref.read(payModel).getVipList(isForce: true);
    ref.read(payModel).getFirstRechargeList(isForce: true);
    SpHelper.setEnterAppTimes(SpHelper.getEnterAppTimes() + 1);
    FirstChargeView.autoPoppedUp = false;

    PushHelper.cleanNotifications(PushHelper.TYPE_MAIN);
    Future.delayed(Duration.zero, () => PushHelper.showNotifyPermissionDialog(context, "open_app"));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    try {
      routeObserver.subscribe(this, ModalRoute.of(context) as Route);
    } catch (e) {
      print(e);
    }
  }

  @override
  void didPushNext() {
    AuvChatLog.d("didPushNext");
    SocketManager.instance.connect();
    Adjust.onResume();
    Application.updateAdjustAdInfo();
    super.didPushNext();
  }

  @override
  void didPopNext() {
    AuvChatLog.d("didPopNext");
    SocketManager.instance.connect();
    Adjust.onPause();
    ref.refresh(currUserCoins);
    super.didPopNext();
  }

  @override
  void dispose() {
    _sessionInvalid?.cancel();
    _chatEventListener?.cancel();
    _chatListOtherEventListener?.cancel();
    _notificationOpenEventListener?.cancel();
    try {
      routeObserver.unsubscribe(this);
    } catch (e) {
      print(e);
    }
    subscription.cancel();
    super.dispose();
  }

  @override
  void didPush() {
    AuvChatLog.d("didPush");
    super.didPush();
  }

  void _changeTab(int index) {
    int status = index == 3 ? 1 : 0;
    Application.tabIndex = index;
    Application.callPlatformMethod("${Application.channelName}.switchScreenShotStatus", <String, dynamic>{
      '${Application.channelName}.status': status,
    });

    String t = _tabs[index];
    WenanUserOnlineStatusRefresher.instance.canWorkPage = t == 'Home' || t == 'Chat';

    Utils.callSetStateSafely(this, () {
      selectedTab = _tabs[index];
      selectedTabIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    var unreadNum = ref.watch(unreadImCount.state).state;
    return WillPopScope(
      onWillPop: () async {
        AuvChatLog.d("MainPage onWillPop,PhoneCallNotify.isNotifyShowing()=${PhoneCallNotify.isNotifyShowing()}");
        return !PhoneCallNotify.isNotifyShowing();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                color: const Color(0xFF1D002A),
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: _views,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 78,
                decoration: BoxDecoration(gradient: UIUtils.bottomGradient()),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 78,
                margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Stack(
                  alignment: AlignmentGeometry.bottomCenter,
                  children: [
                    Positioned(
                      bottom: 10,
                      child: ImageLoader.loadLocalImage("home/wCeWnRaMns_vrVems9_ltga0bM_mbfgt",
                          width: MediaQuery.of(context).size.width - 16, height: 64, fit: BoxFit.fill),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _tabBar(unreadNum),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabBar(int unreadNum) {
    return TabBar(
      controller: _tabController,
      labelColor: AppColor.white,
      unselectedLabelColor: AppColor.white,
      dividerColor: Colors.transparent,
      indicatorPadding: const EdgeInsets.only(top: 40, bottom: 10),
      indicator: BoxDecoration(image: DecorationImage(image: ImageLoader.assetImage("home/wRe6nHaOnU_FrjeesX_Ftra2b3_IipnBdTimcVa0tHoJr0"), fit: BoxFit.fill)),
      // indicatorSize: SizedBox(width: 28, height: 16),
      isScrollable: false,
      padding: const EdgeInsets.only(top: 0),
      physics: const BouncingScrollPhysics(),
      onTap: (int index) {
        _changeTab(index);
      },
      enableFeedback: true,
      tabs: _tabs.map((e) {
        return _tabView(e, unreadNum);
      }).toList(),
    );
  }

  Widget _tabView(String title, int unreadNum) {
    Widget body = Container();
    if (title == 'Home') {
      body = Tab(
        text: '',
        iconMargin: const EdgeInsets.only(top: 14),
        icon: ImageLoader.loadLocalImage(
          selectedTab == 'Home' ? "home/w2eXneaGnH_crEeesP_Dt3acbT_Phoo8mOeD_Wab" : "home/woehnHahnx_BrleXsA_Kt3aybB_mhLo0mPeS_Tdr",
          width: 32,
          height: 32,
        ),
      );
    }
    if (title == 'Match') {
      body = Tab(
        text: '',
        iconMargin: const EdgeInsets.only(top: 14),
        icon: ImageLoader.loadLocalImage(
          selectedTab == 'Match' ? "home/wIefn5awnG_6rIeJs3_OtyaObf_ImDaXttc3hU_Mag" : "home/wteZnlacnZ_8rBecsy_btIaZb2_nm7amtTcQhO_jdK",
          width: 32,
          height: 32,
        ),
      );
    }
    if (title == 'Me') {
      body = Tab(
        text: '',
        iconMargin: const EdgeInsets.only(top: 14),
        icon: ImageLoader.loadLocalImage(
          selectedTab == 'Me' ? "home/wJednCa5nf_OrEeTsO_uteafb2_Pm9ei_faa" : "home/wjeUn8aLnF_rrxexsK_KtlapbD_tmcep_NdG",
          width: 32,
          height: 32,
        ),
      );
    }
    if (title == 'Chat') {
      body = Tab(
        text: '',
        iconMargin: const EdgeInsets.only(top: 14),
        icon: ImageLoader.loadLocalImage(
          selectedTab == 'Chat' ? "home/wUeWnHa4nP_arTeXsX_Otaayb7_kcuhuaotZ_ZaI" : "home/wPetnsaRnl_ZrfeTsY_Ptwa1b8_scHhZaqtH_mdg",
          width: 32,
          height: 32,
        ),
      );
      if (unreadNum > 0) {
        body = Stack(
          alignment: Alignment.center,
          children: [
            body,
            Positioned(
              right: 0,
              top: 10,
              child: unreadNum < 100
                  ? ClipOval(
                      child: Container(
                          width: 18,
                          height: 18,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              "$unreadNum",
                              style: AppTextStyle.white12,
                            ),
                          )),
                    )
                  : ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Container(
                        width: 28,
                        height: 18,
                        color: Colors.red,
                        child: const Center(
                          child: Text(
                            "99+",
                            style: AppTextStyle.white12,
                          ),
                        ),
                      ),
                    ),
            )
          ],
        );
      }
    }
    body = SizedBox(
      width: (MediaQuery.of(context).size.width - 16) / 5,
      child: body,
    );
    return body;
  }
}
