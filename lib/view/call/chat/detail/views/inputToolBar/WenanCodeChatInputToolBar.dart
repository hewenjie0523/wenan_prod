import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeAuvTextEditingController.dart';
import 'package:wenan/data/AppImage.dart';
import 'package:wenan/data/AppVideo.dart';
import 'package:wenan/data/Gift.dart';
import 'package:wenan/state/event/WenanCodeEvents.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/utils/WenanCodeChatEmojiManager.dart';
import 'package:wenan/utils/WenanCodeDataReporter.dart';
import 'package:wenan/utils/WenanCodeImagePickerUtils.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/chat/detail/views/inputToolBar/WenanCodeChatInputToolBarEmojiPanel.dart';
import 'package:wenan/view/call/chat/detail/views/inputToolBar/WenanCodeChatInputToolBarFuncPanel.dart';
import 'package:wenan/view/call/chat/detail/views/inputToolBar/WenanCodeChatInputToolBarPhotoPanel.dart';
import 'package:wenan/view/widgets/RichText/WenanCodeRichTextUtil.dart';
import 'package:wenan/view/match/discover/gift/WenanCodeGiftPage.dart';

enum ChatInputMethod {
  none,
  text,
  voice,
  photo,
  gift,
  emoji,
  function,
  call,
}

enum ChatInputPlatForm {
  message,
}

abstract class ChatInputToolBarObserver {
  void onActiveInputMethod(ChatInputMethod method);

  void onTextChanged(String text);

  void onSendText(String text);

  void onSendSticker(AppImage sticker);

  void onSendImage(String path);

  void onSendVideo(String path);

  void onSendVoice(String path);

  void onSelectInputFunc(ChatInputFuncType type);

  void onSendGift(Gift gift);
}

class ChatInputToolBar extends StatefulWidget {
  final ChatInputToolBarObserver observer;
  final String? cachePath;
  final String? hintText;
  final ChatInputPlatForm fromPlatform;
  final ChatInputMethod inputType;

  const ChatInputToolBar({
    Key? key,
    required this.observer,
    this.cachePath,
    this.hintText,
    this.fromPlatform = ChatInputPlatForm.message,
    this.inputType = ChatInputMethod.none,
  }) : super(key: key);

  @override
  ChatInputToolBarState createState() => ChatInputToolBarState();
}

class ChatInputToolBarState extends State<ChatInputToolBar> implements ChatInputToolBarEmojiPanelObserver {
  String _editText = '';
  TextSelection? _editSelection;
  final FocusNode _editFocus = FocusNode();
  final TextEditingController _editController = AuvTextEditingController();
  StreamSubscription? _keyboardSubscription;

  ChatInputMethod _method = ChatInputMethod.none;
  String hintText = "";
  int _emojiPage = 0;

  bool get _isInputToolPanelShown => _method != ChatInputMethod.none;

  bool get keyboardShowing => _method == ChatInputMethod.text;

  bool get _hasInputText => StringUtils.isNotEmpty(_editController.text);

  bool get isChatPlatform {
    return widget.fromPlatform == ChatInputPlatForm.message;
  }

  void setDraft(String draft) {
    _editController.text = draft;
    _editFocus.requestFocus();
    _notifyTextChanged();
  }

  void setHintText(String? hint) {
    if (StringUtils.isNotEmpty(hint)) {
      Utils.callSetStateSafely(this, () {
        hintText = hint ?? "";
        _editFocus.requestFocus();
      });
    }
  }

  void requestEditFoucs() {
    _editFocus.requestFocus();
  }

