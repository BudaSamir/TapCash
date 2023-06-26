import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tap_cash/app.dart';
import 'package:tap_cash/constants/strings_manager.dart';
import 'package:tap_cash/controller/auth_controllers/login_controller.dart';
import 'package:tap_cash/controller/auth_controllers/reset_controller.dart';
import 'package:tap_cash/controller/auth_controllers/signUp_controller.dart';
import 'package:tap_cash/controller/landing_controllers/onboarding_controller.dart';
import 'package:tap_cash/providers/auth_provider.dart';
import 'package:tap_cash/utility/shared_preference.dart';
import 'package:tap_cash/utility/validator.dart';

Future<void> main() async {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
  //   statusBarIconBrightness: Brightness.light,
  //   statusBarColor: MyColors.white,
  // ));
  // To Run ScreenUtilInit package.
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize DioHelper and CashHelper to run.
  await UserPerferences.sharedInitialize();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => StringsManager()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => LoginController()),
      ChangeNotifierProvider(create: (_) => SignUpController()),
      ChangeNotifierProvider(create: (_) => UserPerferences()),
      ChangeNotifierProvider(create: (_) => Validator()),
      ChangeNotifierProvider(create: (_) => ResetController()),
      // Onboarding Controller For Onboarding Screen
      ChangeNotifierProvider(create: (_) => OnboardingController()),
    ], child: const TapCash()),
  );
}
