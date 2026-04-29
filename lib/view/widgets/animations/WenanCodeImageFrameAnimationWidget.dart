import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';

class ImageFrameAnimationWidget extends StatefulWidget {
  final double width;
  final double height;
  final bool autoStart;
  final int intervalMilliseconds; // in milliseconds
  final Duration? reverseDuration;
  final List<String> imageURLs;

  const ImageFrameAnimationWidget({
    Key? key,
    required this.width,
    required this.height,
    this.autoStart = true,
    this.intervalMilliseconds = 200,
    this.reverseDuration,
    required this.imageURLs,
  })  : assert(intervalMilliseconds > 0),
        super(key: key);

  @override
  _ImageFrameAnimationWidgetState createState() =>
      _ImageFrameAnimationWidgetState();
}

class _ImageFrameAnimationWidgetState extends State<ImageFrameAnimationWidget>
    with SingleTickerProviderStateMixin,WidgetsBindingObserver {
  // 动画控制
  late Animation<int> _animation;
  late AnimationController _controller;

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final int imageCount = widget.imageURLs.length;
    final int maxTime = widget.intervalMilliseconds * imageCount;

    // 启动动画controller
    _controller = AnimationController(
      duration: Duration(milliseconds: maxTime),
      vsync: this,
    );
    _animation = IntTween(begin: 0, end: imageCount - 1).animate(_controller);
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        if (widget.reverseDuration == null ||
            widget.reverseDuration == const Duration()) {
          _controller.forward(from: 0.0);
        } else {
          _timer = Timer(widget.reverseDuration!, () {
            _timer = null;
            _controller.forward(from: 0.0);
          });
        }
      }
    });
    if (widget.autoStart) _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initFu = _preloadImages();
      Utils.callSetStateSafely(this, () { });
    });
  }

 Future _preloadImages() async{
   for(String url in widget.imageURLs){
     await precacheImage(
         AssetImage('assets/images/$url.png'),
         context);
   }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {

    //进入应用时候不会触发该状态 应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume
    case AppLifecycleState.resumed:
        if (!_controller.isAnimating) _controller.forward();
        break;
      case AppLifecycleState.detached:
        AuvChatLog.d("当前页面即将退出======");
        _timer?.cancel();
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        if (_controller.isAnimating) _controller.stop();
        break;
    }
  }

  Future? initFu;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: initFu,
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.done) {
            return AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return loadImage(
                  widget.imageURLs[_animation.value],
                  widget.width,
                  widget.height,
                );
              },
            );
          } else {
            return loadImage(
              widget.imageURLs[0],
              widget.width,
              widget.height,
            );
          }


        });
  }

  void stopAnimation() {
    _controller.stop();
  }


  void startAnimation() {
    _controller.forward();
  }

  void reStartAnimation() {
    _controller.reset();
    _controller.forward();
  }

  Widget loadImage(String imageUrl, double width, double height) {
    return imageUrl.startsWith("http")
        ? Container(
            width: width,
            height: height,
            color: AppColor.black_10p,
            child: Image.network(
              imageUrl,
              width: width,
              height: height,
              fit: BoxFit.cover,
              gaplessPlayback: true,
            ),
          )
        : ImageLoader.loadLocalImage(
            imageUrl,
            width: width,
            height: height,
            // gaplessPlayback: true,
          );
  }

}
