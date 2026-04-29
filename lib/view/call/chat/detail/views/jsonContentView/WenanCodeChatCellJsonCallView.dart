import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/data/chat/ChatSnapJsonContent.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/res/l10n/app_localizations.dart';

class ChatCellJsonCallView extends StatelessWidget {

  final ChatSnap chatSnap;

  final ChatSnapJsonContent content;

  const ChatCellJsonCallView({Key? key, required this.content,required this.chatSnap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d("ChatCellJsonCallView:${content.status}");
    String? text;
    Color color = content.isUserIdMine
        ? ImColors.color_snap_text_me
        : ImColors.color_snap_text_other;
    var mineStyle = BoxDecoration(
      borderRadius: ChatUtils.chatCellRadiusMine(),
      color: ImColors.color_snap_bg_me,
    );
    var otherStyle = BoxDecoration(
      borderRadius: ChatUtils.chatCellRadiusOther(),
      color: ImColors.color_snap_bg_other,
    );

    switch (content.status) {
      case ChatSnapJsonContentStatus.callDone:
        text = "${StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_duration)} ${StringUtils.formatDuration(Duration(seconds: content.count??0))}";
        break;
      case ChatSnapJsonContentStatus.callCanceled:
        text = content.isUserIdMine ? StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_canceled) : StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_call_canceled);
        break;
      case ChatSnapJsonContentStatus.callRefused:
        text = content.isUserIdMine ? StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_call_declined) : StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_declined);
        break;
      case ChatSnapJsonContentStatus.callNoReply:
        text = content.isUserIdMine ? StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_call_no_response) : StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_call_missed_call);
        break;
      case ChatSnapJsonContentStatus.callBusy:
        text = StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_busy_line);
        break;
      case ChatSnapJsonContentStatus.connectFailed:
        text = StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_call_connect_failed);
        break;
      default:
        text = 'Unknown';
        break;
    }
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Application.eventBus.fire(ChatEvent(
          ChatEventType.snapRecall,
          object: chatSnap,
        ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: ChatCellLayouts.textHPadding,
          vertical: ChatCellLayouts.textVPadding,
        ),
        decoration: content.isUserIdMine ? mineStyle : otherStyle,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: ImageLoader.assetImage("chat/wve2nCaCn6_TrZeJsG_dpTazljal_RdOrUaswla5bilHeZ_IiCc6_kcahva8t5_HdXeJtUa0iLl4_rvdicdEeyo5_McXaBlNle"),
              width: 24,
              height: 24,
              color: color,
            ),
            const SizedBox(width: 8.0),
            Flexible(child: Text(text, style: AppTextStyle.style(color: color))),
          ],
        ),
      ),
    );
  }
}
