import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/core/helpers/custom_textfield_params.dart';
import 'package:test_app/core/helpers/validators.dart';
import 'package:test_app/features/login/cubit/login_cubit.dart';
import 'package:test_app/features/login/presentation/widgets/login_button.dart';
import 'package:test_app/features/login/presentation/widgets/remember_password_forget.dart';
import 'package:test_app/widgets/custom_textformfieldtitle.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();
  bool _isPasswordObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormFieldWithTitle(
            fieldTitle: 'Email Address',
            params: CustomTextFormFieldParams(
              onFieldSubmitted: (va) {
                _passwordFocusNode.requestFocus();
              },
              validator: (value) {
                return ValidatorHelper.validateEmail(value);
              },
              onSaved: (value) {
                LoginCubit.get(context).loginCredentials['email'] = value;
              },
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          StatefulBuilder(builder: (thisLowerContext, innerSetState) {
            return CustomTextFormFieldWithTitle(
                fieldTitle: 'Password',
                params: CustomTextFormFieldParams(
                  obscureText: _isPasswordObscure,
                  focusNode: _passwordFocusNode,
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
                  onFieldSubmitted: (va) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      LoginCubit.get(context).login();
                    }
                  },
                  onSaved: (value) {
                    LoginCubit.get(context).loginCredentials['password'] =
                        value;
                  },
                ));
          }),
          SizedBox(height: 4.h),
          const RememberPassword(),
          LoginButton(
            formKey: _formKey,
          ),
        ],
      ),
    );
  }
}
