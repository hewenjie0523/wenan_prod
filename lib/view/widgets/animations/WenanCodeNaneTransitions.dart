

import 'package:flutter/widgets.dart';

enum WenanScaleType{
  ALL,X,Y
}

class WenanScaleTransition extends AnimatedWidget {
  /// Creates a scale transition.
  ///
  /// The [scale] argument must not be null. The [alignment] argument defaults
  /// to [Alignment.center].
  const WenanScaleTransition({
    Key? key,
    required Animation<double> scale,
    this.alignment = Alignment.center,
    this.filterQuality,
    this.child,
    this.scaleType = WenanScaleType.ALL
  }) : assert(scale != null),
        super(key: key, listenable: scale);

  /// The animation that controls the scale of the child.
  ///
  /// If the current value of the scale animation is v, the child will be
  /// painted v times its normal size.
  Animation<double> get scale => listenable as Animation<double>;

  /// The alignment of the origin of the coordinate system in which the scale
  /// takes place, relative to the size of the box.
  ///
  /// For example, to set the origin of the scale to bottom middle, you can use
  /// an alignment of (0.0, 1.0).
  final Alignment alignment;

  /// The filter quality with which to apply the transform as a bitmap operation.
  ///
  /// {@macro flutter.widgets.Transform.optional.FilterQuality}
  final FilterQuality? filterQuality;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  final WenanScaleType scaleType;

  @override
  Widget build(BuildContext context) {
    Transform result;
    switch(scaleType){
      case WenanScaleType.ALL:
        result = Transform.scale(
          scale: scale.value,
          alignment: alignment,
          filterQuality: filterQuality,
          child: child,
        );
        break;
      case WenanScaleType.X:
        result = Transform.scale(
          scaleX: scale.value,
          alignment: alignment,
          filterQuality: filterQuality,
          child: child,
        );
        break;
      case WenanScaleType.Y:
        result = Transform.scale(
          scaleY: scale.value,
          alignment: alignment,
          filterQuality: filterQuality,
          child: child,
        );
        break;
    }
    return result;
  }
}