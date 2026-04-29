import 'dart:async';
import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodegaps.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodestring_format.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:video_player/video_player.dart';

abstract class MediaVideoViewerDataSource {
  int currentIndex = 0;
  int itemCount = 0;
  VoidCallback? dataUpdatedCallback;

  int autoPlayIndex();

  String heroTag(int index);

  String? localPath(int index);

  String? netPath(int index);

  ImageProvider imageProvider(int index);

  void onPageChanged(int index);
}
class MediaVideoViewer extends StatefulWidget {
  final MediaVideoViewerDataSource dataSource;

  static Future? show(BuildContext context,MediaVideoViewerDataSource dataSource) {
    return PageRouter.startViewVideo(context,dataSource);
  }


  const MediaVideoViewer(this.dataSource, {Key? key}) : super(key: key);

  @override
  _WenanMediaVideoViewerState createState() => _WenanMediaVideoViewerState();
}

class _WenanMediaVideoViewerState extends State<MediaVideoViewer> {
  bool _autoPlay = true;
  PageController? _pageController;
  late MediaVideoViewerDataSource _dataSource;

  @override
  void dispose() {
    AuvChatLog.d('[MediaVideoViewer_Log] dispose');
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _dataSource = widget.dataSource;
    _dataSource.dataUpdatedCallback = () {
      _pageController?.jumpToPage(_dataSource.currentIndex);
      callSetStateSafely(this, () {});
    };
    _pageController = PageController(initialPage: _dataSource.currentIndex);
  }

