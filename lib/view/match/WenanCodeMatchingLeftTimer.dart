



import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodestyles.dart';
import '../../utils/WenanCodeutils.dart';

class ReqTimeCounter extends StatefulWidget {
  const ReqTimeCounter({super.key});

  @override
  _ReqTimeCounterState createState() => _ReqTimeCounterState();
}

class _ReqTimeCounterState extends State<ReqTimeCounter> {
  Timer? _timer;
  int _seconds = 0;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      Utils.callSetStateSafely(this, () {
        if (_seconds >= 30) {
          _timer?.cancel();
        } else {
          _seconds++;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text("${_seconds}s",
        style: AppTextStyle.style(
            color: AppColor.white, fontSize: 36, fontWeight: FontWeight.bold));
  }
}
