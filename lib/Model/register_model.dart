import 'package:google_maps_flutter/google_maps_flutter.dart';

class RegisterModel {
  final FirstRegisterFrom firstRegisterFrom;
  final SecondRegisterForm secondRegisterForm;

  RegisterModel({
    required this.firstRegisterFrom,
    required this.secondRegisterForm,
  });

  Map<String, dynamic> toJson() {
    return {
      ...firstRegisterFrom.toFormData(),
      ...secondRegisterForm.toFormData(),
    };
  }
}

class FirstRegisterFrom {
  String? firstName;
  String? lastName;
  String? userName;
  String? password;
  String? email;
  String? gender;
  String? birthDay;
  FirstRegisterFrom(
      {this.firstName,
      this.userName,
      this.lastName,
      this.birthDay,
      this.password,
      this.email,
      this.gender});
  Map<String, dynamic> toFormData() {
    return {
      'first_name': firstName,
      'birthDate': birthDay,
      'last_name': lastName,
      'user_name': userName,
      'gender': gender,
      'password': password,
      'email': email,
    };
  }
}

class SecondRegisterForm {
  LatLng? latLng;

  SecondRegisterForm({this.latLng});

  Map<String, dynamic> toFormData() {
    Map<String, dynamic> form = {};
    latLng != null ? form['latitude'] = latLng!.latitude : null;
    latLng != null ? form['longitude'] = latLng!.longitude : null;

    return form;
  }
}
