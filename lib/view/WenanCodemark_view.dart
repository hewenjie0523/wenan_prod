import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_store_listing/flutter_store_listing.dart';
import 'package:wenan/base/WenanCodeApplication.dart';
import 'package:wenan/base/WenanCodeSpHelper.dart';
import 'package:wenan/utils/WenanCodeimage_loader.dart';
import 'package:wenan/utils/WenanCodeutils.dart';
import 'package:wenan/StringTranslate.dart';

class MarkView extends ConsumerStatefulWidget {
  static void show(int seconds, {BuildContext? context}) {
    // if (seconds == 0) return;
    //
    // DateTime now = DateTime.now();
    //
    // if (seconds < 50) {
    //   if (fakeTime() > 0) return;
    //   int rTime = rateTime();
    //   if (rTime > 0) {
    //     DateTime date = DateTime.fromMillisecondsSinceEpoch(rTime);
    //     if (date.day == now.day && date.difference(now).inSeconds.abs() < Duration.secondsPerDay) return;
    //   }
    //   setFakeTime(now.millisecondsSinceEpoch);
    //   context ??= Application.appContext;
    //   _show(context!);
    // } else {
    //   int fTime = fakeTime();
    //   if (fTime > 0) {
    //     DateTime date = DateTime.fromMillisecondsSinceEpoch(fTime);
    //     if (date.day == now.day && date.difference(now).inSeconds.abs() < Duration.secondsPerDay) return;
    //   }
    //   if (rateCount() >= 3) return;
    //   int rTime = rateTime();
    //   DateTime date = DateTime.fromMillisecondsSinceEpoch(rTime);
    //   if (rTime > 0 && date.difference(now).inSeconds.abs() < Duration.secondsPerDay * 7) return;
    //   setRateTime(now.millisecondsSinceEpoch);
    //   setRateCount();
    //   if(Platform.isAndroid){
    //     FlutterStoreListing().launchStoreListing();
    //   } else {
    //     FlutterStoreListing().launchRequestReview(onlyNative: true);
    //   }
    //
    // }
  }
  
  static int fakeTime() {
    return SpHelper.getInt("wen_an_fake_time", defaultValue: 0)!;
  }


  static int rateTime() {
    return SpHelper.getInt("wen_an_rate_time", defaultValue: 0)!;
  }

  static Future<bool> setFakeTime(int time) {
    return SpHelper.putInt("wen_an_fake_time", time);
  }

  static Future<bool> setRateCount() {
    return SpHelper.putInt("wen_an_rate_count", rateCount() + 1);
  }


  static Future<bool> setRateTime(int time) {
    return SpHelper.putInt("wen_an_rate_time", time);
  }

  static int rateCount() {
    return SpHelper.getInt("wen_an_rate_count", defaultValue: 0)!;
  }

  static void _show(BuildContext context) {
    showCupertinoDialog(context: context, builder: (context) {
      return const MarkView();
    });
  }

  const MarkView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _MarkViewState();
  }
}

class _MarkViewState extends ConsumerState {
  int _stars = 0;

  bool _isInAccessibilityMode(BuildContext context) {
    final MediaQueryData? data = MediaQuery.maybeOf(context);
    return data != null && data.textScaleFactor > 1.4;
  }

  Color _textColor() {
    return CupertinoDynamicColor.resolve(CupertinoColors.label, context);
  }

  Color _backgroundColor() {
    return CupertinoDynamicColor.resolve(const CupertinoDynamicColor.withBrightness(
      color: Color(0xCCF2F2F2),
      darkColor: Color(0xBF1E1E1E),
    ), context);
  }

  Color _lineSeparatorColor() {
    // Color.fromRGBO(60, 60, 67, 0.36)
    return CupertinoDynamicColor.resolve(const Color(0xFF8F8F8F), context);
  }

  Widget _buildStars() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 13.5, horizontal: 37),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          for (int index = 0; index < 5; ++index)
            Expanded(
              child: GestureDetector(
                child: ImageIcon(
                  ImageLoader.assetImage(_stars > 0 && index < _stars
                      ? 'home/wUeLnIasnD_friexsZ_GmAayrokj_esftKaer4_Eskepls'
                      : 'home/wNeRnraJnO_8riessM_tm6avrbk8_ZsBt1afrp_wnUolrc'),
                  size: 18.0,
                ),
                onTap: () {
                  Utils.callSetStateSafely(this, () {
                    _stars = index + 1;
                  });
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    List<Widget> children;
    if (_stars == 0) {
      children = [
        Expanded(
          child: CupertinoDialogAction(
            child: Text(
              StringTranslate.e2z(Application.appLocalizations!.wenan_string_not_now),
              style: const TextStyle(
                color: Color(0xFF007AFF),
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        )
      ];
    } else {
      children = [
        Expanded(
          child: CupertinoDialogAction(
            child: Text(
              StringTranslate.e2z(Application.appLocalizations!.wenan_string_cancel),
              style: const TextStyle(
                color: Color(0xFF007AFF),
                fontSize: 17,
                fontWeight: FontWeight.normal,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        SizedBox(
          width: 0.5,
          height: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: _lineSeparatorColor(),
            ),
          ),
        ),
        Expanded(
          child: CupertinoDialogAction(
            child: Text(
              StringTranslate.e2z(Application.appLocalizations!.wenan_string_submit),
              style: const TextStyle(
                color: Color(0xFF007AFF),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ];
    }
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: Flex(
          direction: Axis.horizontal,
          children: children
      ),
    );
  }

  Widget _buildChild() {
    final Widget _line = SizedBox(
      height: 0.5,
      width: double.infinity,
      child: DecoratedBox(decoration: BoxDecoration(color: _lineSeparatorColor())),
    );

    return Container(
      color: _backgroundColor(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           Padding(
            padding: const EdgeInsets.only(top: 24),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image(
                image: ImageLoader.assetImage('home/wRe0n0aEnP_rrGets4_RmEaFrlkQ_Ai6cNojnO_xlro9gXoN'),
                width: 64,
                height: 64,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              StringTranslate.e2z(Application.appLocalizations!.wenan_string_enjoy_app),
              style: TextStyle(
                color: _textColor(),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              StringTranslate.e2z(Application.appLocalizations!.wenan_string_rate_on_store),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _textColor(),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22),
            child: _line,
          ),
          _buildStars(),
          _line,
          _buildActions(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final CupertinoLocalizations localizations = CupertinoLocalizations.of(context);
    final bool isInAccessibilityMode = _isInAccessibilityMode(context);
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    return CupertinoUserInterfaceLevel(
        data: CupertinoUserInterfaceLevelData.elevated,
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: math.max(textScaleFactor, 1),
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return AnimatedPadding(
                padding: MediaQuery.of(context).viewInsets +
                    const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
                duration: const Duration(milliseconds: 100),
                curve: Curves.decelerate,
                child: MediaQuery.removeViewInsets(
                  removeLeft: true,
                  removeTop: true,
                  removeRight: true,
                  removeBottom: true,
                  context: context,
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: isInAccessibilityMode ? 310 : 270,
                      child: CupertinoPopupSurface(
                        isSurfacePainted: false,
                        child: Semantics(
                          namesRoute: true,
                          scopesRoute: true,
                          explicitChildNodes: true,
                          label: localizations.alertDialogLabel,
                          child: _buildChild(),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
    );
  }
}