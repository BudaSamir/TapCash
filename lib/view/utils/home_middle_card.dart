import 'package:flutter/material.dart';
import '../../constants/colors_manager.dart';
import '../../constants/styles_manager.dart';

class HomeMiddleSectionCard extends StatelessWidget {
  const HomeMiddleSectionCard(
      {Key? key, required this.icon, required this.text, this.notification})
      : super(key: key);

  final String icon;
  final String text;
  final notification;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          // height: 72,
          decoration: BoxDecoration(
            border: Border.all(
              color: MyColors.mainColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: MyStyles.textStyle16.copyWith(
                    color: MyColors.mainColor, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Container(
          child: notification,
        )
      ],
    );
  }
}
