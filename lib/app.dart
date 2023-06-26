import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'controller/cubit/layout_cubit/layout_cubit.dart';
import 'controller/cubit/wallet_cubit/wallet_cubit.dart';

class TapCash extends StatelessWidget {
  const TapCash({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => LayoutCubit()),
        BlocProvider(create: (BuildContext context) => WalletCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 811),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: MyColors.mainColor,
            ),
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
