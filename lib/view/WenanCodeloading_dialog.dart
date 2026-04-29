import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../res/WenanCodecolors.dart';

class LoadingDialog extends Dialog {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
            decoration: const ShapeDecoration(
                color: AppColor.color111523,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            width: 120,
            height: 120,
            padding: const EdgeInsets.all(10),
            child: spinKitWidget()),
      ),
    );
  }

  spinKitWidget(){
    return const SpinKitRipple(
      color: Colors.white,
      size: 120,
    );
  }
}
