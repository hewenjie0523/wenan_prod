import 'package:agora_rtc_engine/agora_rtc_engine.dart';

abstract class CallEventHandler {
  ///
  /// Reports an error during SDK runtime.
  /// This callback indicates that an error (concerning network or media) occurs during SDK runtime. In most cases, the SDK cannot fix the issue and resume running. The SDK requires the application to take action or informs the user about the issue. For example, the SDK reports an ERR_START_CALL error when failing to initialize a call. The app informs the user that the call initialization failed and calls leaveChannel to leave the channel.
  ///
  /// Param [err] The error code.
  ///
  void onError(ErrorCodeType err);

  ///
  /// Occurs when a remote user (COMMUNICATION)/ host (LIVE_BROADCASTING) joins the channel.
  /// In a communication channel, this callback indicates that a remote user joins the channel. The SDK also triggers this callback to report the existing users in the channel when a user joins the channel.
  /// In a live-broadcast channel, this callback indicates that a host joins the channel. The SDK also triggers this callback to report the existing hosts in the channel when a host joins the channel. Agora recommends limiting the number of hosts to 17.
  ///
  ///   The SDK triggers this callback under one of the following circumstances:
  /// A remote user/host joins the channel by calling the joinChannel method.
  /// A remote user switches the user role to the host after joining the channel.
  /// A remote user/host rejoins the channel after a network interruption.
  ///
  /// Param [uid] The ID of the user or host who joins the channel.
  ///
  /// Param [elapsed] Time delay (ms) from the local user calling joinChannel
  /// until this callback is triggered.
  ///
  void onUserJoined(int uid, int elapsed);

  ///
  /// Occurs when a user leaves a channel.
  /// This callback notifies the app that the user leaves the channel by calling leaveChannel. From this callback, the app can get information such as the call duration and quality statistics.
  ///
  /// Param [stats] The statistics of the call, see RtcStats .
  ///
  void onLeaveChannel(RtcStats stats);

  ///
  /// Reports the last-mile network quality of the local user once every two seconds.
  /// This callback reports the last-mile network conditions of the local user before the user joins the channel. Last mile refers to the connection between the local device and Agora's edge server.
  /// Before the user joins the channel, this callback is triggered by the SDK once startLastmileProbeTest is called and reports the last-mile network conditions of the local user.
  ///
  /// Param [quality] The last mile network quality.
  /// Unknown (0): The quality is unknown.
  /// Excellent (1): The quality is excellent.
  /// Good (2): The network quality seems excellent, but the bitrate can be slightly lower than excellent.
  /// Poor (3): Users can feel the communication is slightly impaired.
  /// Bad (4): Users cannot communicate smoothly.
  /// VBad (5): The quality is so bad that users can barely communicate.
  /// Down (6): The network is down, and users cannot communicate at all.
  ///
  /// See
  /// NetworkQuality.
  ///
  void onLastmileQuality(QualityType quality);

  ///
  /// Reports the last mile network quality of each user in the channel.
  /// This callback reports the last mile network conditions of each user in the channel. Last mile refers to the connection between the local device and Agora's edge server.
  /// The SDK triggers this callback once every two seconds. If a channel includes multiple users, the SDK triggers this callback as many times.
  ///
  /// Param [uid] User ID. The network quality of the user with this user ID is
  /// reported.
  ///
  ///
  /// Param [txQuality] Uplink network quality rating of the user in terms of the transmission bit
  /// rate, packet loss rate, average RTT (Round-Trip Time) and jitter of the
  /// uplink network. This parameter is a quality rating helping you understand
  /// how well the current uplink network conditions can support the selected
  /// video encoder configuration. For example, a 1000 Kbps uplink network may be
  /// adequate for video frames with a resolution of 640 × 480 and a frame rate of
  /// 15 fps in the LIVE_BROADCASTING profile, but might be inadequate for
  /// resolutions higher than 1280 × 720.
  /// Unknown (0): The quality is unknown.
  /// Excellent (1): The quality is excellent.
  /// Good (2): The network quality seems excellent, but the bitrate can be slightly lower than excellent.
  /// Poor (3): Users can feel the communication is slightly impaired.
  /// Bad (4): Users cannot communicate smoothly.
  /// VBad (5): The quality is so bad that users can barely communicate.
  /// Down (6): The network is down, and users cannot communicate at all.
  ///
  ///
  ///
  /// Param [rxQuality] Downlink network quality rating of the user in terms of packet loss rate,
  /// average RTT, and jitter of the downlink network.
  /// Unknown (0): The quality is unknown.
  /// Excellent (1): The quality is excellent.
  /// Good (2): The network quality seems excellent, but the bitrate can be slightly lower than excellent.
  /// Poor (3): Users can feel the communication is slightly impaired.
  /// Bad (4): Users cannot communicate smoothly.
  /// VBad (5): The quality is so bad that users can barely communicate.
  /// Down (6): The network is down, and users cannot communicate at all.
  ///
  ///
  ///
  void onNetworkQuality(
      int uid, QualityType txQuality, QualityType rxQuality);

