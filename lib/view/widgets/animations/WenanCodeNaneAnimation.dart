import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wenan/base/WenanCodenil.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/view/widgets/animations/WenanCodeNaneTransitions.dart';

class WenanAlphaAnimation extends StatefulWidget {
  WenanAlphaAnimation(
      {Key? key,
      required this.child,
      this.alphaStart = 0,
      this.alphaEnd = 1,
      this.repeat = false,
      this.duration = const Duration(seconds: 1)})
      : super(key: key);

  Widget child;
  double alphaStart;
  double alphaEnd;
  bool repeat;
  Duration duration;

  @override
  State<WenanAlphaAnimation> createState() => _WenanAlphaAnimationState();
}

class _WenanAlphaAnimationState extends State<WenanAlphaAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: widget.duration);
    _animation = Tween(begin: widget.alphaStart, end: widget.alphaEnd)
        .animate(CurvedAnimation(parent: _animationController,curve: Curves.linear));
    if (widget.repeat) {
      _animationController.repeat();
    } else {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuvChatLog.d("_PalaAlphaAnimationState,build:");
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (BuildContext ctx, child) {
        // AuvChatLog.d("AnimatedBuilder:_animation.value=${_animation.value},_animationController.value=${_animationController.value},");
        return Opacity(
          opacity: _animation.value,
          child: child,
        );
      },
    );
  }
}

class MarqueeTextAnimation extends StatefulWidget {
  MarqueeTextAnimation(
      {Key? key,
        required this.textStyle,
        required this.texts,
        this.duration = const Duration(seconds: 1)})
      : super(key: key);

  TextStyle textStyle;
  List<String> texts;
  Duration duration;

  @override
  State<MarqueeTextAnimation> createState() => _MarqueeTextAnimationState();
}

class _MarqueeTextAnimationState extends State<MarqueeTextAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: widget.duration);
    _animation = IntTween(begin: 0, end: widget.texts.length-1)
        .animate(_animationController);
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: nil,
      builder: (BuildContext ctx, child) {
        return Text(
          widget.texts[_animation.value],
          style: widget.textStyle,
        );
      },
    );
  }
}

//给子widget设定一组交织动画
class EasyAnimationBuilder{
  Widget child;
  List<PropertyAnimation> animations = [];
  Duration duration = const Duration(seconds: 1);

  EasyAnimationBuilder._(this.child);
  static EasyAnimationBuilder animate(Widget child){
    return EasyAnimationBuilder._(child);
  }

  _increaseDurationIfNeed(Duration animateDuration,Duration startDelay){
    if(animateDuration.inMilliseconds+startDelay.inMilliseconds>duration.inMilliseconds){
      duration = Duration(milliseconds: animateDuration.inMilliseconds+startDelay.inMilliseconds);
    }
  }

  EasyAnimationBuilder alpha(List<double> alphaValues,{Duration duration = const Duration(seconds: 1),Curve curve = Curves.linear,Duration startDelay =const Duration(milliseconds: 0)}){
    animations.add(PropertyAnimation<double>(AnimationProperty.alpha, alphaValues, duration, curve));
    _increaseDurationIfNeed(duration,startDelay);
    return this;
  }

  EasyAnimationBuilder scale(List<double> scaleValues,{Duration duration = const Duration(seconds: 1),Curve curve = Curves.linear,Duration startDelay =const Duration(milliseconds: 0)}){
    animations.add(PropertyAnimation<double>(AnimationProperty.scale, scaleValues, duration, curve));
    _increaseDurationIfNeed(duration,startDelay);
    return this;
  }

  EasyAnimationBuilder scaleX(List<double> scaleValues,{Duration duration = const Duration(seconds: 1),Curve curve = Curves.linear,Duration startDelay =const Duration(milliseconds: 0)}){
    animations.add(PropertyAnimation<double>(AnimationProperty.scaleX, scaleValues, duration, curve));
    _increaseDurationIfNeed(duration,startDelay);
    return this;
  }

  EasyAnimationBuilder scaleY(List<double> scaleValues,{Duration duration = const Duration(seconds: 1),Curve curve = Curves.linear,Duration startDelay =const Duration(milliseconds: 0)}){
    animations.add(PropertyAnimation<double>(AnimationProperty.scaleY, scaleValues, duration, curve));
    _increaseDurationIfNeed(duration,startDelay);
    return this;
  }

  EasyAnimationBuilder translate(List<Offset> translateValues,{Duration duration = const Duration(seconds: 1),Curve curve = Curves.linear,Duration startDelay =const Duration(milliseconds: 0)}){
    animations.add(PropertyAnimation<Offset>(AnimationProperty.translation, translateValues, duration, curve));
    _increaseDurationIfNeed(duration,startDelay);
    return this;
  }

