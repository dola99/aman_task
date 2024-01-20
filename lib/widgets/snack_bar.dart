import 'package:flutter/material.dart';
import 'package:test_app/core/constant.dart';

class ShowSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    int? secondes,
    bool? isSuccess,
    Color textColor = Colors.black,
    Color color = Colors.transparent,
  }) {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Text(message,
                style: AppTextStyle()
                    .montserratFont
                    .copyWith(color: textColor, height: 1)),
            backgroundColor: color,
            elevation: 1,
            duration: Duration(seconds: secondes ?? 3),
            behavior: SnackBarBehavior.floating,
          ),
        )
        .closed
        .then((value) {
      if (context.mounted) ScaffoldMessenger.of(context).clearSnackBars();
    });
  }
}