  ///
  /// Reports the last mile network probe result.
  /// The SDK triggers this callback within 30 seconds after the app calls startLastmileProbeTest.
  ///
  /// Param [result] The uplink and downlink last-mile network probe test result. For details,
  /// see LastmileProbeResult.
  ///
  void onLastmileProbeResult(LastmileProbeResult result);

  ///
  /// Occurs when the remote video state changes.
  /// This callback does not work properly when the number of users (in the voice/video call channel) or hosts (in the live streaming channel) in the channel exceeds 17.
  ///
  /// Param [uid] The ID of the remote user whose video state changes.
  ///
  /// Param [state]  The state of the remote video, see
  /// VideoRemoteState.
  ///
  /// Param [reason]  The reason for the remote video state
  /// change, see VideoRemoteStateReason.
  ///
  /// Param [elapsed] Time elapsed (ms) from the local user calling the joinChannel method until the SDK triggers this
  /// callback.
  ///
  void onRemoteVideoStateChanged(int uid, RemoteVideoState state,
      RemoteVideoStateReason reason, int elapsed);

  ///
  /// Occurs when the local video stream state changes.
  /// When the state of the local video stream changes (including the state of the video capture and encoding), the SDK triggers this callback to report the current state. This callback indicates the state of the local video stream, including camera capturing and video encoding, and allows you to troubleshoot issues when exceptions occur.
  /// The SDK triggers the localVideoStateChanged callback with the state code Failed and error code CaptureFailure in the following situations:
  /// The app switches to the background, and the system gets the camera resource.
  /// The camera starts normally, but does not output video for four consecutive seconds.
  ///
  /// When the camera outputs the captured video frames, if the video frames are the same for 15 consecutive frames, the SDK triggers the localVideoStateChanged callback with the state code Capturing and error code CaptureFailure. Note that the video frame duplication detection is only available for video frames with a resolution greater than 200 × 200, a frame rate greater than or equal to 10 fps, and a bitrate less than 20 Kbps.
  /// For some device models, the SDK does not trigger this callback when the state of the local video changes while the local video capturing device is in use, so you have to make your own timeout judgment.
  ///
  /// Param [localVideoState] The state of the local video, see LocalVideoStreamState.
  ///
  ///
  /// Param [error] The detailed error information, see LocalVideoStreamError.
  ///
  ///
  void onLocalVideoStateChanged(
      LocalVideoStreamState localVideoState, LocalVideoStreamReason reason);

  ///
  /// Occurs when the remote audio state changes.
  /// When the audio state of a remote user (in the voice/video call channel) or host (in the live streaming channel) changes, the SDK triggers this callback to report the current state of the remote audio stream.
  /// This callback does not work properly when the number of users (in the voice/video call channel) or hosts (in the live streaming channel) in the channel exceeds 17.
  ///
  /// Param [uid] The ID of the remote user whose audio state changes.
  ///
  /// Param [state] The state of the remote audio, see AudioRemoteState.
  ///
  /// Param [reason] The reason of the remote audio state change, see AudioRemoteStateReason.
  ///
  /// Param [elapsed] Time elapsed (ms) from the local user calling the joinChannel method until the SDK triggers this callback.
  ///
  void onRemoteAudioStateChanged(int uid, RemoteAudioState state,
      RemoteAudioStateReason reason, int elapsed);

  ///
  /// Occurs when the local audio stream state changes.
  /// When the state of the local audio stream changes (including the state of the audio capture and encoding), the SDK triggers this callback to report the current state. This callback indicates the state of the local audio stream, and allows you to troubleshoot issues when audio exceptions occur.
  /// When the state isFailed (3), you can view the error information in the error parameter.
  ///
  /// Param [state] The state of the local audio. For details, see AudioLocalState.
  ///
  /// Param [error] Local audio state error codes. For details, see AudioLocalError.
  ///
  void onLocalAudioStateChanged(LocalAudioStreamState state, LocalAudioStreamReason reason);
}
