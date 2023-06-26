import 'package:flutter/material.dart';
import 'package:tap_cash/constants/colors_manager.dart';

import '../../widgets/child_username_screen/child_username_lower_section.dart';
import '../../widgets/child_username_screen/child_username_upper_section.dart';

class ChildUsername extends StatelessWidget {
  const ChildUsername({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ChildUsernameUpperSection(),
              ChildUsernameLowerSection(),
            ],
          ),
        ),
      ),
    );
  }
}
