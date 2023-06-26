import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';
import 'package:tap_cash/controller/auth_controllers/signUp_controller.dart';
import 'package:tap_cash/providers/auth_provider.dart';
import 'package:tap_cash/utility/validator.dart';
import 'package:tap_cash/view/utils/custom_text_form_field.dart';
import 'package:tap_cash/view/utils/main_button.dart';

import '../../../constants/assets_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final signupController = Provider.of<SignUpController>(context);
    final validator = Provider.of<Validator>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Form(
              key: signupController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*
                      =========================================
                      = Sign up Screen Header Start
                      =========================================
                      */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.loginScreen);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: MyColors.blue,
                          )),
                      Text(
                        'Sign up',
                        style: MyStyles.textStyle20
                            .copyWith(color: MyColors.mainColor),
                      ),
                    ],
                  ),
                  /*
                      =========================================
                      = Sign up Screen Header Start
                      =========================================
                      */
                  SizedBox(
                    height: 30.h,
                  ),
                  /*
                      =========================================
                      = First name Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: signupController.firstnameController,
                    focusNode: signupController.firstnameFocusNode,
                    validator: (firstNameValue) {
                      var msg = validator.validatename(
                          firstNameValue, NameType.firstName);
                      return msg;
                    },
                    onSaved: (firstNameValue) {
                      signupController.setFirstName(firstNameValue);
                    },
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(signupController.lastnameFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'First name',
                    obscureText: false,
                    textInputType: TextInputType.text,
                  ),
                  /*
                      =========================================
                      = First name End
                      =========================================
                      */
                  SizedBox(
                    height: 20.h,
                  ),
                  /*
                      =========================================
                      = Last name Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: signupController.lastnameController,
                    focusNode: signupController.lastnameFocusNode,
                    validator: (lastNameValue) {
                      var msg = validator.validatename(
                          lastNameValue, NameType.lastName);
                      return msg;
                    },
                    onSaved: (lastNameValue) {
                      signupController.setLasttName(lastNameValue);
                    },
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(signupController.emailFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'Last name',
                    obscureText: false,
                    textInputType: TextInputType.text,
                  ),
                  /*
                      =========================================
                      = Last name End
                      =========================================
                      */
                  SizedBox(
                    height: 20.h,
                  ),
                  /*
                      =========================================
                      = Email Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: signupController.emailController,
                    focusNode: signupController.emailFocusNode,
                    validator: (emailValue) {
                      var msg = validator.validateEmail(emailValue);
                      return msg;
                    },
                    onSaved: (emailValue) {
                      signupController.setEmail(emailValue);
                    },
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(signupController.phoneFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'Email',
                    obscureText: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  /*
                      =========================================
                      = Email End
                      =========================================
                      */
                  SizedBox(
                    height: 20.h,
                  ),
                  /*
                      =========================================
                      = Phone Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: signupController.phoneController,
                    focusNode: signupController.phoneFocusNode,
                    validator: (phoneValue) {
                      var msg = validator.validatePhone(phoneValue);
                      return msg;
                    },
                    onSaved: (phoneValue) {
                      signupController.setPhone(phoneValue);
                    },
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(signupController.passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'Phone',
                    obscureText: false,
                    textInputType: TextInputType.phone,
                  ),
                  /*
                      =========================================
                      = Phone End
                      =========================================
                      */
                  SizedBox(
                    height: 20.h,
                  ),
                  /*
                      =========================================
                      = Password Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: signupController.passwordController,
                    focusNode: signupController.passwordFocusNode,
                    validator: (passwordVal) {
                      var msg = validator.validatePhone(passwordVal);
                      return msg;
                    },
                    onSaved: (passwordValue) {
                      signupController.setPassword(passwordValue);
                    },
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(signupController.repeatPasswordFocusNode),
                    textInputAction: TextInputAction.next,
                    labelText: 'Password',
                    obscureText:
                        signupController.isPasswordVisible ? false : true,
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      icon: signupController.isPasswordVisible
                          ? Image.asset(
                              IconsAssets.eye,
                              color: MyColors.mainColor,
                              width: 24,
                            )
                          : Image.asset(
                              IconsAssets.eyeClosed,
                              color: MyColors.mainColor,
                              width: 24,
                            ),
                      onPressed: () {
                        signupController.isPasswordVisible;
                      },
                    ),
                  ),
                  /*
                      =========================================
                      = Password End
                      =========================================
                      */
                  SizedBox(
                    height: 20.h,
                  ),
                  /*
                      =========================================
                      = Repeat Password Start
                      =========================================
                      */
                  CustomTextFormField(
                    controller: signupController.repeatPasswordController,
                    focusNode: signupController.repeatPasswordFocusNode,
                    textInputAction: TextInputAction.done,
                    validator: (repeatPasswordVal) {
                      var msg = validator.validatePhone(repeatPasswordVal);
                      if (msg == null) {
                        if (signupController.passwordValue !=
                            signupController.repeatPasswordValue) {
                          return 'Password not match';
                        } else {
                          return null;
                        }
                      } else {
                        return msg;
                      }
                    },
                    onSaved: (repeatPasswordValue) {
                      signupController.passwordValue == repeatPasswordValue
                          ? signupController
                              .setRepeatPassword(repeatPasswordValue)
                          : null;
                    },
                    labelText: 'Repeat Password',
                    obscureText:
                        signupController.isRepeatPasswordVisible ? false : true,
                    textInputType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      icon: signupController.isRepeatPasswordVisible
                          ? Image.asset(
                              IconsAssets.eye,
                              color: MyColors.mainColor,
                              width: 24,
                            )
                          : Image.asset(
                              IconsAssets.eyeClosed,
                              color: MyColors.mainColor,
                              width: 24,
                            ),
                      onPressed: () {
                        signupController.isRepeatPasswordVisible;
                      },
                    ),
                  ),
                  /*
                      =========================================
                      = Repeat Password End
                      =========================================
                      */
                  SizedBox(
                    height: 10.h,
                  ),
                  /*
                      =========================================
                      = I Accept all Terms Start
                      =========================================
                      */
                  Row(
                    children: [
                      Checkbox(
                        value: signupController.isChecked,
                        onChanged: (value) {
                          signupController.isChecked;
                        },
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        visualDensity: VisualDensity.compact,
                      ),
                      Text(
                        'I Accept all ',
                        style: MyStyles.textStyle12
                            .copyWith(color: MyColors.mainColor),
                      ),
                      InkWell(
                          child: Text(
                        "Terms, conditions and privacy policy",
                        style: MyStyles.textStyle14.copyWith(
                            color: MyColors.blue, fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                  /*
                      =========================================
                      = Repeat Password Ends
                      =========================================
                      */
                  const SizedBox(
                    height: 50,
                  ),
                  /*
                      ==========================
                      = The Login Button Starts
                      ===========================
                      */
                  MainButton(
                      backgroundColor: MyColors.mainColor,
                      textColor: MyColors.white,
                      text: "Sign Up",
                      onPressed: () {
                        signupController.register(auth, context);
                      }),
                  /*
                      ========================
                      = The Login Button Ends
                      ========================
                      */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
