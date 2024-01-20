import 'package:flutter/material.dart';

class CustomTextFormFieldParams {
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? intialValue;
  final bool isReadOnly;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final bool? autofocus;

  final void Function(String?)? onSaved;
  final bool? enabled;

  const CustomTextFormFieldParams({
    this.obscureText = false,
    this.prefixIcon,
    this.intialValue,
    this.suffixIcon,
    this.isReadOnly = false,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.onChanged,
    this.validator,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.maxLines,
    this.autofocus = false,
    this.enabled = true,
  });
}