  EasyAnimationBuilder rotation(List<double> rotationValues,{Duration duration = const Duration(seconds: 1),Curve curve = Curves.linear,Duration startDelay =const Duration(milliseconds: 0)}){
    animations.add(PropertyAnimation<double>(AnimationProperty.rotation, rotationValues, duration, curve));
    _increaseDurationIfNeed(duration,startDelay);
    return this;
  }

  Widget build({int repeatTime=1}){
    return EasyAnimation(child: child,animations:animations,duration:duration,repeatTime:repeatTime);
  }
}

enum AnimationProperty{
  alpha,scale,scaleX,scaleY,translation,rotation
}

class PropertyAnimation<T>{
  AnimationProperty propertyName;
  List<T> values;
  Duration duration;
  Curve curve;
  //在整个交织动画时间线里的开始时间
  Duration startTime;

  Animation<T>? _animation;
  AnimationController? animationController;

  initAnimation(AnimationController animationController){
    this.animationController = animationController;
    // AuvChatLog.d("initAnimation:${describeIdentity(this)},",tag: "PalaAnimation");
    List<TweenSequenceItem<T>> tweens = [];
    for (int i =0;i<values.length-1;i++) {
      tweens.add(TweenSequenceItem<T>(tween: Tween(begin: values[i],end: values[i+1]), weight: 100.0/values.length));
    }
    _animation = TweenSequence(tweens).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(startTime.inMilliseconds/animationController.duration!.inMilliseconds,(startTime.inMilliseconds+duration.inMilliseconds)/animationController.duration!.inMilliseconds),
        )
    );
  }

  Widget buildAnimationWidget(Widget child){
    // AuvChatLog.d("buildAnimationWidget:${describeIdentity(this)},$_animation,$animationController",tag: "PalaAnimation");
    Widget result = Container();
    switch(propertyName){
      case AnimationProperty.alpha:
        result = FadeTransition(opacity: _animation as Animation<double>,child: child,);
        break;
      case AnimationProperty.scale:
        result = ScaleTransition(scale: _animation as Animation<double>,child: child,);
        break;
      case AnimationProperty.scaleX:
        result = WenanScaleTransition(scale: _animation as Animation<double>,scaleType: WenanScaleType.X,);
        break;
      case AnimationProperty.scaleY:
        result = WenanScaleTransition(scale: _animation as Animation<double>,scaleType: WenanScaleType.Y,);
        break;
      case AnimationProperty.translation:
        result = SlideTransition(position: _animation as Animation<Offset>,child: child,);
        break;
      case AnimationProperty.rotation:
        result = RotationTransition(turns: _animation as Animation<double>,child: child,);
        break;
    }
    return result;
  }

  PropertyAnimation(this.propertyName, this.values, this.duration, this.curve,{this.startTime = const Duration(milliseconds: 0)});


}

class EasyAnimation extends StatefulWidget {
  EasyAnimation(
      {Key? key,
        required this.child,
        required this.animations,
        required this.duration,
        required this.repeatTime,
       })
      : super(key: key);

  Widget child;
  final List<PropertyAnimation> animations;
  bool animationInited = false;
  Duration duration = const Duration(seconds: 1);
  int repeatTime;

  @override
  State<EasyAnimation> createState() => _EasyAnimationState();
}

class _EasyAnimationState extends State<EasyAnimation>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  var animatedTimes = 0;
  late List<PropertyAnimation> animations;

  @override
  void initState() {
    // TODO: implement initState
    AuvChatLog.d("_EasyAnimationState init:${describeIdentity(this)},${widget.animations.length}");
    super.initState();
    animations = widget.animations;
    _animationController = AnimationController(vsync: this,duration: widget.duration);
    _animationController.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        animatedTimes++;
        if(animatedTimes<widget.repeatTime){
          _animationController.forward(from: 0);
        }
      }
    });
    for(var elem in animations){
      elem.initAnimation(_animationController);
    }
    if (widget.repeatTime==-1) {
      _animationController.repeat();
    } else {
      _animationController.forward();
    }
    widget.animationInited = true;
  }

  @override
  void dispose() {
    AuvChatLog.d("_EasyAnimationState dispose:${describeIdentity(this)}");
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, child) {
    // AuvChatLog.d("_EasyAnimationState _buildAnimation:${describeIdentity(animations)},${animations.length},${widget.animationInited}");
    Widget wrappedChild = child;
    for(var elem in animations){
      wrappedChild = elem.buildAnimationWidget(wrappedChild);
    }
    return wrappedChild;
  }

  @override
  Widget build(BuildContext context) {
    // AuvChatLog.d("_EasyAnimationState build:${describeIdentity(animations)},${animations.length},${widget.animationInited}");
    return AnimatedBuilder(
      animation: _animationController,
      child: widget.child,
      builder: _buildAnimation,
    );
  }
}
