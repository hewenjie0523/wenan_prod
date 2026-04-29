import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../../data/Gift.dart';
import '../../data/call/WenanCodeAppChatCallGift.dart';
import '../../data/user/CommonUser.dart';
import '../../res/WenanCodecolors.dart';
import '../../res/WenanCodegaps.dart';
import '../../utils/WenanCodeimage_loader.dart';
import '../../utils/WenanCodelog.dart';
import '../../utils/WenanCodeutils.dart';

const double outValue = -200;
const double inValue = 16;

class ChatCallGiftView extends StatefulWidget {
  const ChatCallGiftView({Key? key}) : super(key: key);

  @override
  State<ChatCallGiftView> createState() => ChatCallGiftViewState();
}

class ChatCallGiftViewState extends State<ChatCallGiftView>
    with TickerProviderStateMixin {
  final ListQueue<AppChatCallGift> _giftQueue = ListQueue<AppChatCallGift>();
  AnimationController? _animationController;

  double positionedLeft = outValue;

  @override
  void initState() {
    super.initState();
    positionedLeft = outValue;
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 600),
        reverseDuration: const Duration(milliseconds: 900),
        lowerBound: outValue,
        upperBound: inValue,
        vsync: this)
      ..addListener(() {
        final controller = _animationController;
        if (controller != null) {
          Utils.callSetStateSafely(this, () {
            positionedLeft = controller.value;
          });
        }
      });
    _animationController?.addStatusListener((status) {
      AuvChatLog.d(
          "addStatusListener status:$status  positionedLeft:$positionedLeft _giftQueue:${_giftQueue.length}",
          tag: "ChatCallGiftView");

      if (status == AnimationStatus.completed) {
        if (positionedLeft == inValue) {
          Future.delayed(const Duration(seconds: 3), () {
            _animationController?.reverse();
          });
        }
      } else if (status == AnimationStatus.dismissed) {
        if (positionedLeft == outValue) {
          _giftQueue.removeFirst();
          if (isNotEmpty) {
            _startAnimation();
          }
        }
      }
    });
  }

  void _startAnimation() {
    if (_animationController?.isDismissed == true) {
      _animationController?.reset();
    }
    _animationController?.forward();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void addChatCallGift(AppChatCallGift callGift) {
    _giftQueue.add(callGift);
    if (_giftQueue.length == 1) {
      _startAnimation();
    }
  }

  bool get isNotEmpty => _giftQueue.isNotEmpty;

  CommonUser? giftFrom() {
    if (_giftQueue.isEmpty) return null;
    return _giftQueue.first.from;
  }

  Gift? gift() {
    if (_giftQueue.isEmpty) return null;
    return _giftQueue.first.gift;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: positionedLeft,
      bottom: 220,
      height: 48,
      width: 192,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.black_40p,
        ),
        child: _rowWidget()
      ),
    );
  }

  _rowWidget(){
    return Row(
      children: [
        AppGap.hGap4,
        ImageLoader.loadOvalImage(giftFrom()?.avatar_url ?? "",
            width: 40, height: 40, type: ImageClipType.IMAGE_S),
        AppGap.hGap4,
        Expanded(
            flex: 1,
            child: Text(
              giftFrom()?.nick_name ?? "",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
            )),
        AppGap.hGap4,
        ImageLoader.loadOvalImage(
          gift()?.icon ?? "",
          width: 40,
          height: 40,
          type: ImageClipType.IMAGE_S,
        ),
        AppGap.hGap4,
      ],
    );
  }
}
