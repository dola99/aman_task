import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/Model/user_data.dart';
import 'package:test_app/bootstrap.dart';
import 'package:test_app/core/dependency_injection/service_locator.dart';
import 'package:test_app/core/network/certifications.dart';
import 'package:test_app/core/theme.dart';
import 'package:test_app/features/login/cubit/login_cubit.dart';
import 'package:test_app/features/login/presentation/screens/login_screen.dart';
import 'package:test_app/features/login/repo/login_repo_imb.dart';
import 'package:test_app/features/register/cubit/register_cubit.dart';
import 'package:test_app/features/register/repo/register_repo_imb.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataAdapter());
  bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(
            loginRepo: serviceLocator<LoginRepoImb>(),
          ),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(
            registerRepo: serviceLocator<RegisterRepoImb>(),
          ),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            title: 'Kafill APP',
            debugShowCheckedModeBanner: false,
            theme: AppTheme().appTheme,
            home: const LoginScreen(),
          );
        },
      ),
    );
  }
}
