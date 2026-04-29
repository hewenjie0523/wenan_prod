import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/proto/we_ps_im_object.pb.dart' as pb;

import 'package:flutter/services.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/view/call/chat/WenanCodeChatSnapJsonContentUtils.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/view/call/chat/detail/views/WenanCodeChatCellImageView.dart';
import 'package:wenan/view/call/chat/detail/views/WenanCodeChatCellTextView.dart';
import 'package:wenan/view/call/chat/detail/views/WenanCodeChatCellUnsupportedView.dart';
import 'package:wenan/view/call/chat/detail/views/WenanCodeChatCellUnsupportedWeakView.dart';
import 'package:wenan/view/call/chat/detail/views/WenanCodeChatCellVideoView.dart';
import 'package:wenan/view/call/chat/detail/views/WenanCodeChatCellVoiceView.dart';
import 'package:wenan/view/call/chat/detail/views/WenanCodeChatCellWeakView.dart';
import 'package:wenan/view/widgets/RichText/WenanCodeRichTextUtil.dart';

class ChatCell extends StatefulWidget {
  static void preHandleSnap(ChatSnap snap) {
    var snapType = pb.Snap_SnapType.valueOf(snap.type ?? -1);

    if (pb.Snap_SnapType.TXT_SNAP == snapType) {
      ChatCellTextView.preHandleRichText(snap);
    } else if (pb.Snap_SnapType.WEAK_SNAP == snapType) {
      ChatCellWeakView.preHandleRichText(snap);
    }

  }

  final ChatSnap snap;
  final String? cachePath;

  const ChatCell({Key? key, required this.snap, this.cachePath}) : super(key: key);

  @override
  _ChatCellState createState() => _ChatCellState();
}

