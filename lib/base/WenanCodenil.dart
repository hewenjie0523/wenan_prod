import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

/// A [Nil] instance, you can use in your layouts.
const nil = Nil();

/// A widget which is not in the layout and does nothing.
/// It is useful when you have to return a widget and can't return null.
/// Warning
// This widget is not intended to be used in widgets accepting multiple children (e.g. Rows, Columns, etc.). The best option is to not add a widget in the list if you don't want it to be displayed. Moreover using a Nil widget in such a case, can have unexpected results.
/// 不要在Rows, Columns等多子控件中作为child使用
class Nil extends Widget {
  /// Creates a [Nil] widget.
  const Nil({Key? key}) : super(key: key);

  @override
  Element createElement() => _NilElement(this);
}

class _NilElement extends Element {
  _NilElement(Nil widget) : super(widget);

  @override
  void mount(Element? parent, dynamic newSlot) {
    assert(parent is! MultiChildRenderObjectElement, """
        You are using Nil under a MultiChildRenderObjectElement.
        This suggests a possibility that the Nil is not needed or is being used improperly.
        Make sure it can't be replaced with an inline conditional or
        omission of the target widget from a list.
        """);

    super.mount(parent, newSlot);
  }

  @override
  bool get debugDoingBuild => false;

  @override
  void performRebuild() {}
}