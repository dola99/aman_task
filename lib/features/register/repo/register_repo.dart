import 'package:dartz/dartz.dart';
import 'package:test_app/Model/register_model.dart';
import 'package:test_app/Model/user_data.dart';
import 'package:test_app/core/local_db/hive_helper.dart';

abstract class RegisterRepo {
  final HiveDBHelper<UserData> hiveDBHelper;
  RegisterRepo({required this.hiveDBHelper});

  Future<Either<String, bool>> register(RegisterModel registerModel);
}
