import 'package:flutter/material.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/models/user_models.dart';
import 'package:tap_cash/view/widgets/home_screen/home_grid_view.dart';
import '../../utils/home_middle_card.dart';
import '../../widgets/home_screen/Home_custom_app_bar.dart';
import '../../widgets/home_screen/home_lower_screen.dart';
import '../../widgets/home_screen/home_upper_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(/*this.userInfo,*/ {super.key});

  // final User userInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              // child: HomeCustomAppBar(
              //   name: "${userInfo.firstName}",
              // ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: HomeUpperSection(),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: HomeGridView(),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: HomeMiddleSectionCard(
                icon: IconsAssets.wannaThank2,
                text: 'Wanna send thank!',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: HomeLowerSection(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: MyColors.mainColor,
          ),
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        backgroundColor: MyColors.white,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Image.asset(
              IconsAssets.ask,
              width: 32,
            ),
          ),
        ),
      ),
    );
  }
}
