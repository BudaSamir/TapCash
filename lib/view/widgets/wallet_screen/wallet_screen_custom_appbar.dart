import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../constants/assets_manager.dart';
import '../../../constants/colors_manager.dart';
import '../../../constants/styles_manager.dart';

class WalletScreenCustomAppbar extends StatelessWidget {
  const WalletScreenCustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: Image.asset(
            IconsAssets.arrowBack1,
            color: MyColors.white,
            width: 16,
          ),
        ),
        Text(
          'Wallet',
          style: MyStyles.textStyle20.copyWith(
            color: MyColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
