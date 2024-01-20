import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constant.dart';

import 'package:test_app/widgets/svg_loader.dart';
import 'package:linear_step_indicator/linear_step_indicator.dart';

class MyStepper extends StatefulWidget {
  final PageController pageController;
  const MyStepper({super.key, required this.pageController});

  @override
  MyStepperState createState() => MyStepperState();
}

class MyStepperState extends State<MyStepper> {
  final List<String> steps = ['Register', 'Complete Data'];

  // @override
  // void initState() {
  //   // initializeController();
  //   super.initState();
  // }

  // Future initializeController() {
  //   Completer completer = Completer();

  //   /// Callback called after widget has been fully built
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     completer.complete(true);
  //   });
  //   return completer.future;
  // } // /initia

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FullLinearStepIndicator(
          steps: 2,
          lineHeight: 2.5,
          activeNodeColor: AppColors.primaryColor,
          completedIcon: Icons.check,
          activeBorderColor: AppColors.primaryColor,
          inActiveBorderColor: AppColors.primaryColor,
          checkedWidget: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor,
            ),
            child: const IconLoader(
              iconPath: AppIcons.doneIcon,
              size: Size(20, 20),
            ),
          ),
          inActiveNodeColor: const Color(0xffd1d5d8),
          nodeBackgroundColor: AppColors.bgGrey_900,
          activeLineColor: AppColors.primaryColor,
          inActiveLineColor: const Color(0xffd1d5d8),
          iconColor: Colors.red,
          leftTitlePadding: 45.w,
          rightTitlePadding: 63.w,
          activeLabelStyle: AppTextStyle().montserratFont.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              height: 1,
              color: AppColors.primaryColor),
          inActiveLabelStyle: AppTextStyle().montserratFont.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              height: 1,
              color: AppColors.grey_300),
          controller: widget.pageController,
          labels: steps,
          complete: () {
            //typically, you'd want to put logic that returns true when all the steps
            //are completed here
            return Future.value(true);
          },
        ),
      ],
    );
  }
}
