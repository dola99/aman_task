part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {
  final ButtonState buttonState;
  RegisterLoading(this.buttonState);
}

final class RegisterSuccess extends RegisterState {
  final ButtonState buttonState;
  RegisterSuccess(this.buttonState);
}

final class RegisterFailed extends RegisterState {
  final ButtonState buttonState;
  final String errorMessage;
  RegisterFailed(this.buttonState, this.errorMessage);
}

final class ControllerInitial extends RegisterState {}

final class TypeSelected extends RegisterState {}

final class FirstFormValidationFailed extends RegisterState {}

final class FirstFormValidationSucess extends RegisterState {}

final class SecondFormValidationSucess extends RegisterState {}

final class SecondFormValidationFailed extends RegisterState {}
