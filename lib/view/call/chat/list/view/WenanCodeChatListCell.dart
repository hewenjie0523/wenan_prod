import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wenan/data/chat/ChatBox.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/view/WenanCodeUserOSView.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';

class ChatListCell extends StatefulWidget {
  final ChatBox item;

  ChatListCell(this.item);

  @override
  _ChatListCellState createState() => _ChatListCellState();
}

class _ChatListCellState extends State<ChatListCell> {
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
          _headWidget(),
          AppGap.hGap12,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _nameWidget(),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _headWidget() {
    return Stack(
      children: [
        ImageLoader.loadOvalImage(
          widget.item.showCoverURL ?? "",
          width: 48,
          height: 48,
          type: ImageClipType.IMAGE_S,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: widget.item.chatUser?.uid == null
              ? const SizedBox()
              : UserOnlineStatusView(
                  uid: widget.item.chatUser!.uid!,
                ),
        ),
      ],
    );
  }

  _nameWidget() {
    return Flexible(
      child: Text.rich(
        TextSpan(
          text: '${widget.item.showName}',
          style: AppTextStyle.white16Bold,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _unreadCountWidget() {
    if (widget.item.unreadCount == null || widget.item.unreadCount == 0) {
      return const SizedBox(width: 18);
    }

    return Container(
        height: 18.0,
        constraints: const BoxConstraints(
          minWidth: 18.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 1.0,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFF4D4D),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Center(
          child: Text(
            ChatUtils.chatUnreadCount(widget.item.unreadCount),
            style: AppTextStyle.style(
              fontSize: 11.0,
              color: AppColor.white,
            ),
          ),
        ),
    );
  }

  _textWidget() {
    return Expanded(
      child: Text.rich(
        TextSpan(
          children: widget.item.lastContent,
          style: AppTextStyle.style(
            fontSize: 14,
            color: AppColor.white_40p,
          ),
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  _timeWidget() {
    if (widget.item.displayTime == null || widget.item.displayTime == 0) {
      return const SizedBox(width: 16.0);
    }

    return Text(
      ChatUtils.formatListTime(widget.item.displayTime),
      style: AppTextStyle.style(
        fontSize: 12.0,
        color: ImColors.color_time,
      ),
    );
  }
}
