import 'package:flutter/cupertino.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/view/widgets/RichText/WenanCodeRichTextUtil.dart';

class ChatCellTextView extends StatelessWidget {
  static void preHandleRichText(ChatSnap snap) {
    snap.richTexts ??= RichTextUtil.getRichText(
      snap.textContent,
      style: snap.isMine ? ChatUtils.outgoingTextStyle : ChatUtils.incomingTextStyle,
    );
  }

  final ChatSnap snap;

  const ChatCellTextView({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d("ChatCellTextView,snap.richTexts=${snap.richTexts}", tag: "chat");
    var decoration = snap.isMine
        ? BoxDecoration(
            borderRadius: ChatUtils.chatCellRadiusMine(),
            color: ImColors.color_snap_bg_me,
          )
        : BoxDecoration(
            borderRadius: ChatUtils.chatCellRadiusOther(),
            color: ImColors.color_snap_bg_other,
          );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        constraints: BoxConstraints(minHeight: ChatCellLayouts.textMinHeight, maxWidth: MediaQuery.of(context).size.width - 144),
        padding: const EdgeInsets.symmetric(
          horizontal: ChatCellLayouts.textHPadding,
          vertical: ChatCellLayouts.textVPadding,
        ),
        decoration: decoration,
        child: Text.rich(
          TextSpan(children: snap.richTexts),
        ),
      ),
    );
  }
}
