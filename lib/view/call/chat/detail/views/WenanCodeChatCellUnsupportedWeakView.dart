import 'package:flutter/cupertino.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodedimens.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';


class ChatCellUnsupportedWeakView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: ChatCellLayouts.weakHPadding,
        vertical: ChatCellLayouts.weakVPadding,
      ),
      // decoration: BoxDecoration(
      //   color: AppColor.white,
      //   borderRadius: BorderRadius.circular(12.0),
      // ),
      child:  Text(StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_chat_unknown_type), style: const TextStyle(
        fontSize: AppDimen.font_sp14,
        color: AppColor.b3,
        fontFamily: AppText.fontFamily,
        decoration: TextDecoration.none,
      )),
    );
  }
}
