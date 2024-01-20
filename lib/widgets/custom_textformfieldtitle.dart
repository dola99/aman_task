import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/core/helpers/custom_textfield_params.dart';
import 'package:test_app/widgets/custom_text.dart';
import 'package:test_app/widgets/custom_textformfield.dart';

class CustomTextFormFieldWithTitle extends StatelessWidget {
  final String fieldTitle;
  final bool isObscureText;
  final bool textHiddenByDefult;
  final int? maxLine;
  final CustomTextFormFieldParams? params;

  const CustomTextFormFieldWithTitle(
      {super.key,
      this.isObscureText = false,
      this.maxLine,
      required this.params,
      this.textHiddenByDefult = false,
      required this.fieldTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DisplayText(
            textContent: fieldTitle,
            textStyle: AppTextStyle().montserratFont,
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomTextFormField(
              params: params!,
            ),
          ),
        ],
      ),
    );
  }
}
