import 'package:flutter/cupertino.dart';

abstract class AuvState<T extends StatefulWidget> extends State<T> {
  bool disposed = false;
  bool inited = false;

  setStateSafely(VoidCallback fn) {
    if (mounted && !disposed) setState(fn);
  }
  @override
  void initState() {
    super.initState();
    inited = true;
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }
}