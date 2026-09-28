import 'package:flutter/material.dart';

class TipFormattedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const TipFormattedText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
