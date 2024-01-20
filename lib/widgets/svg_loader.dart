import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconLoader extends StatelessWidget {
  final bool isNetworkImage;
  final String iconPath;
  final Size size;

  const IconLoader({
    super.key,
    required this.iconPath,
    this.isNetworkImage = false,
    this.size = const Size(25, 25),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width.w,
        height: size.height.h,
        child: isNetworkImage
            ? Padding(
                padding: const EdgeInsets.all(50.0),
                child: SvgPicture.network(
                  iconPath,
                  height: 10,
                  width: 10,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(
                  iconPath,
                  height: 10,
                  width: 10,
                  fit: BoxFit.cover,
                ),
              ));
  }
}
