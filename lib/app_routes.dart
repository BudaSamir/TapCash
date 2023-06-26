import 'package:go_router/go_router.dart';
import 'package:tap_cash/view/screens/auth/login_screen.dart';
import 'package:tap_cash/view/screens/auth/new_password_screen.dart';
import 'package:tap_cash/view/screens/auth/otp_screen.dart';
import 'package:tap_cash/view/screens/auth/signup_screen.dart';
import 'package:tap_cash/view/screens/auth/verification_screen.dart';
import 'package:tap_cash/view/screens/child_screens/child_home.dart';
import 'package:tap_cash/view/screens/child_screens/child_login.dart';
import 'package:tap_cash/view/screens/child_screens/child_username.dart';
import 'package:tap_cash/view/screens/layout/layout.dart';
import 'package:tap_cash/view/screens/on_board.dart';
import 'package:tap_cash/view/screens/passcode_screen.dart';
import 'package:tap_cash/view/screens/splash_screen.dart';
import 'package:tap_cash/view/screens/wallet_screen.dart';

// GoRouter configuration
abstract class AppRouter {
  static const String landingScreen = '/landingScreen';
  static const String loginScreen = '/loginScreen';
  static const String signupScreen = '/signupScreen';
  static const String onBoardScreen = '/onBoardScreen';
  static const String verificationScreen = '/verificationScreen';
  static const String otpScreen = '/otpScreen';
  static const String newPassword = '/newPassword';
  static const String homeScreen = '/homeScreen';
  static const String layout = '/layout';
  static const String passcode = '/passcode';
  static const String wallet = '/wallet';
  static const String childLogin = '/childLogin';
  static const String childUsername = '/childUsername';
  static const String childHome = '/childHome';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signupScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: onBoardScreen,
        builder: (context, state) => const OnBoardScreen(),
      ),
      GoRoute(
        path: verificationScreen,
        builder: (context, state) => const VerificationScreen(),
      ),
      GoRoute(
        path: otpScreen,
        builder: (context, state) => const OTPScreen(),
      ),
      GoRoute(
        path: newPassword,
        builder: (context, state) => const NewPassword(),
      ),
      GoRoute(
        path: layout,
        builder: (context, state) => const LayOut(),
      ),
      GoRoute(
        path: passcode,
        builder: (context, state) => const PasscodeScreen(),
      ),
      GoRoute(
        path: wallet,
        builder: (context, state) => const WalletScreen(),
      ),
      GoRoute(
        path: childLogin,
        builder: (context, state) => const ChildLogin(),
      ),
      GoRoute(
        path: childUsername,
        builder: (context, state) => const ChildUsername(),
      ),
      GoRoute(
        path: childHome,
        builder: (context, state) => const ChildHome(),
      ),
    ],
  );
}
