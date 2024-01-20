import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Model/user_data.dart';
import 'package:test_app/features/login/repo/login_repo.dart';
import 'package:progress_state_button/progress_button.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  late final LoginRepo _loginRepo;
  LoginCubit({required LoginRepo loginRepo})
      : _loginRepo = loginRepo,
        super(const LoginInitial(buttonState: ButtonState.idle));

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  late UserData userData;
  Map<String, dynamic> loginCredentials = {};

  login() async {
    emit(const LoginLoading(buttonState: ButtonState.loading));
    try {
      final response = await _loginRepo.login(loginCredentials);
      response.fold(
          (l) => emit(
              LoginFailed(buttonState: ButtonState.fail, errorMessages: l)),
          (r) {
        userData = r;
        emit(LoginSuccesfully(buttonState: ButtonState.success, userData: r));
      });
    } catch (e) {
      emit(const LoginFailed(buttonState: ButtonState.fail));
    }
  }
}
