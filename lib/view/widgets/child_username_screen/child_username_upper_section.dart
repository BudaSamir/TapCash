import 'package:flutter/material.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';

import '../../../constants/assets_manager.dart';

class ChildUsernameUpperSection extends StatelessWidget {
  const ChildUsernameUpperSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Ahmed',
          style: MyStyles.textStyle20
              .copyWith(color: MyColors.green, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Tap Cash glade to have you',
          style: MyStyles.textStyle20
              .copyWith(color: MyColors.mainColor, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 96,
        ),
        Image.asset(
          IconsAssets.specialLove,
          width: 88,
        ),
        SizedBox(
          height: 48,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text:
                    'Your parent wants to take care of you and help\n you to have a modern and better financial life.\n You are ',
                style: MyStyles.textStyle16.copyWith(color: MyColors.mainColor),
              ),
              TextSpan(
                text: 'lucky !',
                style: MyStyles.textStyle16.copyWith(
                    fontWeight: FontWeight.bold, color: MyColors.mainColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
