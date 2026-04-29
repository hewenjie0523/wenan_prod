import 'package:flutter/cupertino.dart';

class AuvTextEditingController extends TextEditingController {
  @override
  TextSpan buildTextSpan({required BuildContext context, TextStyle? style ,required bool withComposing}) {
    if (!value.composing.isValid || !withComposing) {
      return TextSpan(style: style, text: text);
    }
    final TextStyle? composingStyle = style?.merge(
      const TextStyle(backgroundColor: Color(0xFFF1F1F1)),
    );
    return TextSpan(
        style: style,
        children: <TextSpan>[
          TextSpan(text: value.composing.textBefore(value.text)),
          TextSpan(
            style: composingStyle,
            text: value.composing.textInside(value.text),
          ),
          TextSpan(text: value.composing.textAfter(value.text)),
        ]);
  }
}