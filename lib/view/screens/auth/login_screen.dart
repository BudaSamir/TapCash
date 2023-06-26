import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';
import 'package:tap_cash/controller/auth_controllers/login_controller.dart';
import 'package:tap_cash/providers/auth_provider.dart';
import 'package:tap_cash/utility/shared_preference.dart';
import 'package:tap_cash/view/utils/custom_text_form_field.dart';
import 'package:tap_cash/view/utils/main_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // _getRememberMe();
    super.initState();
  }

  // _getRememberMe() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     _rememberMe = preferences.getBool('rememberMe') ?? false;
  //     if (_rememberMe) {
  //       _emailController.text = preferences.getString('email') ?? '';
  //       _passwordController.text = preferences.getString('password') ?? '';
  //     }
  //   });
  // }

  // _saveRememberMe(bool value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('rememberMe', value);
  //   if (!value) {
  //     await prefs.remove('email');
  //     await prefs.remove('password');
  //   }
  // }

  // _saveCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('email', _emailController.text);
  //   await prefs.setString('password', _passwordController.text);
  // }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final loginController = Provider.of<LoginController>(context);
    final userPerferences = Provider.of<UserPerferences>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          //HEAD
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Welcome, Dear',
                    style: MyStyles.textStyle20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(90.0),
                  child: Image.asset(
                    ImageAssets.key,
                    width: 150.w,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 1,
                      color: MyColors.mainColor,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset(
                      IconsAssets.google,
                      width: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Or',
                      style: MyStyles.textStyle12.copyWith(
                        color: MyColors.mainColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 1,
                      color: MyColors.mainColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Form(
                  key: loginController.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        controller: loginController.emailController,
                        focusNode: loginController.emailFocusNode,
                        validator: (emailValue) => emailValue!.isEmpty
                            ? 'Please Enter Your Email'
                            // : !RegExp(r'^[\w-\.]+@([\w-]+\.)+\w{2,4}')
                            //         .hasMatch(emailValue)
                            //     ? 'Enter correct Email'
                            : null,
                        onSaved: (emailValue) {
                          loginController.setEmail(emailValue);
                        },
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(loginController.phoneFocusNode),
                        textInputAction: TextInputAction.next,
                        labelText: 'Email',
                        obscureText: false,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomTextFormField(
                        controller: loginController.passwordController,
                        focusNode: loginController.passwordFocusNode,
                        validator: (passwordValue) => passwordValue!.isEmpty
                            ? 'Please Enter Your Password'
                            // : !RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
                            //         .hasMatch(passwordValue)
                            //     ? 'Enter correct password'
                            : null,
                        onSaved: (passwordVal) {
                          loginController.setPassword(passwordVal);
                          // userPerferences.saveUser(user, AppRouter.loginScreen);
                        },
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(
                                loginController.repeatPasswordFocusNode),
                        textInputAction: TextInputAction.next,
                        labelText: 'Password',
                        obscureText:
                            loginController.isPasswordVisible ? false : true,
                        suffixIcon: IconButton(
                          icon: loginController.isPasswordVisible
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
                          onPressed: loginController.passwordVisiblity,
                        ),
                        textInputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // <<<<<<< HEAD
                          Row(
                            children: [
                              Checkbox(
                                value: loginController.isChecked,
                                onChanged: (value) {
                                  loginController.selectCheckBox(value);
                                },
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                visualDensity: VisualDensity.compact,
                              ),
                              Text(
                                'Remember me',
                                style: MyStyles.textStyle14
                                    .copyWith(color: MyColors.mainColor),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).pushReplacement(
                                  AppRouter.verificationScreen);
                            },
                            child: Text(
                              'Forgot password?',
                              style: MyStyles.textStyle14.copyWith(
                                color: MyColors.mainColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                    ],
                  ),
                ),
                /*
                        ===========================
                        = The Login Button Starts
                        ===========================
                        */
                MainButton(
                    backgroundColor: MyColors.mainColor,
                    textColor: MyColors.white,
                    text: "Login",
                    onPressed: () {
                      loginController.login(auth, context);
                    }),
                /*
                        ========================
                         = The Login Button Ends
                        ========================
                        */
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account, ',
                      style:
                          MyStyles.textStyle14.copyWith(color: MyColors.grey),
                    ),
                    InkWell(
                      onTap: () => GoRouter.of(context)
                          .pushReplacement(AppRouter.signupScreen),
                      child: Text(
                        "Sign Up ?",
                        style: MyStyles.textStyle14.copyWith(
                            color: MyColors.mainColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: MyColors.babyBlue,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: const Text(
                          'As a son',
                          style: MyStyles.textStyle20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRouter.layout);
                      },
                      child: const Text(
                        'Skip',
                        style: MyStyles.textStyle20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
