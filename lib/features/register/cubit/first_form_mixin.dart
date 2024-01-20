import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/Model/register_model.dart';
import 'package:test_app/features/register/cubit/register_cubit.dart';

mixin FirstFormMixin on Cubit<RegisterState> {
  int selectedType = 0;
  bool isFormValid = true;
  FirstRegisterFrom firstRegisterFrom = FirstRegisterFrom();

  void setFirstName(String firstName) {
    firstRegisterFrom.firstName = firstName;
  }

  void serBirthday(String birthday) {
    firstRegisterFrom.birthDay = birthday;
  }

  void setUserName(String userName) {
    firstRegisterFrom.userName = userName;
  }

  void setSecondName(String secondName) {
    firstRegisterFrom.lastName = secondName;
  }

  void setEmail(String email) {
    firstRegisterFrom.email = email;
  }

  void setPassword(String password) {
    firstRegisterFrom.password = password;
  }

  formNotValidate() {
    isFormValid = false;
  }

  selectGender(String value) {
    firstRegisterFrom.gender = value;
  }

  validateFirstForm() {
    if (!isFormValid) {
      emit(FirstFormValidationFailed());
    }
    inspect(firstRegisterFrom);
  }
}
