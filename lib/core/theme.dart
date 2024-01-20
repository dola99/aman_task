import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/core/fonts.dart';

class AppTheme {
  ThemeData appTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: AppColors.bgGrey_900,
    unselectedWidgetColor: AppColors.grey_300,
    inputDecorationTheme: InputDecorationTheme(
      constraints: BoxConstraints(
          maxWidth: 334.w, minWidth: 163.w, maxHeight: 80.h, minHeight: 56.h),
      fillColor: AppColors.bgGrey_50,
      filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.transparent, width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.error_300, width: 1.0),
      ),
      errorStyle: AppTextStyle()
          .montserratFont
          .copyWith(color: AppColors.error_300, fontSize: 14, height: 1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xffF6F6F6), width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.0),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 100.h,
      backgroundColor: AppColors.bgGrey_900,
      iconTheme: const IconThemeData(color: AppColors.grey_900),
      titleTextStyle: TextStyle(
        fontFamily: FontUitls.montserratFontFamily,
        fontSize: 18.sp,
        color: AppColors.grey_900,
        fontWeight: FontWeight.w600,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent),
    ),
  );
}
