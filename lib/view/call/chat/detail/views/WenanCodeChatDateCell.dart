import 'package:flutter/cupertino.dart';
import 'package:wenan/data/chat/WenanCodeChatDateItem.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';


class ChatDateCell extends StatelessWidget {
  final ChatDateItem item;

  const ChatDateCell({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.transparent,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        item.showText,
        style: ChatUtils.timeTextStyle,
      ),
    );
  }
}
