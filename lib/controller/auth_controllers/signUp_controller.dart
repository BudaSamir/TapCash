import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/models/user_models.dart';
import 'package:tap_cash/providers/auth_provider.dart';

class SignUpController with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final firstnameFocusNode = FocusNode();
  final lastnameFocusNode = FocusNode();
  final phoneFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final repeatPasswordFocusNode = FocusNode();
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? passwordValue;
  String? repeatPasswordValue;

  bool isChecked = false;
  bool isPasswordVisible = false;
  bool isRepeatPasswordVisible = false;

  void setFirstName(String? firstNameValue) {
    firstName = firstNameValue;
    notifyListeners();
  }

  void setLasttName(String? lastNameValue) {
    lastName = lastNameValue;
    notifyListeners();
  }

  void setEmail(String? emailValue) {
    email = emailValue;
    notifyListeners();
  }

  void setPhone(String? phoneValue) {
    phone = phoneValue;
    notifyListeners();
  }

  void setPassword(String? passwordValue) {
    passwordValue = passwordValue;
    notifyListeners();
  }

  void setRepeatPassword(String? repeatPasswordValue) {
    repeatPasswordValue = repeatPasswordValue;
    notifyListeners();
  }

  void selectCheckBox(bool? value) {
    isChecked = value!;
    isChecked != isChecked;
    notifyListeners();
  }

  void passwordVisiblity() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void register(AuthProvider auth, BuildContext context) {
    final form = formKey.currentState;
    if (form!.validate() && isChecked == true) {
      form.save();
      auth
          .register(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: repeatPasswordValue)
          .then((response) {
        if (response['status']) {
          User user = response['user'];
          auth.setRegisterStatus(Status.registered);
          auth.verification(user.email).then((response) {
            if (response['status']) {
              User user = response['data'];
              GoRouter.of(context).pushReplacement(AppRouter.otpScreen);
            } else {
              Flushbar(
                      title: "Registered Failed",
                      message: response.toString(),
                      duration: const Duration(seconds: 100))
                  .show(context);
            }
          });
        } else {
          Flushbar(
                  title: "Registered Failed",
                  message: response.toString(),
                  duration: const Duration(seconds: 100))
              .show(context);
        }
      });
    } else {
      Flushbar(
              title: "Invalid Form",
              message: 'please complete the form properly',
              duration: const Duration(seconds: 100))
          .show(context);
    }
  }
}
