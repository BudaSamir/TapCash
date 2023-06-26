import 'package:flutter/material.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';

import '../../../constants/colors_manager.dart';

class HomeCustomAppBar extends StatelessWidget {
  String? name;
  HomeCustomAppBar({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Hi, $name',
          style: MyStyles.textStyle20.copyWith(
            color: MyColors.mainColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            IconsAssets.menu,
            width: 24,
          ),
        ),
      ],
    );
  }
}