  @override
  void dispose() {
    AuvChatLog.d('ChatInputToolBar - dispose : $this');
    _editFocus.dispose();
    _editController.dispose();
    _keyboardSubscription?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    AuvChatLog.d('ChatInputToolBar - initState : $this');
    if (StringUtils.isNotEmpty(widget.hintText)) {
      hintText = widget.hintText!;
    }

    // _editFocus.addListener(() {
    //   if (_editFocus.hasFocus) {
    //     activateInputMethod(ChatInputMethod.text);
    //   }
    // });
    _editController.addListener(() {
      if (_editController.selection.start >= 0 && _editController.selection.end >= 0) {
        _editSelection = _editController.selection;
      }
      Utils.callSetStateSafely(this, () {});
    });
    _keyboardSubscription = Application.eventBus.on<KeyBoardEvent>().listen((event) {
      if (!mounted) return;
      AuvChatLog.d('ChatInputToolBar - initState: KeyboardHeightEvent '
          '${event.height}, ${Application.keyboardHeight}');
      if (_method == ChatInputMethod.none) {
        if (event.height > 0) {
          activateInputMethod(ChatInputMethod.text);
        }
      } else if (_method == ChatInputMethod.text) {
        if (event.height == 0) {
          deactivateInputMethod();
        }
      }
    });
    _method = widget.inputType;
    if (_method == ChatInputMethod.text && Platform.isAndroid) {
      _editFocus.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    AuvChatLog.d('ChatInputToolBar - Build : '
        '$_method, '
        '${Application.keyboardHeight}, '
        '${deviceData.viewInsets.bottom},$_isInputToolPanelShown');
    final panelHeight = 261 + deviceData.viewPadding.bottom;
    final visibilityHeight = !_isInputToolPanelShown
        ? 0.0
        : _method == ChatInputMethod.text
            ? max(panelHeight, deviceData.viewInsets.bottom)
            : panelHeight;
    AuvChatLog.d('ChatInputToolBar - Build : visibilityHeight=$visibilityHeight');
    // if (_method == ChatInputMethod.text && deviceData.viewInsets.bottom == 0) {
    //   //键盘被收起了，但是面板状态未改变
    //   Future.delayed(const Duration(milliseconds: 200), () {
    //     if (MediaQuery.of(context).viewInsets.bottom == 0) {
    //       deactivateInputMethod();
    //     }
    //   });
    // }
    return Container(
      padding: EdgeInsets.only(
          top: 10,
          bottom:
              _isInputToolPanelShown ? 0 : deviceData.viewPadding.bottom + 10),
      child: Column(
        children: <Widget>[
          // _textFieldLine(),
          _functionButtonLine(),
          Visibility(
            visible: _isInputToolPanelShown,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: visibilityHeight.toDouble(),
              color: ImColors.color_bg,
              child: _inputToolPanel(_method),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFieldLine() {
    final textField = CupertinoTextField(
        minLines: 1,
        maxLines: 2,
        maxLength: 2000,
        padding: const EdgeInsets.all(0),
        style: const TextStyle(
          fontSize: 14,
          color: AppColor.b3
        ),
        enableSuggestions: false,
        autocorrect: false,
        focusNode: _editFocus,
        controller: _editController,
        decoration: const BoxDecoration(
          color: AppColor.transparent,
        ),
        placeholderStyle: AppTextStyle.style(color: AppColor.white_20p, fontSize: 14.0),
        placeholder: hintText,
        textInputAction: TextInputAction.newline,
        onSubmitted: null,
        onChanged: _onTextChanged,
        suffix: Container());

    return Container(
      height: 44,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 8),
      child: Container(
        height: 44,
        padding: const EdgeInsetsDirectional.only(start: 16, end: 4),
        decoration: BoxDecoration(
          color: const Color(0x33F3F3F5),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            Expanded(
              child: textField,
            ),
            AppGap.hGap6,
            CupertinoButton(
              padding: const EdgeInsets.all(4),
              onPressed: _hasInputText ? _sendText : null,
              child: Application.isARLanguage()
                  ? ImageLoader.loadLocalImage(
                      _hasInputText
                          ? "chat/wSeVnAa1ny_frqeBsb_3imcO_vcChha3ta_6sveknPd9_6eMnaaZbNlce2_NmZep"
                          : "chat/wMevnIaGnb_dr9ersD_4iccV_wcihdaltQ_Js7eTnLdw_ddCilsma3bHlYeu_4mse9",
                      width: 36,
                      height: 36,
                      fit: BoxFit.contain
                    )
                  : ImageLoader.loadLocalImage(
                      _hasInputText
                          ? "chat/wVe7n4aHnT_NrkeRsG_xi9cv_zcHhQattT_1sLeWnidp_Aejn6axbjlje0"
                          : "chat/wJeknqaxnB_KrUeIsB_SiLcV_PcOhZaAtn_Dsme1n1ds_VdNiJsFapbDlnet",
                      width: 36,
                      height: 36,
                      fit: BoxFit.contain
                    ),
            ),
          ],
        ),
      ),
    );
  }
  void selectInputFunc(ChatInputFuncType type) {
    widget.observer.onSelectInputFunc(type);
  }

  Widget _functionButtonLine() {
    Widget _button(IconData? iconData, bool selected, VoidCallback onPressed, {String? iconPath, double? width, double? height}) {
      return CupertinoButton(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 14.0),
        onPressed: onPressed,
        child: iconData != null
            ? Icon(
                iconData,
                size: 24.0,
                color: selected ? AppColor.b1 : AppColor.color_cccccc,
              )
            : ImageLoader.loadLocalImage(iconPath!, width: width!, height: height!),
      );
    }

    return Visibility(
      visible: isChatPlatform,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: SizedBox(
          height: 100,
          child: Column(
            children: <Widget>[
              Expanded(
                child: _textFieldLine(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _button(null, _method == ChatInputMethod.photo, () {
                      activateInputMethod(ChatInputMethod.photo);
                    }, iconPath: 'chat/wVeOn8aOn3_3roe9sM_YizcY_DcPh1agt4_YtsoJoJli_RidmCgg', width: 28, height: 28),
                    // const SizedBox(width: 16,),
                    _button(null, _method == ChatInputMethod.emoji, () {
                      activateInputMethod(ChatInputMethod.emoji);
                    }, iconPath: 'chat/weeuncadnh_0rge2sp_niecA_2cFhzaEtp_OtioUo4l2_Ve0mOotj3iC', width: 28, height: 28),
                    // const SizedBox(width: 8,),
                    _button(null, _method == ChatInputMethod.gift, () {
                      activateInputMethod(ChatInputMethod.gift);
                    }, iconPath: 'chat/wiebnsatna_wrNeFsy_giEcC_ccJhkartu_6tpoSo5lm_mgPiMfotH', width: 28, height: 28),
                    _button(null, _method == ChatInputMethod.call, () {
                      activateInputMethod(ChatInputMethod.call);
                    }, iconPath: 'chat/woehnAaenn_SrHe4so_wiacr_xcjhZaft7_ZteoUo1l4_kcHaAlQlt', width: 28, height: 28),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void recordVoice(String path) {
    AuvChatLog.d('recordVoice path = $path');
    widget.observer.onSendVoice(path);
  }


  Widget _inputToolPanel(ChatInputMethod method) {
    Widget widget = Container(
      color: ImColors.color_bg,
    );
    switch (method) {
      // case ChatInputMethod.voice:
      //   widget = ChatInputToolBarVoicePanel(
      //     onVoiceRecord: recordVoice,
      //     cachePath: this.widget.cachePath,
      //   );
      //   break;
      case ChatInputMethod.photo:
        widget = const ChatInputToolBarPhotoPanel();
        break;
//      case ChatInputMethod.gift:
//        widget = ChatInputToolBarGiftPanel();
//        break;
      case ChatInputMethod.emoji:
        widget = ChatInputToolBarEmojiPanel(observer: this, emojiPage: _emojiPage);
        break;
      case ChatInputMethod.function:
        widget = ChatInputToolBarFuncPanel(selectFunc: selectInputFunc);
        break;
      default:
        break;
    }
    return widget;
  }


  void activateInputMethod(ChatInputMethod method) {
    if (_method == method) return;

    AuvChatLog.d('ChatInputToolBar - activateInputMethod: $method');
    if (method == ChatInputMethod.photo) {
      ImagePickerUtils.showNativeImagePicker(
        context,
        callback: (mediaType, mediaList) {
          if (!Utils.isEmpty(mediaList)) {
            var selected = mediaList.first;
            if (selected is AppImage) {
              widget.observer.onSendImage(selected.img_url!);
            } else if (selected is AppVideo) {
              widget.observer.onSendVideo(selected.video_url!);
            }
          }
        },
      );
      return;
    } else if (method == ChatInputMethod.gift) {
      DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_IM_GIFT, 1);
      GiftPage.show(context).then((gift) {
        if (gift != null) {
          widget.observer.onSendGift(gift);
        }
      });
      return;
    } else if (method == ChatInputMethod.call) {
      DataReporter.sendTrackCountEvent(DataReporter.CLICK_ON_IM_MAKE_CALL, 1);
      widget.observer.onSelectInputFunc(ChatInputFuncType.video);
      return;
    } else if (method == ChatInputMethod.voice) {
      widget.observer.onSelectInputFunc(ChatInputFuncType.voice);
      return;
    }

    if (_method == ChatInputMethod.text) _editFocus.unfocus();
    _method = method;
    Utils.callSetStateSafely(this, () {});
    widget.observer.onActiveInputMethod(_method);
  }

  void _notifyTextChanged() {
    widget.observer.onTextChanged(_editController.text);
  }

  void deactivateInputMethod() {
    if (_method == ChatInputMethod.none) return;
    if (_method == ChatInputMethod.text) _editFocus.unfocus();
    _method = ChatInputMethod.none;
    widget.observer.onActiveInputMethod(_method);
    Utils.callSetStateSafely(this, () {});
  }

  TextSelection _ensuredEditSelection() {
    if (_editSelection == null || _editSelection!.start < 0 || _editSelection!.end < 0) {
      _editSelection = TextSelection.collapsed(offset: _editController.text.length);
    }
    return _editSelection!;
  }


  void _onTextChanged(String text) {
    if (_editText.runes.length == text.runes.length + 1 && (text.isEmpty || _editText.contains(text))) {
      _tryDeleteEmoji();
    }
    _editText = _editController.text;
    _editSelection = _editController.selection;
    _notifyTextChanged();
  }


  void _tryDeleteEmoji() {
    Iterable<RegExpMatch> matches = RegExp(kEmojiNameRegular).allMatches(_editText);
    if (matches.isEmpty) return;
    final last = matches.last;
    if (last.end == _editText.length && ChatEmojiManager.instance.dic[last.group(0)] != null) {
      _editController.text = _editText.substring(0, _editText.length - (matches.last.end - matches.last.start));
      _editController.selection = TextSelection.collapsed(offset: _editController.text.length);
    }
  }

  void _sendText() {
    if (_method == ChatInputMethod.text) _editFocus.requestFocus();
    String text = _editController.text.trim();
    if (text.isEmpty) return;
    text = ChatEmojiManager.instance.checkEmojiText(text);
    widget.observer.onSendText(text);
    _editController.text = '';
    _editText = _editController.text;
    _editSelection = null;
    _notifyTextChanged();
  }

  @override
  void onEmojiDelete() {
    final selection = _ensuredEditSelection();
    final left = _editController.text.substring(0, selection.start);
    final right = _editController.text.substring(selection.start);
    final newLeft = left.runes.isEmpty ? left : String.fromCharCodes(left.runes, 0, left.runes.length - 1);
    _editController.text = newLeft + right;
    _editController.selection = TextSelection(
      baseOffset: selection.start - (newLeft.length - left.length).abs(),
      extentOffset: selection.end - (newLeft.length - left.length).abs(),
      affinity: selection.affinity,
      isDirectional: selection.isDirectional,
    );
    _onTextChanged(_editController.text);
  }

  @override
  void onEmojiInput(String emoji) {
    final selection = _ensuredEditSelection();
    final left = _editController.text.substring(0, selection.start);
    final right = _editController.text.substring(selection.start);
    _editController.text = left + emoji + right;
    _editController.selection = TextSelection(
      baseOffset: selection.start + emoji.length,
      extentOffset: selection.end + emoji.length,
      affinity: selection.affinity,
      isDirectional: selection.isDirectional,
    );
    _editText = _editController.text;
    _editSelection = _editController.selection;
    _notifyTextChanged();
  }

  @override
  bool onEmojiSendEnabled() {
    return _editController.text.isNotEmpty;
  }

  @override
  void onEmojiSend() {
    _sendText();
  }


  @override
  void onEmojiPage(int index) {
    _emojiPage = index;
  }

  @override
  void onEmojiSticker(AppImage sticker) {
    widget.observer.onSendSticker(sticker);
  }

}
