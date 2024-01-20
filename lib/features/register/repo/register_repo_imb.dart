import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:test_app/Model/register_model.dart';
import 'package:test_app/Model/user_data.dart';
import 'package:test_app/features/register/repo/register_repo.dart';
import 'package:collection/collection.dart';

class RegisterRepoImb extends RegisterRepo {
  RegisterRepoImb({required super.hiveDBHelper});

  @override
  Future<Either<String, bool>> register(RegisterModel registerModel) async {
    await hiveDBHelper.openBox('users');
    var users = hiveDBHelper.getAllItems();

    var result = users.firstWhereOrNull(
        (element) => element.email == registerModel.toJson()['email']);
    if (result != null) {
      return const Left('This userName saved Befor');
    } else {
      print(registerModel.toJson());
      var item =
          await hiveDBHelper.addItem(UserData.fromJson(registerModel.toJson()));
      print(item);
      inspect(hiveDBHelper.getAllItems());
      return const Right(true);
    }
  }
}
