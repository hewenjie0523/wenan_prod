
import 'package:flutter/cupertino.dart';
import '../../../../res/WenanCodecolors.dart';

class NaneGradientText extends StatelessWidget {
  final String text;
  final Gradient? gradient;
  final TextStyle? style;

  const NaneGradientText({super.key,
    required this.text,
    this.gradient,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return gradient == null
        ? Text(
      text,
      style: style,
    )
        : ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return gradient!.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
      },
      child: Text(
        text,
        style: style?.copyWith(color: AppColor.black),
      ),
    );
  }
}
