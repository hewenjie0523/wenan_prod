import 'package:audioplayers/audioplayers.dart';

class AuvAudioPlayerManager {
  AudioPlayer? audioPlayer;
  // AudioCache is deprecated; use AssetSource with a shared AudioPlayer
  String? audioUrl;

  static AuvAudioPlayerManager? _instance;

  static AuvAudioPlayerManager get instance => _getInstance();

  factory AuvAudioPlayerManager() => _getInstance();

  AuvAudioPlayerManager._internal() {
    //初始化
    audioPlayer = AudioPlayer();
  }

  static AuvAudioPlayerManager _getInstance() {
    return _instance ??= AuvAudioPlayerManager._internal();
  }

  startPlayAudio(String url, {bool isLocal = false}) async {
    audioUrl = url;
    if (isLocal) {
      await audioPlayer?.play(DeviceFileSource(url));
    } else {
      await audioPlayer?.play(UrlSource(url));
    }
  }

  Future<void> startPlayAssertAudio(String fileName, {bool loop = false}) async {
    await audioPlayer?.setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.release);
    await audioPlayer?.play(AssetSource(fileName));
  }

  stopPlayAudio() async {
    audioUrl = null;
    await audioPlayer?.stop();
  }

  bool isPlaying() {
    return audioPlayer?.state == PlayerState.playing;
  }

  cancelPlayAudio() async {
    if (audioPlayer != null && audioPlayer!.state == PlayerState.playing) {
      await audioPlayer!.pause();
    }
    await stopPlayAudio();
  }

  pausePlayAudio() async {
    await audioPlayer?.pause();
  }

  destory() {
    cancelPlayAudio();
  }
}
