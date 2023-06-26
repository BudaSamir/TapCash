import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';
import 'package:tap_cash/view/utils/main_button.dart';

import '../../../app_routes.dart';
import '../../../constants/assets_manager.dart';

class ChildUsernameLowerSection extends StatelessWidget {
  const ChildUsernameLowerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'To send a thank to your dad touch the flower',
                  style: MyStyles.textStyle14.copyWith(
                    color: MyColors.mainColor,
                  ),
                ),
                Image.asset(
                  IconsAssets.flower,
                  width: 44,
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        MainButton(
          text: 'Let\'s go',
          onPressed: () {
            GoRouter.of(context).push(AppRouter.childHome);
          },
          backgroundColor: MyColors.green,
          textColor: MyColors.mainColor,
        ),
      ],
    );
  }
}
