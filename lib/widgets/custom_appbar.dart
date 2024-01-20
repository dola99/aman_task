import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/core/routing.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leadingWidget;
  final List<Widget>? listWidget;

  const CustomAppBar(
      {super.key, required this.title, this.leadingWidget, this.listWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppContentPadding.horizontalPadding.w),
      child: AppBar(
        leading: NavigatorHelper.canPop(context)
            ? IconButton(
                highlightColor: Colors.transparent,
                onPressed: () {
                  NavigatorHelper.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                ),
              )
            : leadingWidget,
        leadingWidth: 24.w,
        actions: listWidget,
        title: Text(title, style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
    );
  }

  @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  Size get preferredSize => Size.fromHeight(80.h);
}
