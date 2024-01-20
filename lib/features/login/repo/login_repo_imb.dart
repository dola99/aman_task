import 'package:dartz/dartz.dart';
import 'package:test_app/Model/user_data.dart';
import 'package:test_app/core/local_db/hive_helper.dart';
import 'package:test_app/features/login/repo/login_repo.dart';
import 'package:collection/collection.dart';

class LoginRepoImb extends LoginRepo {
  LoginRepoImb({required HiveDBHelper<UserData> hiveServices})
      : super(hiveHelper: hiveServices);

  @override
  Future<Either<String, UserData>> login(
      Map<String, dynamic> logincredentials) async {
    await hiveHelper.openBox('users');
    var users = hiveHelper.getAllItems();
    var result = users.firstWhereOrNull(
      (element) => element.email == logincredentials['email'],
    );

    if (result == null) {
      return const Left("no user with this username");
    } else {
      if (result.password != logincredentials['password']) {
        return const Left("Wrong Password");
      } else {
        return Right(result);
      }
    }
  }
}
