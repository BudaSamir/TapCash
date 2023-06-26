import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/constants/colors_manager.dart';
import 'package:tap_cash/controller/cubit/layout_cubit/layout_cubit.dart';
import 'package:provider/provider.dart';
import '../../../utility/shared_preference.dart';

class LayOut extends StatefulWidget {
  const LayOut({Key? key}) : super(key: key);

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserPerferences>(context);
    return BlocProvider(
      create: (BuildContext context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutState>(
        listener: (context, state) {},
        builder: (context, state) {
          LayoutCubit cubit = BlocProvider.of(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],

            // FutureBuilder(
            //   future: user.getUser(),
            //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //     print(
            //         "=======================================================");
            //     print("this is the Snapshot Data = ${snapshot.data}");
            //     print(
            //         "=======================================================");
            //     return cubit.screensMethod(snapshot.data)[cubit.currentIndex];
            //   },
            // ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomNavBarItems,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              unselectedItemColor: MyColors.mainColor,
              selectedItemColor: MyColors.mainColor,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
