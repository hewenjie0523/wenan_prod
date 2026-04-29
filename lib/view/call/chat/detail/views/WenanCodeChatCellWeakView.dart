import 'package:flutter/cupertino.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/view/widgets/RichText/WenanCodeRichTextUtil.dart';


class ChatCellWeakView extends StatelessWidget {
  static void preHandleRichText(ChatSnap snap) {
    snap.richTexts ??= RichTextUtil.getRichText(
        snap.textContent,
        style: AppTextStyle.style(
          color: AppColor.b1,
          fontSize: 14.0,
        ),
      );
  }

  final ChatSnap snap;

  const ChatCellWeakView({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ChatCellLayouts.weakHPadding,
        vertical: ChatCellLayouts.weakVPadding,
      ),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(ChatCellLayouts.cellRadius),
      ),
      child: Text.rich(
        TextSpan(children: snap.richTexts),
      ),
    );
  }
}
