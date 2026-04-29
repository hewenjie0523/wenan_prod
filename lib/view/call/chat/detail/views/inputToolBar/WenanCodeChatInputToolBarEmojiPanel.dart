import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wenan/data/AppEmoji.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppSticker.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeChatEmojiManager.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/res/l10n/app_localizations.dart';
import 'package:wenan/StringTranslate.dart';


abstract class ChatInputToolBarEmojiPanelObserver {
  void onEmojiInput(String emoji);

  void onEmojiDelete();

  void onEmojiSend();

  void onEmojiSticker(AppImage sticker);

  bool onEmojiSendEnabled();

  void onEmojiPage(int index);
}

class ChatInputToolBarEmojiPanel extends StatefulWidget {
  final ChatInputToolBarEmojiPanelObserver? observer;
  final int emojiPage;

  const ChatInputToolBarEmojiPanel({
    Key? key,
    this.observer,
    this.emojiPage = 0,
  }) : super(key: key);

  @override
  _ChatInputToolBarEmojiPanelState createState() =>
      _ChatInputToolBarEmojiPanelState();
}

class _ChatInputToolBarEmojiPanelState
    extends State<ChatInputToolBarEmojiPanel> {
  bool _sendEnabled = false;
  late int _emojiPage;
  final _pageController = PageController();
  final _typeController = ScrollController();
  StreamSubscription? _subscription;

  @override
  void dispose() {
    AuvChatLog.d('ChatInputToolBarEmojiPanel - dispose : $this');
    _subscription?.cancel();
    _pageController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    AuvChatLog.d('ChatInputToolBarEmojiPanel - initState : $this');
    _emojiPage = widget.emojiPage;
    _updateSendEnabled();
    // _subscription =
    //     Application.eventBus.on<StickerRefreshEvent>().listen((event) {
    //   Utils.callSetStateSafely(this, () {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _emojiPanelList(),
        _emojiTypeOptList(),
      ],
    );
  }

  Widget _emojiPanelList() {
    final children = <Widget>[];
    int index = 0;

    /// Emoji Panels
    children.add(ChatEmojiView(
      type: ChatEmojiType.customEmoji,
      index: index++,
      items: ChatEmojiManager.emojiTextList,
      iconBasePath: ChatEmojiManager.instance.basePath,
      column: 8,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      onInputHandler: (emoji) {
        widget.observer?.onEmojiInput(emoji);
        _updateSendEnabled();
      },
    ));

    // /// Sticker Panel
    // List<AppSticker> stickerItems = [];
    // stickerItems.add(AppSticker.addStickerItem);
    // if (StickerManager.stickers != null) {
    //   stickerItems.addAll(StickerManager.stickers);
    // }
    // children.add(ChatEmojiView(
    //   type: ChatEmojiType.favorites,
    //   index: index++,
    //   items: stickerItems,
    //   column: 5,
    //   mainAxisSpacing: 10.0,
    //   crossAxisSpacing: 10.0,
    //   onSendSticker: (sticker) {
    //     if (sticker.isAddStickerItem) {
    //       Routes.open(Routes.AuvFlutterRouteChatStickerManager);
    //     } else {
    //       AppImage img = AppImage.fromJson(sticker.toJson());
    //       widget.observer?.onEmojiSticker(img);
    //     }
    //   },
    // ));

    return Expanded(
      child: PageView(
        key: const PageStorageKey('emoji_PageView'),
        controller: _pageController,
        physics: const AlwaysScrollableScrollPhysics(),
        children: children,
        onPageChanged: (index) {
          Utils.callSetStateSafely(this, () {
            _emojiPage = index;
            widget.observer?.onEmojiPage(index);
          });
        },
      ),
    );
  }

  void _updateSendEnabled() {
    bool? enabled = widget.observer?.onEmojiSendEnabled();
    if (enabled != null && _sendEnabled != enabled) {
      Utils.callSetStateSafely(this, () {
        _sendEnabled = enabled;
      });
    }
  }

  Widget _emojiTypeOptList() {

    double rightPadding = 0;
    double bottomOffset = MediaQuery.of(context).viewPadding.bottom;
    final List<Widget> child = [
      // Expanded(
      //   child: ListView.separated(
      //     key: const PageStorageKey('emoji_TypeList'),
      //     padding: const EdgeInsets.only(left: 15.0, right: 5.0),
      //     scrollDirection: Axis.horizontal,
      //     physics: const AlwaysScrollableScrollPhysics(),
      //     controller: _typeController,
      //     separatorBuilder: (context, index) {
      //       return const SizedBox(width: 15.0);
      //     },
      //     itemCount: ChatEmojiManager.instance.list.length + 1,
      //     itemBuilder: (context, index) {
      //       return _emojiCateButton(index);
      //     },
      //   ),
      // ),
      CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        onPressed: !_sendEnabled
            ? null
            : () {
                widget.observer?.onEmojiDelete();
                _updateSendEnabled();
              },
        child: ImageLoader.loadLocalImage('chat/wPe8nhaund_NrGebss_gp2aZl2at_2dJrFaZwiambnlheC_8iIcu_feAmwopj5iZ_wdqe5lBent8eg',width: 30,height: 30,color: AppColor.white),
      ),
    ];

    if (Platform.isIOS) {
      rightPadding = 15.0;
      child.add(CupertinoButton(
        minSize: 32.0,
        borderRadius: BorderRadius.circular(18.0),
        color: _sendEnabled ? AppColor.color_5a5ada : AppColor.white_40p,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
        child: Text(
          StringTranslate.e2z(AppLocalizations.of(context)!.wenan_string_send),
          style: AppTextStyle.style(
            color: _sendEnabled ? AppColor.white : AppColor.b3,
            fontSize: 12.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: !_sendEnabled
            ? null
            : () {
                widget.observer?.onEmojiSend();
                _updateSendEnabled();
              },
      ));
    }

    return Container(
      color: ImColors.color_bg,
      height: 50.0 + bottomOffset,
      padding: EdgeInsets.fromLTRB(0.0, 5.0, rightPadding, 5.0 + bottomOffset),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: child,
      ),
    );
  }

}

