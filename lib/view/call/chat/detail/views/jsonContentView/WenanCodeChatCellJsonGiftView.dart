import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatSnapJsonContent.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/res/l10n/app_localizations.dart';

/**
 *  /*
    8. im送礼
    Key	Description
    category	8
    id	礼物id
    to_uid	对方uid
    quantity	数量
    icon	图标
    name	礼物名称
    value	礼物的价值
    min_duration	最小显示秒
    max_duration	最大显示秒
    animation_type	动画类型 0:小 1:中 2:大
    animation_url	动画url
    */
 */
class ChatCellJsonGiftView extends StatelessWidget {
  final ChatSnapJsonContent content;

  const ChatCellJsonGiftView({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d("ChatCellJsonGiftView:${content.status}");
    String text = 'Unknown';
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

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if(!Utils.isEmpty(content.animation_url)){
          PageRouter.startSvgaPlayer(context, content.animation_url!,svgaIcon: content.icon);
        }
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
            ImageLoader.loadDefault(content.icon??"",width: 48,height: 48),
            const SizedBox(width: 8.0),
            Column(
              children: [
                Text(StringTranslate.e2z(Application.appLocalizations?.wenan_string_send??""), style: AppTextStyle.style(color: color,fontSize: 16)),
                const SizedBox(height:6),
                Row(
                  children: [
                    Text(content.price?.toString()??"", style: AppTextStyle.style(color: color.withAlpha(180),fontSize: 14)),
                    const SizedBox(width:3),
                    ImageLoader.loadLocalImage('discover/wgernvaQn6_wrWeVsw_fdhihsMcSo7vyevrH_acZo7iYnB_qshmEaQlglM',width: 16,height: 16)
                  ],
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}
