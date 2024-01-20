import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:test_app/Model/user_data.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/core/helpers/custom_textfield_params.dart';
import 'package:test_app/core/helpers/validators.dart';
import 'package:test_app/features/register/cubit/register_cubit.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text.dart';
import 'package:test_app/widgets/custom_textformfieldtitle.dart';
import 'package:progress_state_button/progress_button.dart';

// ignore: must_be_immutable
class MainInformationForm extends StatelessWidget {
  final UserData? userData;
  final bool isShowOnly;
  MainInformationForm({super.key, this.isShowOnly = false, this.userData});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordTextEditing = TextEditingController();
  final passwordFocusNode = FocusNode();
  final TextEditingController birthDayController = TextEditingController();
  bool _isPasswordObscure = true;
  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isShowOnly ? 0 : AppContentPadding.horizontalPadding),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
                child: CustomTextFormFieldWithTitle(
              params: CustomTextFormFieldParams(
                validator: (value) {
                  if (value == null || value == '') {
                    cubit.formNotValidate();
                    return 'Please enter your user name';
                  } else if (value.length > 50) {
                    cubit.formNotValidate();
                    return 'First name should not exceed 50 characters';
                  }
                  return null;
                },
                intialValue: userData?.userName,
                isReadOnly: isShowOnly,
                onSaved: (va) => cubit.setUserName(va!),
              ),
              fieldTitle: 'User Name',
            )),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 160.w,
                    child: CustomTextFormFieldWithTitle(
                      params: CustomTextFormFieldParams(
                        validator: (value) {
                          if (value == null || value == '') {
                            cubit.formNotValidate();
                            return 'Please enter your first name';
                          } else if (value.length > 50) {
                            cubit.formNotValidate();
                            return 'First name should not exceed 50 characters';
                          }
                          return null;
                        },
                        intialValue: userData?.firstName,
                        isReadOnly: isShowOnly,
                        onSaved: (va) => cubit.setFirstName(va!),
                      ),
                      fieldTitle: 'First Name',
                    )),
                SizedBox(
                  width: 15.w,
                ),
                SizedBox(
                    width: 160.w,
                    child: CustomTextFormFieldWithTitle(
                        params: CustomTextFormFieldParams(
                          validator: (value) {
                            if (value == null || value == '') {
                              cubit.formNotValidate();
                              return 'Please enter your last name';
                            } else if (value.length > 50) {
                              cubit.formNotValidate();
                              return 'Last name should not exceed 50 characters';
                            }
                            return null;
                          },
                          isReadOnly: isShowOnly,
                          intialValue: userData?.lastName,
                          onSaved: (va) => cubit.setSecondName(va!),
                        ),
                        fieldTitle: 'Second Name')),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomTextFormFieldWithTitle(
              fieldTitle: 'Email Address',
              params: CustomTextFormFieldParams(
                validator: (value) {
                  final emailRegex =
                      RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                  if (value == null || !emailRegex.hasMatch(value)) {
                    cubit.formNotValidate();
                    return 'Please enter a valid email address';
                  }
                  if (value.length > 64) {
                    cubit.formNotValidate();
                    return 'Email should not exceed 64 characters';
                  }
                  return null;
                },
                isReadOnly: isShowOnly,
                intialValue: userData?.email,
                onSaved: (va) => cubit.setEmail(va!),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            if (!isShowOnly)
              StatefulBuilder(builder: (thisLowerContext, innerSetState) {
                return CustomTextFormFieldWithTitle(
                    fieldTitle: 'Password',
                    params: CustomTextFormFieldParams(
                      obscureText: _isPasswordObscure,
                      controller: passwordTextEditing,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          innerSetState(
                              () => _isPasswordObscure = !_isPasswordObscure);
                        },
                        child: Icon(
                          _isPasswordObscure
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                          size: 18,
                          color: AppColors.grey_400,
                        ),
                      ),
                      validator: (value) {
                        return ValidatorHelper.validatePassword(value);
                      },
                      onSaved: (value) {
                        cubit.setPassword(value!);
                      },
                    ));
              }),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () async {
                if (isShowOnly) {
                  return;
                }
                DateTime? pickedData = await _selectDate(context);
                if (pickedData != null) {
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  String formattedDate = formatter.format(pickedData);

                  cubit.serBirthday(formattedDate);
                  birthDayController.text = formattedDate;
                }
              },
              child: IgnorePointer(
                child: CustomTextFormFieldWithTitle(
                  fieldTitle: 'Birthday',
                  params: CustomTextFormFieldParams(
                      validator: (value) {
                        DateTime parsedDateTime = DateTime.parse(value!);

                        if (parsedDateTime.isAfter(DateTime.now())) {
                          // Date is in the future, return null
                          return 'Enter Valid Date';
                        } else {
                          return null;
                        }
                      },
                      controller: isShowOnly ? null : birthDayController,
                      suffixIcon: const Icon(
                        Icons.calendar_month,
                        size: 18,
                        color: AppColors.grey_400,
                      ),
                      intialValue: userData?.birthDate,
                      isReadOnly: isShowOnly),
                ),
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            DisplayText(
              textContent: 'Gender',
              textStyle: AppTextStyle().montserratFont,
            ),
            SizedBox(
              height: 12.h,
            ),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Male', child: Text('Male')),
                DropdownMenuItem(value: 'Female', child: Text('Female')),
              ],
              onChanged: (value) {
                cubit.selectGender(value!);
              },
              validator: (va) {
                if (va == null || va.isEmpty) {
                  return 'This Field is Required';
                }
                return null;
              },
            ),
            SizedBox(
              height: 12.h,
            ),
            const Spacer(),
            if (!isShowOnly)
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                    weight: 160.w,
                    buttonState: ButtonState.idle,
                    titleButton: 'Next',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        cubit.validateFirstForm();
                        inspect(cubit.firstRegisterFrom.toFormData());
                        RegisterCubit.get(context).pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear);
                      }
                    }),
              )
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    return pickedDate;
  }
}
