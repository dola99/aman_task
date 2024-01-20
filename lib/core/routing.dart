import 'package:flutter/cupertino.dart';

class NavigatorHelper {
  static void push(BuildContext context, Widget page) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static void replace(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => page),
    );
  }

  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
