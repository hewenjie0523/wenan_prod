  import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/state/event/WenanCodeChatEvent.dart';
import 'package:wenan/view/widgets/RichText/WenanCodeRichTextUtil.dart';

class ChatCellPopupMenu extends PopupMenuEntry<ChatSnapMenuType> {
  final ChatSnap snap;

  ChatCellPopupMenu(this.snap);

  @override
  double get height => 40.0;

  @override
  bool represents(ChatSnapMenuType? value) => value is ChatSnapMenuType;

  @override
  ChatCellPopupMenuState createState() => ChatCellPopupMenuState();
}

class ChatCellPopupMenuState extends State<ChatCellPopupMenu> {
  @override
  Widget build(BuildContext context) {
    final types = widget.snap.menuTypes;
    return Container(
      child: Row(
        children: <Widget>[
          if (types.contains(ChatSnapMenuType.Copy))
            Expanded(
              child: TextButton(
                onPressed: () => _onPressed(ChatSnapMenuType.Copy),
                child: Text('Copy'),
              ),
            ),
          if (types.contains(ChatSnapMenuType.AddToSticker))
            Expanded(
              child: TextButton(
                onPressed: () => _onPressed(ChatSnapMenuType.AddToSticker),
                child: Text('AddToSticker'),
              ),
            ),
          if (types.contains(ChatSnapMenuType.Resend))
            Expanded(
              child: TextButton(
                onPressed: () => _onPressed(ChatSnapMenuType.Resend),
                child: Text('Resend'),
              ),
            ),
          if (types.contains(ChatSnapMenuType.Recall))
            Expanded(
              child: TextButton(
                onPressed: () => _onPressed(ChatSnapMenuType.Recall),
                child: Text('Recall'),
              ),
            ),
        ],
      ),
    );
  }

  void _copy() {
    Clipboard.setData(
        ClipboardData(text: RichTextUtil.getCopyText(widget.snap.textContent)));
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
    Navigator.pop(context);
  }

  void _addToSticker() {
    // final image = widget.snap.image ?? widget.snap.images?.first;
    // if (image != null) {
    //   StickerAPI.addStickers([image.id]).then((rsp) {
    //     if (rsp.isSuccess()) {
    //       StickerManager.updateStickersAndTriggerRefresh();
    //     }
    //   });
    // }
  }

  void _recall() {
    Application.eventBus.fire(ChatEvent(
      ChatEventType.snapRecall,
      object: widget.snap,
    ));
  }

  void _resend() {
    Application.eventBus.fire(ChatEvent(
      ChatEventType.snapResend,
      object: widget.snap,
    ));
  }

}
