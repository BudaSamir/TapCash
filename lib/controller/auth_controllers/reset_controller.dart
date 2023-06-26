import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/providers/auth_provider.dart';

class ResetController with ChangeNotifier {
  // VerificationScreen Start
  final verificationFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  final resetformKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  // VerificationScreen End
  // OTPScreen Start
  final oneController = TextEditingController();
  final twoController = TextEditingController();
  final threeController = TextEditingController();
  final fourController = TextEditingController();
  final fiveController = TextEditingController();
  final sixController = TextEditingController();

  final oneFocusNode = FocusNode();
  final twoFocusNode = FocusNode();
  final threeFocusNode = FocusNode();
  final fourFocusNode = FocusNode();
  final fiveFocusNode = FocusNode();
  final sixFocusNode = FocusNode();

  // OTPScreen End
  // NewPasswordScreen Start
  final passwordController = TextEditingController();
  final repeatpasswordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final repeatpasswordFocusNode = FocusNode();
  bool isPasswordVisible = true;
  bool isRepeatpasswordVisible = false;
  // NewPasswordScreen End

  String? email;
  String? password;
  String? repeatpassword;
  String? otp;
  List<String?> otpText = [];

  void setEmail(String? emailVal) {
    email = emailVal;
    notifyListeners();
  }

  // void setOTP(String? otpVal) {
  //   otp = otpVal;
  //   notifyListeners();
  // }

  void setOTPText(String? otpValue) {
    otpText.add(otpValue!);
    notifyListeners();
    print(otpText);
  }

  void setPassword(String? passwordVal) {
    password = passwordVal;
    notifyListeners();
  }

  void setRepeatPassword(String? repeatpasswordVal) {
    repeatpassword = repeatpasswordVal;
    notifyListeners();
  }

  void verification({
    required AuthProvider auth,
    required BuildContext context,
  }) {
    final form = verificationFormKey.currentState;
    if (form!.validate()) {
      form.save();
      auth.verification(email);
      GoRouter.of(context).pushReplacement(AppRouter.otpScreen);
    }
  }

  void otpMethod({
    required AuthProvider auth,
    required BuildContext context,
  }) {
    final form = otpFormKey.currentState;
    if (form!.validate()) {
      form.save();
      otp = otpText.join();
      notifyListeners();

      auth.getRegisteredStatus == Status.registered
          ? GoRouter.of(context).pushReplacement(AppRouter.layout)
          : GoRouter.of(context).pushReplacement(AppRouter.newPassword);
    }
  }

  void resetPassword(AuthProvider auth, BuildContext context) {
    final form = resetformKey.currentState;
    if (form!.validate()) {
      form.save();
      auth.resetPassword(email, otp, password).then((response) {
        if (response['status']) {
          // Provider.of<UserProvider>(context, listen: false).setUser(user);
          GoRouter.of(context).pushReplacement(AppRouter.layout);
        } else {
          Flushbar(
                  title: "resetPassword Failed",
                  message: response.toString(),
                  duration: const Duration(seconds: 10))
              .show(context);
        }
      });
    } else {
      Flushbar(
              title: "Invalid Form",
              message: 'please complete the form properly',
              duration: const Duration(seconds: 10))
          .show(context);
    }
  }
}
