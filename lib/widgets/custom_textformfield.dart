import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/core/helpers/custom_textfield_params.dart';

class CustomTextFormField extends StatelessWidget {
  final CustomTextFormFieldParams params;

  const CustomTextFormField({super.key, required this.params});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.bgGrey_500,
      cursorHeight: 17.h,
      textDirection: TextDirection.ltr,
      initialValue: params.intialValue,
      controller: params.controller,
      textAlignVertical: TextAlignVertical.center,
      onChanged: params.onChanged,
      validator: params.validator,
      readOnly: params.isReadOnly,
      obscureText: params.obscureText,
      onSaved: params.onSaved,
      keyboardType: params.keyboardType,
      textCapitalization: params.textCapitalization,
      maxLines: params.obscureText ? 1 : params.maxLines,
      autofocus: params.autofocus!,
      enabled: params.enabled,
      textInputAction: params.textInputAction,
      focusNode: params.focusNode,
      style: AppTextStyle().montserratFont.copyWith(
            fontSize: 16.sp,
            height: 1,
            color: AppColors.bgGrey_800,
          ),
      onFieldSubmitted: params.onFieldSubmitted,
      decoration: InputDecoration(
          prefixIcon: params.prefixIcon, suffixIcon: params.suffixIcon),
    );
  }
}
