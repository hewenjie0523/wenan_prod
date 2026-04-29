import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/data/AppVoice.dart';
import 'package:wenan/data/chat/ChatSnap.dart';
import 'package:wenan/http/WenanCodedio_helper.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/http/socket/WenanCodechat_api.dart';
import 'package:wenan/utils/WenanCodeAuvAudioPlayerManager.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeui_utils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/call/chat/WenanCodeChatUtils.dart';
import 'package:wenan/view/call/chat/detail/layout/WenanCodeChatCellLayouts.dart';
import 'package:wenan/view/widgets/animations/WenanCodeImageFrameAnimationWidget.dart';



class ChatCellVoiceView extends StatefulWidget {
  final ChatSnap snap;
  final String cachePath;

  const ChatCellVoiceView({Key? key, required this.snap, required this.cachePath})
      : super(key: key);

  @override
  _ChatCellVoiceViewState createState() => _ChatCellVoiceViewState();
}

class _ChatCellVoiceViewState extends State<ChatCellVoiceView> {
  int _timeSec = 0;
  int _currentTimeSec = 0;
  bool _isPlaying = false;
  String? _saveFile;
  AppVoice? get _voice=>widget.snap.voice;

  @override
  void dispose() {
    AuvChatLog.d('ChatCellVoiceView - dispose : $this');
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    AuvChatLog.d('ChatCellVoiceView - initState: ${widget.snap.toJson()}');

    String? voiceUrl = _voice?.voice_url;
    if (voiceUrl != null && voiceUrl.isNotEmpty) {
      _saveFile = '${widget.cachePath}/${Utils.generateMd5(voiceUrl)}.mp3';
      _isUrlFileExist(voiceUrl).then((isExist) {
        if (!isExist) {
          _downLoadVoice(voiceUrl);
        }
      });
    }

    _timeSec = _voice?.duration?.toInt()??0;
    _currentTimeSec = _timeSec;

    AuvAudioPlayerManager.instance.audioPlayer?.onPositionChanged
        .listen((event) {
      if (AuvAudioPlayerManager.instance.audioUrl != null &&
          _voice?.voice_url != null &&
          (AuvAudioPlayerManager.instance.audioUrl ==
                  widget.snap.voice?.voice_url ||
              AuvAudioPlayerManager.instance.audioUrl == _saveFile)) {
        Utils.callSetStateSafely(this, () {
          _isPlaying = true;
          _currentTimeSec = event.inSeconds;
        });
      } else if (_isPlaying || _currentTimeSec != _timeSec) {
        Utils.callSetStateSafely(this, () {
          _isPlaying = false;
          _currentTimeSec = _timeSec;
        });
      }
    });
    AuvAudioPlayerManager.instance.audioPlayer?.onPlayerStateChanged
        .listen((event) {
          if(event==PlayerState.completed) {
            Utils.callSetStateSafely(this, () {
              _isPlaying = false;
              _currentTimeSec = _timeSec;
            });
          }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget tapWidget;
    AuvChatLog.d("widget.snap.isUnread=${widget.snap.unread}");
    if (!widget.snap.isMine && widget.snap.isUnread) {
      tapWidget = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          getContainer(),
          getUnreadRed(),
        ],
      );
    } else {
      tapWidget = getContainer();
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (_voice?.voice_url != null) {
          if (!_isPlaying) {
            if (!widget.snap.isMine && widget.snap.isUnread) {
              widget.snap.unread = false;
              Application.chatContext.dbService.snapDao
                  .saveOrUpdateModels([widget.snap]);
              ChatApi.sendReadSnapReq(widget.snap.chatBoxId!, snapIds: [widget.snap.id!]).first.then((value) => {});
            }
            Utils.callSetStateSafely(this, () {
              _isPlaying = true;
            });

            _isUrlFileExist(_voice?.voice_url).then((value) {
              if (value) {
                AuvAudioPlayerManager.instance
                    .startPlayAudio(_saveFile!, isLocal: true);
              } else {
                AuvAudioPlayerManager.instance
                    .startPlayAudio(_voice!.voice_url!);
              }
            });
          } else {
            AuvAudioPlayerManager.instance.stopPlayAudio();
            Utils.callSetStateSafely(this, () {
              _isPlaying = false;
              _currentTimeSec = _timeSec;
            });
          }
        }
      },
      child: tapWidget,
    );
  }

  Widget getUnreadRed() {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Container(
        width: 12.0,
        height: 12.0,
        decoration: BoxDecoration(
          color: AppColor.color_ff4d4d,
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }

  Widget getContainer() {
    List<Widget> rowChildren = [];
    if (_voice?.voice_url != null) {
      rowChildren = widget.snap.isMine
          ? <Widget>[
              getText(),
              const SizedBox(
                width: 8,
              ),
              getVoiceIcon(),
            ]
          : <Widget>[
              getVoiceIcon(),
              const SizedBox(
                width: 8,
              ),
              getText(),
            ];
    } else {
      rowChildren = [const Text('')];
    }
    var decoration = widget.snap.isMine
        ? BoxDecoration(
            borderRadius: ChatUtils.chatCellRadiusMine(),
            color: ImColors.color_snap_bg_me,
          )
        : BoxDecoration(
            borderRadius: ChatUtils.chatCellRadiusOther(),
            color: ImColors.color_snap_bg_other,
          );
    return Container(
      width: (90.0 + _timeSec),
      padding: const EdgeInsets.symmetric(
        horizontal: ChatCellLayouts.textHPadding,
        vertical: ChatCellLayouts.textVPadding,
      ),
      decoration: decoration,
      child: Row(
        mainAxisAlignment: widget.snap.isMine
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: rowChildren,
      ),
    );
  }



  Widget getVoiceIcon() {
    return Visibility(
      visible: !_isPlaying,
      replacement: Container(
        child: _voiceAnimation(!widget.snap.isMine),
      ),
      child: Image(
        image: ImageLoader.assetImage(widget.snap.isMine
            ? 'chat/wKexnMaMn7_hr3ezsx_SiCcg_Tc4hdadtK_4cAeClNlF_7vsoli5cMeA_cbnlLaPc7kM'
            : 'chat/wKexnMaMn7_hr3ezsx_SiCcg_Tc4hdadtK_4cAeClNlF_7vsoli5cMeA_cbnlLaPc7kM'),
        width: 18.0,
        height: 18.0,
        fit: BoxFit.fitWidth,
      ),
    );
  }



  Future<bool> _isUrlFileExist(String? url) async {
    bool isExist = false;
    if (url != null) {
      _saveFile ??= '${widget.cachePath}/${Utils.generateMd5(url)}';
      File file = File(_saveFile!);
      if (await file.exists()) {
        isExist = true;
      }
    }
    return isExist;
  }

  Widget getText() {
    return Text(
      '${_isPlaying ? _currentTimeSec : _voice?.duration}”',
      style: TextStyle(
          color: widget.snap.isMine ? ImColors.color_snap_text_me : ImColors.color_snap_text_other,
          fontSize: 16),
    );
  }


  Widget _voiceAnimation(bool usingWhite) {
    List<String> urls = [];
    final prefix = usingWhite
        ? 'chat/voice_animation/wenan_res_voice_voice_animation_black_'
        : 'chat/voice_animation/wenan_res_voice_voice_animation_black_';
    for (var i = 1; i <= 10; i++) {
      String fileNameNO = i.toString().padLeft(2, '0');
      urls.add('$prefix$fileNameNO');
    }
    return ImageFrameAnimationWidget(
      width: 18.0,
      height: 18.0,
      imageURLs: urls,
      intervalMilliseconds: 120,
    );
  }

  Future<String?> _downLoadVoice(String url) async {
    AuvChatLog.d('saveFile:$_saveFile');
    if(_saveFile!=null){
      Response response = await DioHelper.download(url, _saveFile!);
      AuvChatLog.d('response:code=${response.statusCode}');
      if (response.statusCode == 200) {
        return _saveFile;
      }
    }

    return null;
  }

}
