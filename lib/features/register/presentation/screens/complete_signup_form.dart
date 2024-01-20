import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/Model/user_data.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/features/register/cubit/register_cubit.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:url_launcher/url_launcher.dart';

class CompleteSignupForm extends StatelessWidget {
  final bool isShowOnly;
  final UserData? userData;
  CompleteSignupForm({super.key, this.userData, this.isShowOnly = false});

  final TextEditingController birthDayController = TextEditingController();
  final _secondformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = RegisterCubit.get(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isShowOnly ? 0 : AppContentPadding.horizontalPadding),
      child: SingleChildScrollView(
        physics: isShowOnly
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        child: Form(
          key: _secondformKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              CustomButton(
                  buttonState: ButtonState.idle,
                  titleButton: isShowOnly ? 'view on Map' : 'get My Location',
                  onPressed: () async {
                    if (isShowOnly) {
                      openMaps(userData!.latitude!, userData!.longitude!);
                    } else {
                      await cubit.getLocation(context);
                    }
                  }),
              SizedBox(
                height: 400.h,
              ),
              if (!isShowOnly)
                BlocConsumer<RegisterCubit, RegisterState>(
                  buildWhen: (previous, current) =>
                      current is RegisterLoading ||
                      current is RegisterSuccess ||
                      current is RegisterFailed,
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: CustomButton(
                          weight: 160.w,
                          buttonState: state is RegisterLoading
                              ? ButtonState.loading
                              : state is RegisterSuccess
                                  ? ButtonState.success
                                  : state is RegisterFailed
                                      ? ButtonState.fail
                                      : ButtonState.idle,
                          titleButton: 'Submit',
                          onPressed: () async {
                            if (_secondformKey.currentState!.validate()) {
                              _secondformKey.currentState!.save();
                              await cubit.register();
                              await Future.delayed(const Duration(seconds: 3));
                            }
                          }),
                    );
                  },
                )
            ],
          ),
        ),
      ),
    );
  }

  void openMaps(double latitude, double longitude) async {
    String mapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunch(mapsUrl)) {
      await launch(mapsUrl);
    }
  }
}
