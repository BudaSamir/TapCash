import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import 'package:tap_cash/constants/colors_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainColor,
      body: Center(
        child: Image.asset(
          IconsAssets.logo2,
        ),
      ),
    );
  }

  // TO DO Check : User Have seen The onboard Screen Before
  // Function to navigate to Home after 2 seconds.
  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.passcode);
//       GoRouter.of(context).push(AppRouter.childLogin);
      // GoRouter.of(context).push(AppRouter.otpScreen);
    });
  }
}
