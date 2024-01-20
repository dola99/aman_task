import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/Model/user_data.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/features/register/presentation/screens/complete_signup_form.dart';
import 'package:test_app/features/register/presentation/screens/main_information_form.dart';
import 'package:test_app/widgets/custom_text.dart';

class UserScreen extends StatelessWidget {
  final UserData userData;
  const UserScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppContentPadding.horizontalPadding),
      child:
          //  BlocConsumer<UserCubit, UserState>(
          // listener: (context, state) {},
          // builder: (context, state) {
          //   if (state is WhoAmLoading) {
          //     return const Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   }
          //   if (state is WhoAmSuccesfully) {
          //     // final cubit = UserCubit.get(context);

          SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            DisplayText(
              textContent: 'Profile',
              textStyle: AppTextStyle().montserratFont.copyWith(
                  height: 1,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  color: AppColors.grey_900),
            ),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 500.h,
              child: MainInformationForm(
                isShowOnly: true,
                userData: userData,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              child: CompleteSignupForm(
                isShowOnly: true,
                userData: userData,
              ),
            )
          ],
        ),
      ),
    )));
  }
}
