import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wenan/data/chat/WenanCodeChatListOtherItem.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';

class ChatListOtherItemCell extends StatefulWidget {
  final ChatListOtherItem item;

  ChatListOtherItemCell(this.item);

  @override
  _ChatListOtherItemCellState createState() => _ChatListOtherItemCellState();
}

class _ChatListOtherItemCellState extends State<ChatListOtherItemCell> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.white_20p,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _headImage(),
          AppGap.hGap12,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _nickNameText(),
                    AppGap.hGap4,
                    _timeWidget(),
                  ],
                ),
                AppGap.vGap8,
                SizedBox(
                  width: max(160.0, screenWidth - 100.0),
                  child: Row(
                    children: <Widget>[
                      _textWidget(),
                      AppGap.hGap8,
                      _unreadCountWidget(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  _nickNameText() {
    return Text(
      widget.item.name ?? "",
      style: AppTextStyle.white16Bold,
    );
  }

  _timeWidget() {
    if (widget.item.time == null || widget.item.time == 0) {
      return const SizedBox(width: 16.0);
    }

    return Text(
      ChatUtils.formatListTime(widget.item.time),
      style: AppTextStyle.style(
        fontSize: 12.0,
        color: ImColors.color_time,
      ),
    );
  }

  _headImage() {
    return ImageLoader.loadLocalImage(
        widget.item.icon ?? "",
        width: 48,
        height: 48,
    );
  }

  _textWidget() {
    return Expanded(
      child: Text(
        widget.item.content ?? "",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.style(
            fontSize: 14,
            color: AppColor.white_40p,
            height: 1.1
        ),
      ),
    );
  }

  _unreadCountWidget() {
    if (widget.item.count == null || widget.item.count == 0) {
      return const SizedBox(width: 18.0);
    }

    return Container(
        height: 18.0,
        constraints: const BoxConstraints(
          minWidth: 18.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 2.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFF4D4D),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Center(
          child: Text(
            ChatUtils.chatUnreadCount(widget.item.count),
            style: AppTextStyle.style(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
        ),
    );
  }

}
