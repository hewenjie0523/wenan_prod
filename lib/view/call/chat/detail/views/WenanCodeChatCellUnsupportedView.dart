import 'package:flutter/cupertino.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/res/l10n/app_localizations.dart';


class ChatCellUnsupportedView extends StatelessWidget {
  final ChatSnap snap;

  const ChatCellUnsupportedView({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var decoration = snap.isMine
        ? BoxDecoration(
            borderRadius: ChatUtils.chatCellRadiusMine(),
            color: ImColors.color_snap_bg_me,
          )
        : BoxDecoration(
            borderRadius: ChatUtils.chatCellRadiusOther(),
            color: ImColors.color_snap_bg_other,
          );
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ChatCellLayouts.textHPadding,
        vertical: ChatCellLayouts.textVPadding,
      ),
      decoration: decoration,
      child: Text(
        StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_chat_unknown_type),
        style: snap.isMine ? ChatUtils.outgoingTextStyle : ChatUtils.incomingTextStyle,
      ),
    );
  }
}
