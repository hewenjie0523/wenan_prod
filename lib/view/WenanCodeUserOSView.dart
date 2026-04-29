import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/wenan_user_online_status_enum.dart';

import '../StringTranslate.dart';
import '../base/WenanCodeApplication.dart';
import '../res/WenanCodegaps.dart';
import '../res/WenanCodestyles.dart';
import '../res/l10n/app_localizations.dart';
import '../utils/wenan_user_online_status_manager.dart';
import '../utils/wenan_user_online_status_refresher.dart';

class UserOnlineStatusView extends ConsumerStatefulWidget {
  final int uid;
  final Border? border;
  final double size;
  final bool showText;

  const UserOnlineStatusView({Key? key, required this.uid, this.size = 12, this.border, this.showText = false}) : super(key: key);

  @override
  ConsumerState<UserOnlineStatusView> createState() => _UserOnlineStatusViewState();
}

class _UserOnlineStatusViewState extends ConsumerState<UserOnlineStatusView> {
  StreamSubscription<AuvUserOnlineStatusUpdateEvent>? statuUpdateSubscription;
  WenanUserOnlineStatusEnum? _status;

  @override
  void initState() {
    AuvChatLog.d("UserOnlineStatusView:initState");
    _status = WenanUserOnlineStatusManager().getStatus(widget.uid);
    statuUpdateSubscription = Application.eventBus.on<AuvUserOnlineStatusUpdateEvent>().listen((event) {
      if (event.uid == widget.uid) {
        setState(() {
          _status = event.status;
        });
      }
    });

    //注册刷新
    WenanUserOnlineStatusRefresher.instance.register(widget.uid);
    super.initState();
  }

  @override
  void dispose() {
    statuUpdateSubscription?.cancel();
    statuUpdateSubscription = null;
    WenanUserOnlineStatusRefresher.instance.unRegister(widget.uid);
    AuvChatLog.d("UserOnlineStatusView:dispose");
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant UserOnlineStatusView oldWidget) {
    if (oldWidget.uid != widget.uid) {
      WenanUserOnlineStatusRefresher.instance.unRegister(oldWidget.uid);
      WenanUserOnlineStatusRefresher.instance.register(widget.uid);
    }
    super.didUpdateWidget(oldWidget);
  }

  BoxDecoration boxDecoration(Color color) {
    return BoxDecoration(shape: BoxShape.circle, color: color, border: widget.border);
  }

  @override
  Widget build(BuildContext context) {
    Widget? onlineWidget;
    Widget? onlineText;
    if (_status != null) {
      if (_status!.isBusy()) {
        onlineWidget = Container(
          width: widget.size,
          height: widget.size,
          decoration: boxDecoration(const Color(0xFFFFA900)),
        );
        onlineText = Text(
          StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_busy),
          style: AppTextStyle.style(
            fontSize: 12,
            color: AppColor.white,
            height: 1.1,
          ),
        );
      } else if (_status! == WenanUserOnlineStatusEnum.online) {
        onlineWidget = Container(
          width: widget.size,
          height: widget.size,
          decoration: boxDecoration(const Color(0xFF0DCC85)),
        );
        onlineText = Text(
          StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_online),
          style: AppTextStyle.style(
            fontSize: 12,
            color: AppColor.white,
            height: 1.1,
          ),
        );
      }
      // else {
      //   return Container(
      //     width: widget.size,
      //     height: widget.size,
      //     decoration: boxDecoration(AppColor.color_c4c4c4),
      //   );
      // }
    }
    if (onlineWidget != null) {
      if (widget.showText) {
        return Container(
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.black_40p,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [onlineWidget, AppGap.hGap2, onlineText!],
          ),
        );
      } else {
        return onlineWidget;
      }
    }
    return const SizedBox();
  }
}
