

import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../utils/WenanCodeutils.dart';

class WaterRader extends StatefulWidget {

  final Color waterColor;

  const WaterRader({Key? key, required this.waterColor}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WaterRaderState();
}

class _WaterRaderState extends State<WaterRader>
    with TickerProviderStateMixin, WidgetsBindingObserver {

  final List<AnimationController> _controllers = [];
  final List<Widget> _children = [];
  Timer? _searchBluetoothTimer;

  double sizeWidth = 600;

  @override
  Widget build(BuildContext context) {
    sizeWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: sizeWidth,
      height: sizeWidth,
      child: Stack(
        alignment: Alignment.center,
        children: _children,
      ),
    );
  }

  void _startAnimation() {
    //动画启动前确保_children控件总数为0
    _children.clear();
    int count = 0;
    //添加第一个圆形缩放动画
    _addSearchAnimation(true);
    //以后每隔1秒，再次添加一个缩放动画，总共添加4个
    _searchBluetoothTimer =
        Timer.periodic(const Duration(milliseconds: 1000), (timer) {
          if (!mounted) {
            timer.cancel();
            return;
          }
          _addSearchAnimation(true);
          count++;
          if (count >= 4) {
            timer.cancel();
          }
        });
  }

  void _addSearchAnimation(bool init) {
    var controller = _createController();
    _controllers.add(controller);
    var animation = Tween(begin: 50.0, end: sizeWidth)
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));


    if (!init) {
      _children.removeAt(0);
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;

        _children.add(AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) {
              return Opacity(
                opacity:  ((sizeWidth - animation.value) / sizeWidth) < 0 ? 0 :  ((sizeWidth - animation.value) / sizeWidth) ,
                child: ClipOval(
                  child: Container(
                    width: animation.value,
                    height: animation.value,
                    color: widget.waterColor,
                  ),
                ),
              );
            }));
        try {
          controller.forward();
          Utils.callSetStateSafely(this, () {});
        } catch (e) {
          return;
        }
      });
    } else {
      _children.add(AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: (1.0 - ((animation.value - 50.0) / sizeWidth)) < 0 ? 0 : (1.0 - ((animation.value - 50.0) / sizeWidth)),
              child: ClipOval(
                child: Container(
                  width: animation.value,
                  height: animation.value,
                  color: widget.waterColor,
                ),
              ),
            );
          }));
      controller.forward();
      Utils.callSetStateSafely(this, () {});
    }
  }

  AnimationController _createController() {
    var controller = AnimationController(
        duration: const Duration(milliseconds: 4000), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
        if (_controllers.contains(controller)) {
          _controllers.remove(controller);
        }
        if (mounted) _addSearchAnimation(false);
      }
    });
    return controller;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      _disposeSearchAnimation();
    } else if (state == AppLifecycleState.resumed) {
      _startAnimation();
    }
  }

  void _disposeSearchAnimation() {
    //释放动画所有controller
    for (var element in _controllers) {
      element.dispose();
    }
    _controllers.clear();
    _searchBluetoothTimer?.cancel();
    _children.clear();
  }

  @override
  void initState() {
    super.initState();
    _startAnimation();
    //添加应用生命周期监听
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    _disposeSearchAnimation();
    //销毁应用生命周期观察者
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}