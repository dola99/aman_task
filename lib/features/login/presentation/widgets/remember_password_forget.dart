import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/widgets/animted_checkbox.dart';
import 'package:test_app/widgets/custom_text.dart';

class RememberPassword extends StatefulWidget {
  const RememberPassword({super.key});

  @override
  State<RememberPassword> createState() => _RememberPasswordState();
}

class _RememberPasswordState extends State<RememberPassword> {
  bool rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              overlayColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              onTap: () {
                setState(() {
                  rememberPassword = !rememberPassword;
                });
              },
              child: SizedBox(
                height: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedCheckbox(
                        value: rememberPassword,
                        onChanged: (va) {
                          setState(() {
                            rememberPassword = !rememberPassword;
                          });
                        }),
                    SizedBox(
                      width: 5.w,
                    ),
                    DisplayText(
                      textContent: 'Remember me',
                      textStyle:
                          AppTextStyle().montserratFont.copyWith(height: 1),
                    )
                  ],
                ),
              ),
            ),
            DisplayText(
              textContent: 'Forgot Password?',
              textStyle: AppTextStyle().montserratFont,
            ),
          ],
        ),
        SizedBox(height: 14.h),
      ],
    );
  }
}
