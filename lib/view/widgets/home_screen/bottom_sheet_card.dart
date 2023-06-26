import 'package:flutter/material.dart';

import '../../../constants/colors_manager.dart';
import '../../../constants/styles_manager.dart';
import '../../utils/custom_divider.dart';

class BottomSheetCard extends StatelessWidget {
  const BottomSheetCard({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
    required this.title2,
    required this.title3,
    required this.onTap,
  }) : super(key: key);

  final String leading;
  final String title;
  final String title2;
  final String title3;
  final String trailing;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap(),
          child: ListTile(
            leading: Image.asset(
              leading,
              width: 48,
            ),
            title: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: title,
                    style: MyStyles.textStyle16
                        .copyWith(color: MyColors.mainColor),
                  ),
                  TextSpan(
                    text: title2,
                    style: MyStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold, color: MyColors.mainColor),
                  ),
                  TextSpan(
                    text: title3,
                    style: MyStyles.textStyle16
                        .copyWith(color: MyColors.mainColor),
                  ),
                ],
              ),
            ),
            trailing: Image.asset(
              trailing,
              width: 24,
            ),
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const CustomDivider(),
      ],
    );
  }
}
