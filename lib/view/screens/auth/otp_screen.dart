import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';
import 'package:tap_cash/controller/auth_controllers/reset_controller.dart';
import 'package:tap_cash/providers/auth_provider.dart';
import 'package:tap_cash/view/utils/main_button.dart';

import '../../utils/custom_text_field.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // final _formKey = GlobalKey<FormState>();
  // final _oneController = TextEditingController();
  // final _twoController = TextEditingController();
  // final _threeController = TextEditingController();
  // final _fourController = TextEditingController();
  // final _fiveController = TextEditingController();
  // final _oneFocusNode = FocusNode();
  // final _twoFocusNode = FocusNode();
  // final _threeFocusNode = FocusNode();
  // final _fourFocusNode = FocusNode();
  // final _fiveFocusNode = FocusNode();

  // String? userEmail = " najwaA99@gmail.com";

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final resetController = Provider.of<ResetController>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: resetController.otpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*
                  =========================================
                  = OTP Screen  Header Start
                  =========================================
                  */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.signupScreen);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: MyColors.blue,
                          )),
                      Text(
                        'Enter OTP',
                        style: MyStyles.textStyle20
                            .copyWith(color: MyColors.mainColor),
                      ),
                    ],
                  ),
                  /*
                  =========================================
                  = OTP Screen Header Start
                  =========================================
                  */
                  SizedBox(
                    height: 30.h,
                  ),
                  /*
                  =========================================
                  = Verification Screen Image Start
                  =========================================
                  */
                  Padding(
                    padding: const EdgeInsets.all(90.0),
                    child: Image.asset(
                      ImageAssets.key,
                      width: 180.w,
                    ),
                  ),
                  /*
                  =========================================
                  = Verification Screen Image End
                  =========================================
                  */
                  Text(
                    'Please enter 5- digit OTP sent to your Email ${resetController.email}',
                    style: MyStyles.textStyle20
                        .copyWith(color: MyColors.mainColor),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  /*
                  =========================================
                  = OTP Digits Start
                  =========================================
                  */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(
                        controller: resetController.oneController,
                        focusNode: resetController.oneFocusNode,
                        validator: (valueOne) {
                          valueOne!.isEmpty ? 'Enter First Digit' : null;
                          return null;
                        },
                        onSaved: (valueOne) {
                          resetController.setOTPText(valueOne);
                        },
                      ),
                      CustomTextField(
                        controller: resetController.twoController,
                        focusNode: resetController.twoFocusNode,
                        validator: (twoValue) {
                          twoValue!.isEmpty ? 'Enter Second Digit' : null;
                          return null;
                        },
                        onSaved: (twoValue) {
                          resetController.setOTPText(twoValue);
                        },
                      ),
                      CustomTextField(
                        controller: resetController.threeController,
                        focusNode: resetController.threeFocusNode,
                        validator: (threeValue) {
                          threeValue!.isEmpty ? 'Enter Third Digit' : null;
                          return null;
                        },
                        onSaved: (threeValue) {
                          resetController.setOTPText(threeValue);
                        },
                      ),
                      CustomTextField(
                        controller: resetController.fourController,
                        focusNode: resetController.fourFocusNode,
                        validator: (fourValue) {
                          fourValue!.isEmpty ? 'Enter Fourth Digit' : null;
                          return null;
                        },
                        onSaved: (fourValue) {
                          resetController.setOTPText(fourValue);
                        },
                      ),
                      CustomTextField(
                        controller: resetController.fiveController,
                        focusNode: resetController.fiveFocusNode,
                        validator: (fiveValue) {
                          fiveValue!.isEmpty ? 'Enter Fifth Digit' : null;
                          return null;
                        },
                        onSaved: (fiveValue) {
                          resetController.setOTPText(fiveValue);
                        },
                      ),
                      CustomTextField(
                        controller: resetController.sixController,
                        focusNode: resetController.sixFocusNode,
                        validator: (sixValue) {
                          sixValue!.isEmpty ? 'Enter Fifth Digit' : null;
                          return null;
                        },
                        onSaved: (sixValue) {
                          resetController.setOTPText(sixValue);
                        },
                      ),
                    ],
                  ),

                  /*
                  =========================================
                  = OTP Digits End
                  =========================================
                  */
                  SizedBox(
                    height: 20.h,
                  ),

                  /*
                  ==========================
                  = The Login Button Starts
                  ===========================
                  */
                  MainButton(
                      backgroundColor: MyColors.mainColor,
                      textColor: MyColors.white,
                      text: "Send",
                      onPressed: () {
                        resetController.otpMethod(
                          auth: auth,
                          context: context,
                        );
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
