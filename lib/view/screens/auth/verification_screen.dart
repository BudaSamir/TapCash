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
import 'package:tap_cash/view/utils/custom_text_form_field.dart';
import 'package:tap_cash/view/utils/main_button.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final resetController = Provider.of<ResetController>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Form(
              key: resetController.verificationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*
                  =========================================
                  = Verification Screen Header Start
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
                        'Verification',
                        style: MyStyles.textStyle20
                            .copyWith(color: MyColors.mainColor),
                      ),
                    ],
                  ),
                  /*
                  =========================================
                  = Verification Screen Header Start
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
                    'We Will Send You a Verification code to your E-mail',
                    style: MyStyles.textStyle20
                        .copyWith(color: MyColors.mainColor),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  /*
                  =========================================
                  = Email Start
                  =========================================
                  */
                  CustomTextFormField(
                    controller: resetController.emailController,
                    focusNode: resetController.emailFocusNode,
                    validator: (emailvalue) {
                      if (emailvalue!.isEmpty) {
                        return 'Enter correct Email';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (emailValue) {
                      resetController.setEmail(emailValue);
                    },
                    textInputAction: TextInputAction.done,
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
                  ==========================
                  = The Login Button Starts
                  ===========================
                  */
                  MainButton(
                    text: "Send",
                    onPressed: () {
                      resetController.verification(
                        auth: auth,
                        context: context,
                      );
                    },
                    backgroundColor: MyColors.mainColor,
                    textColor: MyColors.white,
                  ),
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