class _ChatCellState extends State<ChatCell> {
  final _snapViewKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return widget.snap.isUserSnap ? _userCellView() : _nonUserCellView();
  }

  Widget _userCellView() {
    Widget snapView = _userContentView();

    var alignment, leftPadding, rightPadding, child;
    final headSpacePadding = ChatCellLayouts.headSpacePadding;
    if (widget.snap.isMine) {
      /// 自己的 snap 处理
      alignment = AlignmentDirectional.centerEnd;
      if(Application.isARLanguage()){
        leftPadding = ChatCellLayouts.padding;
        rightPadding = headSpacePadding;
      } else {
        leftPadding = headSpacePadding;
        rightPadding = ChatCellLayouts.padding;
      }

      int sendStatus = widget.snap.sendStatus ?? 0;
      if (widget.snap.isCallJsonSnap) {
        /// "音视频通话" 不需要添加任何修饰
        child = snapView;
      } else if (sendStatus == ChatSnapSendStatus.success.index) {
        /// 添加 "自己 snap 头像"
        child = Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            snapView,
            // ChatCellLayouts.headContentHGap,
            // ImageLoader.loadOvalImage(
            //   widget.snap.ownerHead ?? "",
            //   width: 48,
            //   height: 48,
            //   type: ImageClipType.IMAGE_S,
            // ),
          ],
        );
      } else {
        /// 添加 "发送中/发送失败"
        // leftPadding -= 40.0;
        child = Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            widget.snap.sendStatus == ChatSnapSendStatus.sending.index
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: CupertinoActivityIndicator(
                      radius: 12.0,
                    ),
                  )
                : CupertinoButton(
                    minSize: 40.0,
                    padding: const EdgeInsets.all(0.0),
                    onPressed: _resend,
                    child: ImageLoader.loadLocalImage(
                      'chat/wIe0ndainh_Vr1emsI_9iMcK_xsdeenFdr_JfmaqiKlc',
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
            snapView,
          ],
        );
      }
    } else {
      /// 他人的 snap 处理
      /// 添加 "他人 snap 头像"
      alignment = AlignmentDirectional.centerStart;
      if (Application.isARLanguage()) {
        leftPadding = headSpacePadding;
        rightPadding = ChatCellLayouts.padding;
      } else {
        leftPadding = ChatCellLayouts.padding;
        rightPadding = headSpacePadding;
      }

      child = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: ImageLoader.loadOvalImage(
              widget.snap.ownerHead ?? "",
              width: ChatCellLayouts.headSize,
              height: ChatCellLayouts.headSize,
              type: ImageClipType.IMAGE_S,
            ),
            onTap: () => PageRouter.startUserProfilePage(context, widget.snap.owner),
          ),
          ChatCellLayouts.headContentHGap,
          Flexible(child: snapView),
        ],
      );
    }

    return Container(
      color: AppColor.transparent,
      alignment: alignment,
      padding: EdgeInsets.only(
        left: leftPadding,
        right: rightPadding,
      ),
      child: child,
    );
  }

  Widget _nonUserCellView() {
    Widget? view;
    if (!widget.snap.isSupportType) {
      view = ChatCellUnsupportedWeakView();
    } else {
      var snapType = pb.Snap_SnapType.valueOf(widget.snap.type ?? -1);

      if (pb.Snap_SnapType.WEAK_SNAP == snapType) {
        view = ChatCellWeakView(snap: widget.snap);
      } else if (pb.Snap_SnapType.JSON_SNAP == snapType) {
        view = ChatSnapJsonContentUtils.jsonContentView(widget.snap);
      }

    }
    return Center(child: view);
  }

  Widget _userContentView() {
    Widget? snapView;
    if (!widget.snap.isSupportType) {
      snapView = ChatCellUnsupportedView(snap: widget.snap);
    } else {
      var snapType = pb.Snap_SnapType.valueOf(widget.snap.type ?? -1);

      if (pb.Snap_SnapType.TXT_SNAP == snapType) {
        snapView = ChatCellTextView(key: _snapViewKey, snap: widget.snap);
      } else if (pb.Snap_SnapType.IMG_SNAP == snapType) {
        snapView = ChatCellImageView(key: _snapViewKey, snap: widget.snap);
      } else if (pb.Snap_SnapType.VIDEO_SNAP == snapType) {
        snapView = ChatCellVideoView(key: _snapViewKey, snap: widget.snap);
      } else if (pb.Snap_SnapType.VOICE_SNAP == snapType) {
        snapView = ChatCellVoiceView(
          key: _snapViewKey,
          snap: widget.snap,
          cachePath: widget.cachePath ?? "",
        );
      } else if (pb.Snap_SnapType.JSON_SNAP == snapType) {
        snapView = ChatSnapJsonContentUtils.jsonContentView(
          widget.snap,
          key: _snapViewKey,
        );
      }


      /*if (snapView != null) {
        snapView = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onLongPress: _showSnapMenu,
          child: snapView,
        );
      }*/
    }
    return snapView ?? ChatCellUnsupportedView(snap: widget.snap);
  }



  // void _showSnapMenu() {
  //   final types = widget.snap.menuTypes;
  //   PopupMenu menu = PopupMenu(
  //     context: context,
  //     items: [
  //       if (types.contains(ChatSnapMenuType.Copy))
  //         MenuItem(
  //           id: ChatSnapMenuType.Copy.index,
  //           title: '复制',
  //           textStyle: AppTextStyle.TextWhite_14,
  //         ),
  //       if (types.contains(ChatSnapMenuType.AddToSticker))
  //         MenuItem(
  //           id: ChatSnapMenuType.AddToSticker.index,
  //           title: '添加到表情',
  //           textStyle: AppTextStyle.TextWhite_14,
  //         ),
  //       if (types.contains(ChatSnapMenuType.Resend))
  //         MenuItem(
  //           id: ChatSnapMenuType.Resend.index,
  //           title: '重新发送',
  //           textStyle: AppTextStyle.TextWhite_14,
  //         ),
  //       if (types.contains(ChatSnapMenuType.Recall))
  //         MenuItem(
  //           id: ChatSnapMenuType.Recall.index,
  //           title: '撤回',
  //           textStyle: AppTextStyle.TextWhite_14,
  //         ),
  //     ],
  //     onClickMenu: (provider) {
  //       if (provider is MenuItem) {
  //         _onPressed(ChatSnapMenuType.values[provider.id]);
  //       }
  //     },
  //   );
  //   menu.show(widgetKey: _snapViewKey);
  //   return;
  // }


  void _copy() {
    Clipboard.setData(ClipboardData(text: RichTextUtil.getCopyText(widget.snap.textContent)));
  }


  void _recall() {
    Application.eventBus.fire(ChatEvent(
      ChatEventType.snapRecall,
      object: widget.snap,
    ));
  }

  void _onPressed(ChatSnapMenuType type) {
    switch (type) {
      case ChatSnapMenuType.Copy:
        _copy();
        break;
      case ChatSnapMenuType.AddToSticker:
        _addToSticker();
        break;
      case ChatSnapMenuType.Resend:
        _resend();
        break;
      case ChatSnapMenuType.Recall:
        _recall();
        break;
    }
  }


  void _resend() {
    Application.eventBus.fire(ChatEvent(
      ChatEventType.snapResend,
      object: widget.snap,
    ));
  }

  void _addToSticker() {
    final image = widget.snap.image ?? widget.snap.images?.first;
    // if (image != null) {
    //   StickerAPI.addStickers([image.id]).then((rsp) {
    //     if (rsp.isSuccess()) {
    //       StickerManager.updateStickersAndTriggerRefresh();
    //     }
    //   });
    // }
  }

}
