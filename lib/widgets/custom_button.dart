import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constant.dart';
import 'package:progress_state_button/progress_button.dart';

class CustomButton extends StatelessWidget {
  final double? weight;
  final String titleButton;
  final ButtonState buttonState;
  final void Function() onPressed;

  const CustomButton(
      {super.key,
      required this.buttonState,
      required this.titleButton,
      this.weight = 200,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ProgressButton(
        stateColors: const {
          ButtonState.idle: AppColors.primaryColor,
          ButtonState.success: AppColors.primaryColor,
          ButtonState.fail: AppColors.error_50,
          ButtonState.loading: AppColors.primaryColor,
        },
        stateWidgets: {
          ButtonState.idle: Text(
            titleButton,
            style: AppTextStyle().montserratFont.copyWith(
                height: 1, fontSize: 14.sp, color: AppColors.bgGrey_50),
          ),
          ButtonState.loading: Container(
            color: AppColors.primaryColor,
            // child: const Center(child: CircularProgressIndicator()),
          ),
          ButtonState.fail: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cancel, color: AppColors.error_300),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Failed',
                style: AppTextStyle().montserratFont.copyWith(
                    height: 1, fontSize: 14.sp, color: AppColors.error_300),
              ),
            ],
          ),
          ButtonState.success: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Success",
                style: AppTextStyle().montserratFont.copyWith(
                    height: 1, fontSize: 14.sp, color: AppColors.bgGrey_50),
              ),
            ],
          ),
        },
        progressIndicatorAlignment: MainAxisAlignment.center,
        height: 56.h,
        radius: buttonState == ButtonState.loading ? 30.0 : 12.0,
        onPressed: onPressed,
        state: buttonState);
  }
}