  callSetStateSafely(State state, VoidCallback fn) {
    if (state.mounted) state.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return CupertinoPageScaffold(
      child: Container(
        color: Colors.black,
        child: PageView.builder(
          controller: _pageController,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _dataSource.itemCount,
          onPageChanged: (index) {
            _autoPlay = false;
            AuvChatLog.d('[MediaVideoViewer_Log] onPageChanged: $index');
            _dataSource.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            AuvChatLog.d('[MediaVideoViewer_Log] itemBuilder: $index');
            return MediaVideoView(
              autoPlay: _autoPlay && index == _dataSource.autoPlayIndex(),
              heroTag: _dataSource.heroTag(index),
              imageProvider: _dataSource.imageProvider(index),
              filePath: _dataSource.localPath(index),
              netPath: _dataSource.netPath(index),
            );
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class MediaVideoView extends StatefulWidget {
  bool autoPlay;
  final String heroTag;
  final ImageProvider? imageProvider;
  final String? filePath;
  final String? netPath;

  MediaVideoView({
    Key? key,
    this.autoPlay = false,
    required this.heroTag,
    this.imageProvider,
    this.filePath,
    this.netPath,
  }) : super(key: key);

  @override
  _MediaVideoViewState createState() => _MediaVideoViewState();
}

class _MediaVideoViewState extends State<MediaVideoView> {
  bool _playAfterInitialized = false;
  bool _isInitialized = false;
  bool _isListenerAdded = false;
  bool _isControlShowing = true;
  bool _isControlVisible = true;
  Timer? _toggleControlTimer;
  VideoPlayerController? _playController;

  VideoPlayerValue? get _playerValue => _playController?.value;
  bool get _isPlaying=> (_playerValue!=null&&_playerValue!.isPlaying);

  @override
  void dispose() {
    AuvChatLog.d('[MediaVideoView_Log] dispose $this');
    _playController?.dispose();
    _playController = null;
    _stopToggleControlVisibleTimerIfNeed();
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    AuvChatLog.d('[MediaVideoView_Log] deactivate $this');
    _stopToggleControlVisibleTimerIfNeed();
    _playController?.pause();
  }

  @override
  void initState() {
    super.initState();
    AuvChatLog.d('[MediaVideoView_Log] initState $this ${widget.autoPlay}');
    _playAfterInitialized = widget.autoPlay;
    widget.autoPlay = false;
    _initializePlay();
  }

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d('[MediaVideoView_Log] build $this');
    return Container(
      color: Colors.black,
      child: Stack(
        children: <Widget>[
          /// Video
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _toggleControlVisible,
            child: Center(
              child: Hero(
                tag: widget.heroTag,
                child: AspectRatio(
                  aspectRatio: _playerValue?.aspectRatio??1.0,
                  child: _playController == null
                      ? Container()
                      : VideoPlayer(_playController!),
//                  /// 下面是添加 Cover 的代码
//                  child: Stack(
//                    children: <Widget>[
//                      _playController == null
//                          ? Container()
//                          : VideoPlayer(_playController),
//                      Visibility(
//                        visible: !_isInitialized,
//                        child: Center(
//                          child: Image(
//                            image: widget.imageProvider,
//                            fit: BoxFit.contain,
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
                ),
              ),
            ),
          ),

          /// Center Play Button
          Visibility(
            visible: _playerValue != null && !_playerValue!.isPlaying,
            child: Center(
              child: CupertinoButton(
                minSize: 48.0,
                child: ImageLoader.loadLocalImage(
                  'wIeTnWavny_jrLexsG_BvuiydWenoL_5pwlza4yG_fi7c6oenC',
                  width: 48.0,
                  height: 48.0,
                ),
                onPressed: _togglePlay,
              ),
            ),
          ),

          /// Controls
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: _playControls(),
          ),
        ],
      ),
    );
  }

  Widget _playControls() {
    final paddingBottom = MediaQuery.of(context).viewPadding.bottom;
    final bottom = paddingBottom == 0 ? 5.0 : paddingBottom;
    return AnimatedOpacity(
      opacity: _isControlShowing ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      onEnd: () {
        if (_isControlVisible != _isControlShowing) {
          _isControlVisible = _isControlShowing;
          Utils.callSetStateSafely(this, () {});
        }
      },
      child: Visibility(
        visible: _isControlVisible,
        child: Container(
          height: 40.0 + bottom,
          padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, bottom),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [AppColor.black_40p, AppColor.transparent],
            ),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Expanded(
                flex: 0,
                child: SizedBox(width: 1,),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: AppColor.color_0dcccc,
                  // margin: const EdgeInsets.symmetric(horizontal: 12),
                  child: _playControlProgressBar(),
                ),
              ),
              Expanded(
                flex: 0,
                child: _playControlRightDurationClose(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _initializePlay() {
    _playController = !Utils.isEmptyString(widget.filePath)
        ? VideoPlayerController.file(File(widget.filePath!))
        : VideoPlayerController.networkUrl(Uri.parse(widget.netPath!));
    _playController!.initialize().then((_) {
      _isInitialized = true;
      if (_playAfterInitialized) {
        _listenPlay();
        _togglePlay();
      }
      Utils.callSetStateSafely(this, () {});
    });
  }

  _playControlRightDurationClose() {
    return Row(
      children: <Widget>[
        // Text(
        //   StringUtils.formatDuration(_playerValue?.duration ?? Duration()),
        //   style: AppTextStyle.style(
        //     color: Colors.white,
        //     fontSize: 14.0,
        //     fontWeight: FontWeight.w500,
        //   ),
        // ),
        // AppGap.hGap2,
        CupertinoButton(
          minSize: 30.0,
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: ImageLoader.loadLocalImage('chat/woeYnAaRnq_arEeVsb_JpEaElSaj_qdfrXaRwfasbvl1ea_IikcU_lcfl2oxsJeR',width: 20,height: 20,color: AppColor.white),
          onPressed: () => FluroRouter.appRouter.pop(context),
        ),
      ],
    );
  }

  _playControlProgressBar() {
    final position = _playerValue?.position.inMilliseconds ?? 0;
    final duration = _playerValue?.duration.inMilliseconds ?? 0;
    return ProgressBar(
      baseBarColor: AppColor.white,
      progressBarColor: AppColor.color_ffff4d,
      progress: Duration(milliseconds: position),
      thumbColor: AppColor.color_ffff4d,
      timeLabelLocation: TimeLabelLocation.sides,
      timeLabelTextStyle: AppTextStyle.style(
        color: Colors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
      // thumbGlowColor: AppColor.color_ffff4d,
      // buffered: Duration(milliseconds: 2000),
      total: Duration(milliseconds: duration),
      onSeek: (duration) {
        AuvChatLog.d('User selected a new time: $duration');
        _playController?.seekTo(duration);
      },
    );
  }

  _toggleControlVisible() {
    _isControlShowing = !_isControlShowing;
    if (_isControlShowing) _isControlVisible = true;
    Utils.callSetStateSafely(this, () {});

    if (_isControlShowing) {
      _startToggleControlVisibleTimerIfNeed();
    } else {
      _stopToggleControlVisibleTimerIfNeed();
    }
  }

  _listenPlay() {
    if (_isListenerAdded) return;
    _isListenerAdded = true;
    _playController?.addListener(() {
      Utils.callSetStateSafely(this, () {});
    });
  }



  _startToggleControlVisibleTimerIfNeed() {
    _stopToggleControlVisibleTimerIfNeed();
    if (_isControlShowing && _isPlaying) {
      _toggleControlTimer = Timer(const Duration(seconds: 4), _toggleControlVisible);
    }
  }


  _togglePlay() {
    if (_isPlaying) {
      _playController?.pause();
      _stopToggleControlVisibleTimerIfNeed();
    } else {
      if (_playerValue?.position == _playerValue?.duration) {
        _playController?.seekTo(Duration(milliseconds: 0));
      }
      if (_isInitialized) {
        _listenPlay();
        _playController?.play();
      } else {
        _playAfterInitialized = true;
      }
      _startToggleControlVisibleTimerIfNeed();
    }
  }

  _stopToggleControlVisibleTimerIfNeed() {
    if (_toggleControlTimer != null && _toggleControlTimer!.isActive) {
      _toggleControlTimer?.cancel();
    }
    _toggleControlTimer = null;
  }

}
