import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'WenanCodecolors.dart';
import 'WenanCodedimens.dart';

class AppGap {
  static const Widget hGap4 = const SizedBox(width: 4.0);
  static const Widget hGap2 = const SizedBox(width: 2.0);
  static const Widget hGap6 = const SizedBox(width: 6.0);
  static const Widget hGap5 = const SizedBox(width: AppDimen.gap_dp5);
  static const Widget hGap8 = const SizedBox(width: 8.0);
  static const Widget hGap10 = const SizedBox(width: AppDimen.gap_dp10);
  static const Widget hGap12 = const SizedBox(width: 12.0);
  static const Widget hGap15 = const SizedBox(width: AppDimen.gap_dp15);
  static const Widget hGap16 = const SizedBox(width: AppDimen.gap_dp16);
  static const Widget hGap25 = const SizedBox(width: 25);
  static const Widget hGap20 = const SizedBox(width: 20);
  static const Widget hGap22 = SizedBox(width: 22);
  static const Widget hGap24 = const SizedBox(width: 24);
  static const Widget hGap26 = SizedBox(width: 26);
  static const Widget hGap32 = SizedBox(width: 32);

  static const Widget vGap2 = const SizedBox(height: 2.0);
  static const Widget vGap4 = const SizedBox(height: 4.0);
  static const Widget vGap5 = const SizedBox(height: AppDimen.gap_dp5);
  static const Widget vGap6 = const SizedBox(height: 6);
  static const Widget vGap8 = const SizedBox(height: 8.0);
  static const Widget vGap10 = const SizedBox(height: AppDimen.gap_dp10);
  static const Widget vGap12 = const SizedBox(height: 12.0);
  static const Widget vGap15 = const SizedBox(height: AppDimen.gap_dp15);
  static const Widget vGap14 = const SizedBox(height: 14);
  static const Widget vGap16 = const SizedBox(height: AppDimen.gap_dp16);
  static const Widget vGap18 = const SizedBox(height: AppDimen.gap_dp18);
  static const Widget vGap20 = const SizedBox(height: 20);
  static const Widget vGap24 = const SizedBox(height: 24);
  static const Widget vGap26 = const SizedBox(height: 26);
  static const Widget vGap27 = const SizedBox(height: 27);
  static const Widget vGap50 = const SizedBox(height: AppDimen.gap_dp50);
  static const Widget vGap30 = const SizedBox(height: AppDimen.gap_dp30);
  static const Widget vGap40 = const SizedBox(height: AppDimen.gap_dp40);
  static const Widget vGap64 = const SizedBox(height: AppDimen.gap_dp64);

  static Widget line = const SizedBox(
    height: 0.5,
    width: double.infinity,
    child: const DecoratedBox(decoration: BoxDecoration(color: AppColor.black_05p)),
  );

  static Widget lineH4 = Container(
    height: 4,
    width: double.infinity,
    margin: EdgeInsets.only(left: 16, right: 16),
    decoration: BoxDecoration(
        color: AppColor.color_d8d8d8_10p,
        borderRadius: BorderRadius.all(Radius.circular(3))),
  );
  static Widget lineH4_margin0 = Container(
    height: 4,
    width: double.infinity,
    decoration: BoxDecoration(
        color: AppColor.color_d8d8d8_10p,
        borderRadius: BorderRadius.all(Radius.circular(3))),
  );

  static Widget lineH1p2 = Container(
    height: 0.5,
    width: double.infinity,
    child: const DecoratedBox(
        decoration: BoxDecoration(color: AppColor.color_d8d8d8)),
  );


  static Widget lineH1p2_5p = Container(
    height: 0.5,
    width: double.infinity,
    child: const DecoratedBox(
        decoration: BoxDecoration(color: AppColor.color_d8d8d8_5p)),
  );

  static Widget lineH1p2_d8_10p = Container(
    height: 0.5,
    width: double.infinity,
    child: const DecoratedBox(
        decoration: BoxDecoration(color: AppColor.color_d8d8d8_10p)),
  );

  static Widget lineH1_5p = Container(
    height: 1,
    width: double.infinity,
    child: const DecoratedBox(
        decoration: BoxDecoration(color: AppColor.color_d8d8d8_5p)),
  );

  static Widget lineH1p2_black5p = Container(
    height: 0.5,
    width: double.infinity,
    child: const DecoratedBox(
        decoration: BoxDecoration(color: AppColor.black_05p)),
  );

   static Widget lineH1p2_white = Container(
    height: 0.5,
    width: double.infinity,
    child: const DecoratedBox(
        decoration: BoxDecoration(color: AppColor.white)),
  );
  static Widget lineH1p2_white10p = const SizedBox(
    height: 0.5,
    width: double.infinity,
    child: DecoratedBox(
        decoration: BoxDecoration(color: AppColor.white_10p)),
  );

  static Widget lineH1p2_black10p = Container(
    height: 0.5,
    width: double.infinity,
    child: const DecoratedBox(
        decoration: BoxDecoration(color: AppColor.black_10p)),
  );

  static Widget lineH2 = Container(
    height: 2,
    width: double.infinity,
    child: const DecoratedBox(
        decoration: BoxDecoration(color: AppColor.color_d8d8d8)),
  );

  static const Widget empty = const SizedBox();

  static Widget line6 = const SizedBox(
    height: 6,
    width: double.infinity,
    child: const DecoratedBox(
        decoration: BoxDecoration(color: AppColor.color_f6f6fa)),
  );

  static Widget line8_vdiv_white_40p = const SizedBox(
    height: 8,
    width: 1,
    child: const DecoratedBox(
        decoration: BoxDecoration(color: AppColor.white_40p)),
  );

  static Widget line8_vdiv(Color lineColor){
    return SizedBox(
          height: 8,
          width: 1,
          child: DecoratedBox(
              decoration: BoxDecoration(color: lineColor)),
        );
  } 

  static Widget lineWidget({
    double width = double.infinity,
    double height = double.infinity,
    Color color = AppColor.black_05p,
  }) {
    return Container(width: width, height: height, color: color);
  }
}
