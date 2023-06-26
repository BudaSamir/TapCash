import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import 'package:tap_cash/models/user_models.dart';
import 'package:tap_cash/view/screens/layout/history_screen.dart';
import 'package:tap_cash/view/screens/layout/transfer_screen.dart';
import 'package:tap_cash/view/screens/layout/user_screen.dart';
import '../../../view/screens/layout/home_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  static LayoutCubit get(context) => BlocProvider.of(context);

  var currentIndex = 0;
  List<String> titles = [];

  // List<Widget> screensMethod(User userInfo) {
  //   return [
  //     HomeScreen(userInfo),
  //     TransferScreen(),
  //     HistoryScreen(),
  //     UserScreen(),
  //   ];
  // }

  List<Widget>screens = [
    HomeScreen(),
    TransferScreen(),
    HistoryScreen(),
    UserScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Image.asset(
        IconsAssets.bank,
        width: 24,
        height: 24,
      ),
      label: 'Home',
      activeIcon: Image.asset(
        IconsAssets.bankFilled,
        width: 24,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconsAssets.transfer,
        width: 24,
        height: 24,
      ),
      label: 'Transfer',
      activeIcon: Image.asset(
        IconsAssets.transferFilled,
        width: 24,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconsAssets.history,
        width: 24,
        height: 24,
      ),
      label: 'Transactions',
      activeIcon: Image.asset(
        IconsAssets.historyFilled,
        width: 24,
      ),
    ),
    BottomNavigationBarItem(
      icon: Image.asset(
        IconsAssets.user,
        width: 24,
        height: 24,
      ),
      label: 'Me',
      activeIcon: Image.asset(
        IconsAssets.userFilled,
        width: 24,
      ),
    ),
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
}
