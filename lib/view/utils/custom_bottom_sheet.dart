import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import '../../constants/styles_manager.dart';
import '../widgets/home_screen/bottom_sheet_card.dart';
import 'custom_divider.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600.h,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Text(
              'Select how to add money to your Tap Cash account',
              style: MyStyles.textStyle20.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            const CustomDivider(),
            const SizedBox(
              height: 16,
            ),
            BottomSheetCard(
              leading: IconsAssets.instaPay,
              title: 'Receive ',
              title2: 'InstaPay ',
              title3: 'transfer',
              trailing: IconsAssets.running,
              onTap: () {

              },
            ),
            BottomSheetCard(
              leading: IconsAssets.telda,
              title: 'Receive ',
              title2: 'Telda ',
              title3: 'transfer',
              trailing: IconsAssets.running,
              onTap: () {},
            ),
            BottomSheetCard(
              leading: IconsAssets.orangeCash,
              title: 'Receive ',
              title2: 'Orange Cash ',
              title3: 'transfer',
              trailing: IconsAssets.running,
              onTap: () {},
            ),
            BottomSheetCard(
              leading: IconsAssets.fawry,
              title: 'Add cash through',
              title2: 'Fawry ',
              title3: '',
              trailing: IconsAssets.running,
              onTap: () {},
            ),
            BottomSheetCard(
              leading: IconsAssets.localBank,
              title: 'Receive ',
              title2: 'Any local bank ',
              title3: 'transfer',
              trailing: IconsAssets.runner,
              onTap: () {},
            ),
            BottomSheetCard(
              leading: IconsAssets.tapCash,
              title: 'Request from ',
              title2: 'Tap Cash ',
              title3: 'friends',
              trailing: IconsAssets.running,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}