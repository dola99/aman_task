import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Model/register_model.dart';
import 'package:test_app/features/register/cubit/first_form_mixin.dart';
import 'package:test_app/features/register/cubit/second_form_mixin.dart';
import 'package:test_app/features/register/presentation/screens/complete_signup_form.dart';
import 'package:test_app/features/register/presentation/screens/main_information_form.dart';
import 'package:test_app/features/register/repo/register_repo.dart';
import 'package:progress_state_button/progress_button.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState>
    with FirstFormMixin, SecondFormMixin {
  final RegisterRepo _registerRepo;
  RegisterCubit({required RegisterRepo registerRepo})
      : _registerRepo = registerRepo,
        super(RegisterInitial());
  final List<Widget> forms = [MainInformationForm(), CompleteSignupForm()];
  late PageController pageController;
  late RegisterModel registerModel;

  init(PageController controller) async {
    pageController = controller;
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(ControllerInitial());
  }

  static RegisterCubit get(BuildContext context) => BlocProvider.of(context);

  register() async {
    RegisterModel registerModel = RegisterModel(
        firstRegisterFrom: firstRegisterFrom,
        secondRegisterForm: secondRegisterForm);
    emit(RegisterLoading(ButtonState.loading));
    final result = await _registerRepo.register(registerModel);

    result.fold((l) => emit(RegisterFailed(ButtonState.fail, l)),
        (r) => emit(RegisterSuccess(ButtonState.success)));
  }
}
