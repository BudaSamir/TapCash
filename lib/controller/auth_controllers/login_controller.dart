import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/providers/auth_provider.dart';

class LoginController with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final repeatPasswordFocusNode = FocusNode();

  bool isChecked = false;
  bool isPasswordVisible = false;
  bool isRepeatPasswordVisible = false;
  String? email;
  String? password;
  bool rememberMe = false;

  void selectCheckBox(bool? value) {
    isChecked = value!;
    isChecked != isChecked;
    notifyListeners();
  }

  void passwordVisiblity() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void setEmail(String? emailVal) {
    email = emailVal;
    notifyListeners();
  }

  void setPassword(String? passwordVal) {
    password = passwordVal;
    notifyListeners();
  }

  void login(AuthProvider auth, BuildContext context) {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      auth.login(email, password).then((response) {
        if (response['status']) {
          // Provider.of<UserProvider>(context, listen: false).setUser(user);
          GoRouter.of(context).pushReplacement(AppRouter.layout);
        } else {
          Flushbar(
                  title: "login Failed",
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
