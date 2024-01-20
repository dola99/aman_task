import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constant.dart';

class AnimatedRadioButton extends StatelessWidget {
  final int value;
  final int selectedValue;
  final String title;
  final void Function(int) onChanged;

  const AnimatedRadioButton({
    Key? key,
    required this.value,
    required this.selectedValue,
    required this.title,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 300),
        builder: (context, double value, child) {
          return Transform.scale(
            scale: 1.0 + 0.1 * value,
            child: child,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 22.w,
              height: 22.w,
              child: Radio<int>(
                fillColor: MaterialStateProperty.resolveWith((states) {
                  // active
                  if (states.contains(MaterialState.selected)) {
                    return AppColors.primaryColor;
                  }
                  // inactive
                  return AppColors.grey_300;
                }),
                value: value,
                activeColor: AppColors.primaryColor,
                groupValue: selectedValue,
                onChanged: (int? newValue) {
                  // Handle radio button selection
                  if (newValue != null) {
                    onChanged(newValue);
                  }
                },
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Text(
              title,
              style: AppTextStyle().montserratFont.copyWith(
                  fontSize: 14.sp, height: 1, color: AppColors.grey_900),
            ),
          ],
        ),
      ),
    );
  }
}
