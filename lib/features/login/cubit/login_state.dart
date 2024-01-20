part of 'login_cubit.dart';

@immutable
sealed class LoginState {
  final ButtonState buttonState;
  const LoginState({required this.buttonState});
}

final class LoginInitial extends LoginState {
  const LoginInitial({required super.buttonState});
}

final class LoginLoading extends LoginState {
  const LoginLoading({required super.buttonState});
}

final class LoginSuccesfully extends LoginState {
  final UserData? userData;
  const LoginSuccesfully({required super.buttonState, this.userData});
}

final class LoginFailed extends LoginState {
  final String? errorMessages;
  const LoginFailed({required super.buttonState, this.errorMessages});
}
