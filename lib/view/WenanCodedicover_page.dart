import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/state/call/WenanCodePhoneCallNotify.dart';
import 'package:wenan/data/user/CommonUser.dart';
import 'package:wenan/state/event/WenanCodediscover_event.dart';
import 'package:wenan/http/push/WenanCodePushHelper.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/match/discover/gift/WenanCodeGiftPage.dart';
import 'package:wenan/view/profile/view/WenanCodeReportSheet.dart';
import 'package:wenan/view/login/activity/WenanCodeFirstChargeView.dart';
import 'package:wenan/viewmodel/WenanCodeConfigModelProvider.dart';
import 'package:wenan/viewmodel/WenanCodeActivityViewModel.dart';
import 'package:wenan/StringTranslate.dart';

import '../../http/UserApi.dart';
import '../../http/WenanCodedio_helper.dart';
import '../../res/WenanCodecolors.dart';

import '../base/WenanCodeAppConfiguration.dart';
import '../viewmodel/WenanCodediscover_vm_provider.dart';
import 'WenanCodeSharedViewLogic.dart';
import 'match/discover/WenanCodemedia_page.dart';
import 'package:wenan/res/l10n/app_localizations.dart';

// final discoverUserChangedNotify = ChangeNotifierProvider.autoDispose(
//     (ref) => DiscoverChangedUserNotify());
//
// final discoverUserBlockNotify = ChangeNotifierProvider.autoDispose(
//         (ref) => DiscoverBlockUserNotify());

class DiscoverPage extends ConsumerStatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  createState() {
    return _DiscoverPageState();
  }
}


class _DiscoverPageState extends ConsumerState<DiscoverPage>
    with
        SingleTickerProviderStateMixin,
        WidgetsBindingObserver,
        AutomaticKeepAliveClientMixin {
  List tabs = [
    StringTranslate.e2z(AppLocalizations.of(Application.appContext!)!.wenan_string_recommend),
    StringTranslate.e2z(AppLocalizations.of(Application.appContext!)!.wenan_string_following)
  ];
  late TabController _controller;
  final UserApi _userApi = UserApi(DioHelper.getInstance());
  CommonUser? _currentUser;

  late StreamSubscription<DiscoverEvent> changedUserSubscription;

  @override
  void initState() {
    super.initState();
    // SpHelper.setDiscoverFilterRegionCode("");
    _controller = TabController(length: tabs.length, vsync: this);
    changedUserSubscription = Application.eventBus.on<DiscoverEvent>().listen((event) {
      if (event.type == DiscoverEventType.changed) {
        Utils.callSetStateSafely(this, () {
          _currentUser = event.user;
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // coupon check
      PhoneCallNotify.checkAvailableCoupon();
      Application.callPlatformMethod(
          "${Application.channelName}.switchScreenShotStatus", <String, dynamic>{
        '${Application.channelName}.status': 0,
      });
    });
    
    ref.refresh(firstChangeNotifier.notifier).refresh();
    PushHelper.cleanNotifications(PushHelper.TYPE_ANCHOR_ONLINE);
  }


  @override
  Widget build(BuildContext context) {
    String? iav = ref.watch(configNotifier).data?.iav;
    if(!Utils.isEmptyString(iav) && AppConfig.appVersion != iav) {
      // rules pop check
      if (!SpHelper.hasKey("ruleShowed")) {
        Future.delayed(Duration.zero, ()=> SharedViewLogic.showRulesPageDlg(Application.appContext!));
        SpHelper.putBool("ruleShowed", true);
      }
    }

    return Scaffold(
        backgroundColor: const Color(0xFF1D002A),
        body: Stack(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(0, 48 + MediaQuery.of(context).padding.top, 0, 0),
                child: TabBarView(
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: tabs.map((e) {
                    //分别创建对应的Tab页面
                    var position = tabs.indexOf(e);
                    if (position == 0) {
                      return MediaPage();
                    }
                    return MediaPage(
                      type: DiscoverType.FOLLOWING,
                    );
                  }).toList(),
                )),
            _topbar(),
            Visibility(
              visible: !((!Utils.isEmptyString(iav)) && AppConfig.appVersion == iav),
              child: Positioned(
                bottom: MediaQuery.of(context).size.height - rtcOffset.dy,
                right: rtcOffset.dx,
                child: GestureDetector(
                  // 小窗拖拽
                  onPanUpdate: (detail) {
                    Utils.callSetStateSafely(this, () {
                      rtcOffset = _calRtcOffset(MediaQuery.of(context).size, rtcOffset, detail.delta);
                    });
                  },
                  child: const FirstChargeView(),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _topbar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 40,
        margin: EdgeInsets.fromLTRB(
            24, MediaQuery.of(context).padding.top + 10, 24, 0),
        child: _topToolBar()
      ),
    );
  }

  Widget _topToolBar() {
    // var isAr = Application.isARLanguage();
    AuvChatLog.d("DiscoverPage TabBar building");
    return TabBar(
      controller: _controller,
      indicatorColor: AppColor.transparent,
      labelPadding: const EdgeInsets.all(0),
      labelColor: const Color(0xFF635BFF),
      unselectedLabelColor: AppColor.white_40p,
      labelStyle: AppTextStyle.style(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: AppTextStyle.style(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.all(0),
      onTap: (index) => Utils.callSetStateSafely(this, () {
        AuvChatLog.d("DiscoverPage TabBar onTap index:$index");
      }),
      tabs: tabs.map((e) {
        return Center(
          child: Tab(
            text: e,
          ),
        );
      }).toList(),
    );
  }

  void showMorePanel() {
    SharedViewLogic.showDiscoverPopWindow(context, () => report(), () => block());
  }

  report() {
    AuvChatLog.d("DiscoverPage report user:$_currentUser");
    Navigator.of(context).pop();
    ReportSheet.show(context, _currentUser?.uid ?? 0);
  }

  block() {
    AuvChatLog.d("DiscoverPage block user:$_currentUser");
    if (Utils.isEmpty(_currentUser)) return;
    Navigator.of(context).pop();
    SharedViewLogic.showBlockConfirmDlg(context, okCallBack: () async {
      try {
        var result = await _userApi.block(_currentUser!.uid!);
        if (result.code == 0) {
          _currentUser!.isBlocked = true;
          _currentUser!.follow = 0;
        }
      } catch (e, stack) {
        AuvChatLog.printE(e, error: stack);
      }
      Application.eventBus.fire(DiscoverEvent(DiscoverEventType.remove, _currentUser!));
    });
  }

  @override
  void dispose() {
    super.dispose();
    changedUserSubscription.cancel();
  }

   @override
  bool get wantKeepAlive => false;
  Offset rtcOffset = Offset(8, MediaQueryData.fromWindow(window).size.height - 76);
  double oldDy = 0;
  /// 小屏拖拽计算位置
  Offset _calRtcOffset(Size size, Offset offset, Offset nextOffset) {
    double dx = 8;
    if (offset.dx - nextOffset.dx <= 8) {
      dx = 8;
    } else if (offset.dx - nextOffset.dx >= (size.width - 88)) {
      dx = size.width - 88;
    } else {
      dx = offset.dx - nextOffset.dx;
    }
    double dy = 0;
    if (offset.dy + nextOffset.dy >= (size.height - 76)) {
      dy = size.height - 76;
    } else if (offset.dy + nextOffset.dy <= 114) {
      dy = 114; // 90 小窗口自身高度 + 24 statusbar高度
    } else {
      dy = offset.dy + nextOffset.dy;
    }
    return Offset(
      dx,
      dy,
    );
  }
}
