import 'package:get_it/get_it.dart';
import 'package:test_app/Model/user_data.dart';
import 'package:test_app/core/local_db/hive_helper.dart';
import 'package:test_app/features/login/repo/login_repo_imb.dart';
import 'package:test_app/features/register/repo/register_repo_imb.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerLazySingleton(() => HiveDBHelper<UserData>());
  serviceLocator.registerLazySingleton(() =>
      LoginRepoImb(hiveServices: serviceLocator<HiveDBHelper<UserData>>()));

  serviceLocator.registerLazySingleton(() =>
      RegisterRepoImb(hiveDBHelper: serviceLocator<HiveDBHelper<UserData>>()));
}
