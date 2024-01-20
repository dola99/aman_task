import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserData {
  @HiveField(0)
  String? firstName;

  @HiveField(1)
  String? lastName;
  @HiveField(2)
  String? userName;
  @HiveField(3)
  double? latitude;

  @HiveField(4)
  double? longitude;

  @HiveField(5)
  String? email;

  @HiveField(6)
  String? birthDate;

  @HiveField(7)
  String? gender;
  @HiveField(8)
  String? password;

  UserData._privateConstructor(
      {required this.firstName,
      required this.latitude,
      required this.lastName,
      required this.longitude,
      required this.userName,
      required this.email,
      required this.birthDate,
      required this.gender,
      required this.password});

  // Default unnamed constructor
  UserData();

  // Singleton instance
  static final UserData _instance = UserData._privateConstructor(
    firstName: '',
    lastName: '',
    latitude: 0.0,
    userName: '',
    longitude: 0.0,
    password: '',
    email: '',
    birthDate: '',
    gender: '',
  );

  factory UserData.getInstance() {
    return _instance;
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData._privateConstructor(
      firstName: json['first_name'],
      password: json['password'],
      userName: json['user_name'],
      lastName: json['last_name'],
      email: json['email'],
      birthDate: json['birthDate'],
      gender: json['gender'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'birth_date': birthDate,
      'gender': gender,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
