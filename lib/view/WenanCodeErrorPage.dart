
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/base/router/WenanCodePageRouter.dart';
import 'package:wenan/utils/WenanCodelog.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColor.black),
      child: Stack(
        children: [
          Center(
              child: _errorButton(context))
        ],
      ),
    );
  }

  _errorButton(BuildContext context){
   return CupertinoButton(
      child:const Text("Something bad happen!",
          style: TextStyle(
            height: 1.3,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColor.white,
          )),
      onPressed: () {
        if(PageRouter.canCurrPagePop()){
          FluroRouter.appRouter.pop(context);
        }
      },
    );
  }
}
