import 'package:blur/blur.dart'; // to make a blur text
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart'; //for date locale
import 'package:intl/intl.dart';
import 'package:tap_cash/view/widgets/wallet_screen/wallet_screen_custom_appbar.dart';
import '../../../constants/assets_manager.dart';
import '../../../constants/colors_manager.dart';
import '../../../constants/styles_manager.dart';
import '../../../controller/cubit/wallet_cubit/wallet_cubit.dart';

class WalletScreenUpperSection extends StatefulWidget {
  const WalletScreenUpperSection({Key? key}) : super(key: key);

  @override
  State<WalletScreenUpperSection> createState() =>
      _WalletScreenUpperSectionState();
}

class _WalletScreenUpperSectionState extends State<WalletScreenUpperSection> {


  @override
  void initState() {
    initializeDateFormatting(); // Initial dateFormatter package before Run code.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit(),
      child: BlocConsumer<WalletCubit, WalletState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          var walletCubit = BlocProvider.of<WalletCubit>(context);
          return Stack(
            children: [
              // NavyBlue background.
              Image.asset(
                ImageAssets.background,
                fit: BoxFit.fill,
                width: 600.h,
              ),
              // wallet upper info. --> total balance - current date - current time
              Column(
                children: [
                  const WalletScreenCustomAppbar(),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Total Balance',
                            style: MyStyles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold,
                              color: MyColors.white,
                            ),
                          ),
                          // Eye icon to change text visibility if user wanna blur his total balance
                          IconButton(
                            onPressed: () {
                              walletCubit.changeBlurText();
                            },
                            icon: Image.asset(
                              walletCubit.isBlur ? IconsAssets.eyeClosed : IconsAssets
                                  .eye,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        child: walletCubit.isBlur
                            ? Blur(
                          blur: 9.2,
                          blurColor: MyColors.mainColor.withOpacity(.5),
                          child: Text(
                            'EGP ${walletCubit.totalBalance.toString()}',
                            style: MyStyles.textStyle36,
                          ),
                        )
                            : Text(
                          'EGP ${walletCubit.totalBalance.toString()}',
                          style: MyStyles.textStyle36,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // current date with 10 May 2023 format
                          Text(
                            DateFormat('d MMM yyyy').format(
                              DateTime.now(),
                            ),
                            style: MyStyles.textStyle16
                                .copyWith(color: MyColors.white),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Image.asset(
                            IconsAssets.clock,
                            width: 16,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          // current time
                          Text(
                            DateFormat('h:mm a').format(
                              DateTime.now(),
                            ),
                            style: MyStyles.textStyle16
                                .copyWith(color: MyColors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
