import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import 'package:tap_cash/constants/strings_manager.dart';

class OnboardingController with ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;

  List<String> images = [
    ImageAssets.wallet,
    ImageAssets.smartCard,
    ImageAssets.adultWithBaby,
    ImageAssets.money,
    ImageAssets.debts,
    ImageAssets.sendMoney
  ];

  pageToPage(
      {required BuildContext context,
      required int pagesCount,
      required bool next}) {
    if (next) {
      // next button
      if (currentIndex < pagesCount - 1) {
        currentIndex++;
        notifyListeners();
        print(currentIndex);

        pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInBack,
        );
      } else {
        GoRouter.of(context).push(AppRouter.loginScreen);
      }
    } else {
      // back button
      if (currentIndex <= pagesCount - 1) {
        currentIndex--;
        notifyListeners();
        print(currentIndex);
        pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInBack,
        );
      } else {
        GoRouter.of(context).push(AppRouter.loginScreen);
      }
    }
  }
}
