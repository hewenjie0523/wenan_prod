import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import '../../utils/WenanCodelog.dart';
import '../../utils/WenanCodeutils.dart';

class MatchBgVideoView extends StatefulWidget {
  final String netPath;

  const MatchBgVideoView({
    Key? key,
    required this.netPath,
  }) : super(key: key);

  @override
  _MatchBgVideoViewState createState() => _MatchBgVideoViewState();
}

class _MatchBgVideoViewState extends State<MatchBgVideoView> {
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
    AuvChatLog.d('[MediaVideoView_Log] initState $this');
    _initializePlay();
    super.initState();
  }

  @override
  void didUpdateWidget(MatchBgVideoView oldWidget) {
    AuvChatLog.d('[MediaVideoView_Log] didUpdateWidget $this');
    _playController?.dispose();
    _playController = null;
    Future.delayed(Duration.zero,(){
      _initializePlay();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d('[MediaVideoView_Log] build ${_playController==null?"_playController loading":widget.netPath==_playController?.dataSource}');
    return AspectRatio(
      aspectRatio: 112 / 170,
      child:
          _playController == null ? Container() : ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: VideoPlayer(_playController!),
          ),
    );
  }

  _initializePlay() {
    AuvChatLog.d('[MediaVideoView_Log] _initializePlay ${widget.netPath}');
    _playController = VideoPlayerController.networkUrl(Uri.parse(widget.netPath));
    _playController!.initialize().then((_) {
      // _isInitialized = true;
      _playController?.setVolume(0);
      _playController?.setLooping(true);
      _playController?.play();
      Utils.callSetStateSafely(this, () {});
    },onError:(_){
      AuvChatLog.d('[MediaVideoView_Log] _initializePlay onError ${widget.netPath}');
    });
  }

}
