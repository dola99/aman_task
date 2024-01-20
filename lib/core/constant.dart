import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/fonts.dart';

class AppColors {
  static const primaryColor = Color(0xff1DBF73);
  static const primary100 = Color(0xffe9f9f1);
  static const grey_400 = Color(0xff8692A6);
  static const grey_900 = Color(0xff000000);
  static const grey_800 = Color(0xff333333);
  static const grey_500 = Color(0xff696f79);
  static const grey_600 = Color(0xff828282);
  static const grey_300 = Color(0xffc3c5c8);
  static const grey_200 = Color(0xffe6eaef);
  static const grey_100 = Color(0xffF2F2F2);
  static const grey_50 = Color(0xfff9f9f9);
  static const bgGrey_900 = Color(0xffffffff);
  static const bgGrey_50 = Color(0xfff9f9f9);
  static const bgGrey_500 = Color(0xff696f79);
  static const bgGrey_800 = Color(0xff333333);
  static const bgGrey_300 = Color(0xffc3c5c8);
  static const error_300 = Color(0xfff56342);
  static const error_50 = Color(0xfffff0ED);
  static const warning = Color(0xffffcb31);
}

class AppContentPadding {
  static const horizontalPadding = 20.0;
}

class AppImages {
  static const String imagePaths = 'assets/images';
  static const String loginImage = '$imagePaths/Login.png';
  static const String selectImage = '$imagePaths/select_image.png';
}

class AppIcons {
  static const String iconPaths = 'assets/icons';
  static const String doneIcon = '$iconPaths/done.svg';
  static const String facebookIcon = '$iconPaths/facebook.svg';
  static const String twitterIcon = '$iconPaths/twitter.svg';
  static const String linkedInIcon = '$iconPaths/linked.svg';
  static const String cartIcon = '$iconPaths/cart.svg';
  static const String countryIcon = '$iconPaths/country.svg';
  static const String whoAmIcon = '$iconPaths/whoami.svg';
  static const String starIcon = '$iconPaths/star.svg';
  static const String bagIcon = '$iconPaths/bag.svg';
}

class AppTextStyle {
  TextStyle montserratFont = TextStyle(
    fontSize: 12.sp,
    height: .13,
    fontFamily: FontUitls.montserratFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.bgGrey_500,
  );
}

class AppTextStyle2 {
  TextStyle montserratFont = TextStyle(
    fontSize: 12.sp,
    height: .13,
    fontFamily: FontUitls.montserratFontFamily,
    fontWeight: FontWeight.w500,
    color: AppColors.bgGrey_500,
  );
}
