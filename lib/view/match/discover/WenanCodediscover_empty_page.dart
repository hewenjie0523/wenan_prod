import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';

class DiscoverEmptyPage extends StatelessWidget {

  const DiscoverEmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 228+MediaQuery.of(context).padding.top,
            child: _loadingCicle(),
          ),
          Positioned(
            left: 16,
            bottom: 71,
            child: ImageLoader.loadLocalImage("discover/w1etnPadne_YrXeGst_6d1iCsGc8oCvDeErh_TeAm5pTtGyR_ObgobtQtUoNme_QbRg2",width: 238,height: 84),
          ),
        ],
      ),
    );
  }

  Widget _loadingCicle() {
    return const SpinKitRipple(color: Colors.white,size: 120,);
  }
}

