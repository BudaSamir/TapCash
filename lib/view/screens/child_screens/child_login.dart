import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';

import '../../../constants/assets_manager.dart';
import '../../../controller/auth_controllers/reset_controller.dart';
import '../../utils/custom_text_field.dart';

class ChildLogin extends StatefulWidget {
  const ChildLogin({Key? key}) : super(key: key);

  @override
  State<ChildLogin> createState() => _ChildLoginState();
}

class _ChildLoginState extends State<ChildLogin> {
  @override
  Widget build(BuildContext context) {
    final resetController = Provider.of<ResetController>(context);
    return Scaffold(
      backgroundColor: MyColors.tintGreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Image.asset(
            IconsAssets.arrowChild,
            width: 16,
          ),
        ),
        title: const Text(
          'Hello sweet!',
          style: MyStyles.textStyle24,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
        child: Center(
          child: Column(
            children: [
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
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'To log in Tap Cash you should take passcode from your dad.',
                  textAlign: TextAlign.center,
                  style: MyStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: MyColors.mainColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Image.asset(
                ImageAssets.door,
                height: 384,
                width: 168,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
