import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wenan/res/WenanCodecolors.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodelog.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/view/widgets/WenanCodeAuvCupertinoPageScaffold.dart';
import 'package:svgaplayer_flutter/svgaplayer_flutter.dart';

class SvgaPlayerPage extends StatefulWidget {
  final String svgaPath;
  final String? svgaIcon;

  const SvgaPlayerPage({Key? key, required this.svgaPath,this.svgaIcon}) : super(key: key);

  @override
  State<SvgaPlayerPage> createState() => _SvgaPlayerPageState();
}

class _SvgaPlayerPageState extends State<SvgaPlayerPage>
    with SingleTickerProviderStateMixin {
  late SVGAAnimationController animationController;
  bool isLoading = true;

  @override
  void initState() {
    animationController = SVGAAnimationController(vsync: this);
    loadAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void loadAnimation() async {
    AuvChatLog.d("loadAnimation start");
    final videoItem = await SVGAParser.shared.decodeFromURL(widget.svgaPath);
    AuvChatLog.d("decodeFromURL end");
    if(mounted){
      Utils.callSetStateSafely(this, () {
        isLoading = false;
      });
    }
    animationController.videoItem = videoItem;
    animationController.forward().whenComplete(() {
      animationController.videoItem = null;
      AuvChatLog.d("whenComplete mounted:$mounted");
      if (mounted) {
        FluroRouter.appRouter.pop(context);
      }
    });
    // animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AuvCupertinoPageScaffold(
      backgroundColor: AppColor.transparent,
      child: Stack(
      children: [
        SVGAImage(animationController),
        GestureDetector(
          onTap: () {
            AuvChatLog.d("SVGAImage close");
            FluroRouter.appRouter.pop(context);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColor.transparent,
          ),
        ),
        Visibility(
          visible: isLoading,
          child:  Center(
            child: Stack(
                alignment: Alignment.center,
                children:[
                  const SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColor.white),
                    ),
                  ),

                  if(!Utils.isEmptyString(widget.svgaIcon)) ImageLoader.loadNoPlaceHolder(widget.svgaIcon!,width: 72,height: 72)
                ]
            ),
          )
        )
      ],
    ));
  }
}
