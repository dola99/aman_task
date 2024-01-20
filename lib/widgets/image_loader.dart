import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageLoader extends StatelessWidget {
  final bool isNetworkImage;
  final bool isFilePath;
  final String imagePath;
  final Size size;
  final double? borderRadius;
  const ImageLoader(
      {super.key,
      this.isFilePath = false,
      required this.imagePath,
      this.isNetworkImage = false,
      this.size = const Size(200, 200),
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width.w,
        height: size.height.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: isFilePath
            ? Image.file(File(imagePath))
            : isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ));
  }
}
