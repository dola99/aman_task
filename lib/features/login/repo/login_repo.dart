import 'package:dartz/dartz.dart';
import 'package:test_app/Model/user_data.dart';
import 'package:test_app/core/local_db/hive_helper.dart';

abstract class LoginRepo {
  final HiveDBHelper<UserData> hiveHelper;
  LoginRepo({required this.hiveHelper});

  Future<Either<String, UserData>> login(Map<String, dynamic> logincredentials);
}
