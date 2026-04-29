import 'package:flutter/cupertino.dart';
import 'package:wenan/view/WenanCodeSharedViewLogic.dart';

import '../../res/WenanCodecolors.dart';
import '../../utils/WenanCodeimage_loader.dart';
import '../../utils/WenanCodelog.dart';
import '../../utils/WenanCodeutils.dart';

typedef OnTapCallback = void Function();

class CallDurationTimer extends StatefulWidget {
  final OnTapCallback onHangup;

  const CallDurationTimer(this.onHangup, {Key? key}) : super(key: key);

  @override
  State<CallDurationTimer> createState() => CallDurationTimerState();
}

class CallDurationTimerState extends State<CallDurationTimer> {
  String callDurationString = "00:00";

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            callDurationString,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, color: AppColor.white),
          ),
        ),
        _rejectWidget()
      ],
    );
  }

  void updateTimeString(String timeString) {
    Utils.callSetStateSafely(this, () {
      callDurationString = timeString;
    });
  }

  Widget _rejectWidget(){
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      child: ImageLoader.loadLocalImage(
        'call/waeKnwaAnd_qrqeas5_cidcG_BnKoIt4i5f6y9_brgeZjqeGcTta',
        width: 36,
        height: 36,
      ),
      onPressed: () {
        widget.onHangup();
      },
    );
  }

}
