import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String textContent;
  final TextStyle? textStyle;
  const DisplayText({
    super.key,
    this.textStyle,
    required this.textContent,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,
      style: textStyle,
    );
  }
}