enum ChatEmojiType {
  favorites,
  customEmoji,
}

class ChatEmojiView extends StatelessWidget {
  final ChatEmojiType type;
  final int index;
  final List items;
  final String iconBasePath;
  final ValueChanged<String> onInputHandler;
  final ValueChanged<AppSticker>? onSendSticker;

  final int column;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const ChatEmojiView({
    Key? key,
    required this.type,
    required this.index,
    required this.items,
    required this.iconBasePath,
    required this.onInputHandler,
    this.onSendSticker,
    this.column = 8,
    this.mainAxisSpacing = 5.0,
    this.crossAxisSpacing = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: PageStorageKey('emoji_View$index'),
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: column,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
      ),
      itemBuilder: (context, index) {
        final e = items[index];
        var t;
        var w;
        switch (type) {
          case ChatEmojiType.customEmoji:
            if (e is String) {
              t = e;
              w = Text(
                e,
                style: TextStyle(fontSize: Platform.isAndroid ? 20 : 30, color: AppColor.white,),
              );
            } else if (e is AppEmoji) {
              t = e.name;
              w = Image.file(
                File(iconBasePath + e.icon!),
                width: 30.0,
                height: 30.0,
              );
            }
            break;
          default:
            if (e is AppSticker) {
              if (e.isAddStickerItem) {
                w = ImageLoader.loadLocalImage('chat/w2e5n9aynm_4rjehsX_4iecR_6s8tCi7c1koeprR_FsPett3t1iTnWg5');
              } else {
                w = CachedNetworkImage(imageUrl: e.url!);
              }
            }
            break;
        }
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Center(child: w),
          onTap: () {
            if (e is AppSticker) {
              onSendSticker?.call(e);
            } else {
              onInputHandler(t);
            }
          },
        );
      },
    );
  }
}
