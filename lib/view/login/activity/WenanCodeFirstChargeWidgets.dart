import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/res/WenanCodestyles.dart';
import 'package:intl/intl.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

class TimeCounter extends StatefulWidget {
  Color? color;
  String? prefix;
  TimeCounter({super.key, this.color, this.prefix = ""});

  @override
  _TimeCounterState createState() => _TimeCounterState();
}

class _TimeCounterState extends State<TimeCounter> {
  Timer? _timer;
  static const int DAY_IN_MILLS = 24 * 60 * 60 * 1000;
  int _duration = DAY_IN_MILLS - 1000;

  @override
  void initState() {
    _updateDuration();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Utils.callSetStateSafely(this, () {
        _updateDuration();
      });
    });
    super.initState();
  }

  void _updateDuration() {
    int now = DateTime.now().millisecondsSinceEpoch;
    _duration = SpHelper.getFirstChargeEndTime() - now;
    if (_duration <= 0) {
      SpHelper.setFirstChargeEndTime(now + DAY_IN_MILLS);
      _duration = DAY_IN_MILLS - 1000;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.prefix}${formatMilliseconds(_duration)}",
      style: AppTextStyle.style(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: AppColor.b1
      ),
    );
  }

  String formatMilliseconds(int milliseconds) {
    if (milliseconds <= 0) {
      return "";
    }
    Duration duration = Duration(milliseconds: milliseconds);
    DateFormat formatter = DateFormat('HH:mm:ss');
    return formatter.format(DateTime(0).add(duration));
  }
}

class BgVideoView extends StatefulWidget {
  final String netPath;

  const BgVideoView({
    Key? key,
    required this.netPath,
  }) : super(key: key);

  @override
  _BgVideoViewState createState() => _BgVideoViewState();
}

class _BgVideoViewState extends State<BgVideoView> {
  VideoPlayerController? _playController;

  @override
  void dispose() {
    AuvChatLog.d('[MediaVideoView_Log] dispose $this');
    _playController?.dispose();
    _playController = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _createPlay();
  }


  _createPlay() {
    _playController = VideoPlayerController.networkUrl(Uri.parse(widget.netPath));
    _playController!.initialize().then((_) {
      // _isInitialized = true;
      _playController?.setVolume(0);
      _playController?.setLooping(true);
      _playController?.play();
      Utils.callSetStateSafely(this, () {});
    });
  }

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d('[MediaVideoView_Log] build $this');
    return AspectRatio(
      aspectRatio: (334 - 12) / (596 - 12),
      child: _playController == null ? Container() : VideoPlayer(_playController!),
    );
  }

}
