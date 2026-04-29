
import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/WenanCodeChatListOtherEvent.dart';
import 'package:wenan/data/chat/WenanCodeChatListOtherItem.dart';
import 'package:wenan/data/chat/NotifyItem.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/http/push/WenanCodePushHelper.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/state/WenanCodeBaseApiState.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/chat/notify/WenanCodeNotifyListCell.dart';
import 'package:wenan/viewmodel/WenanCodeSysNotifyModel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';

final notifyListNotifier = StateNotifierProvider.autoDispose((ref) {
  return SysNotifyListNotifier(BaseApiPageState<NotifyItem>());
});

class NotifyListPage extends ConsumerStatefulWidget {
  NotifyListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NotifyListPageState();
  }
}

class _NotifyListPageState extends ConsumerState<NotifyListPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  late StreamSubscription _latestNotifyEventSubscription;
  @override
  void initState() {
    super.initState();
    _latestNotifyEventSubscription =
        Application.eventBus.on<ChatListOtherEvent>().listen((event) {
          if (event.type == ChatListOtherEventType.notifyMessageChanged) {
            ref.read(notifyListNotifier.notifier).loadNew();
          }
        });
    PushHelper.cleanNotifications(PushHelper.TYPE_SYS_MSG);
  }

  @override
  void dispose() {
    super.dispose();
    _latestNotifyEventSubscription.cancel();
    Application.chatContext.otherManager
        .resetCount(ChatListOtherItemType.notify);
  }

  @override
  Widget build(BuildContext context) {
    var listState =
        ref.watch(notifyListNotifier) as BaseApiPageState<NotifyItem>;
    if (listState.status != ReqStatus.loading &&
        RefreshStatus.refreshing == _refreshController.headerStatus) {
      _refreshController.refreshCompleted();
    }
    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      navigationBar: CupertinoNavigationBar(
        border: null,
        backgroundColor: Colors.white,
        padding: const EdgeInsetsDirectional.only(start: 0, end: 0),
        leading: UIUtils.navigationCommonBackButton(
          () => FluroRouter.appRouter.pop(context),
          color: AppColor.b1a
        ),
        middle: UIUtils.navigationTitle(StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_system_notice)),
      ),
      child: Container(
        color: AppColor.color_f6f6fa,
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: false,
          header: const ClassicHeader(),
          controller: _refreshController,
          onRefresh: () {
            if(!ref.read(notifyListNotifier.notifier).loadOld()){
              _refreshController.refreshCompleted();
            }
          },
          // onLoading: _onLoading,
          child: notifyListWidget(context, listState),
        ),

      ),
    );
  }

  Widget notifyListWidget(
      BuildContext context, BaseApiPageState<NotifyItem> notifyListPageState) {
    AuvChatLog.d(
        "notifyListPageState=$notifyListPageState,feedlist.size=${notifyListPageState.dataList?.length}");
    if (Utils.isEmpty(notifyListPageState.dataList)) {
      if (notifyListPageState.status == ReqStatus.loading) {
        return const Center(
          child: Text("Loading",
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.b1,
              )),
        );
      } else {
        return Center(
          child: Text(StringTranslate.e2z(Application.appLocalizations!.wenan_string_no_data),
              style: const TextStyle(
                height: 1.3,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.b1,
              )),
        );
      }
    }
    AuvChatLog.d("notfiList.size=${notifyListPageState.dataList!.length}");
    return ListView.builder(
      itemBuilder: (context, index) {
        return NotifyListCell(item: notifyListPageState.dataList![index]);
      },
      padding: EdgeInsets.only(
          bottom: 15.0 + MediaQuery.of(context).viewPadding.bottom),
      itemCount: notifyListPageState.dataList!.length,
    );
  }
}
