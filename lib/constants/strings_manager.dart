import 'package:flutter/material.dart';

class StringsManager with ChangeNotifier {
  static const String appName = 'Tap Cash';
  /*
  ========================================
  ====== OnBoarding Strings Start ========
  ========================================
  */
  //  OnBoarding Screen Name
  static const String onBoardScreen = '/onBoardingScreen';
  String get getonBoardScreen => onBoardScreen;
  //  OnBoarding Screen Titles
  static const String onboard1Title = 'Smart wallet';
  static const String onboard2Title = 'Smart Card';
  static const String onboard3Title = 'Child\'s money management';
  static const String onboard4Title = 'House\'s money management';
  static const String onboard5Title = 'Debts';
  static const String onboard6Title = 'Donation & Helps';
  //  OnBoarding Screen texts
  static const String onboard1Text =
      'Can add and send money and budget tracking.';
  static const String onboard2Text =
      'Can use smart cards financial transactions, healthcare, transportation, and other applications that require authentication and buy any thing.';
  static const String onboard3Text =
      'Parents can transfer money to their children, track their expenses, and restrict certain purchases in a positive and modern way. This can also teach parents how to manage their own finances.';
  static const String onboard4Text =
      'Tap Cash can help you organize and keep track of your household expenses, as well as provide tips on how to save money and manage your finances properly. We can also create a shopping list of items you want to purchase to help you stay within your budget.';
  static const String onboard5Text =
      'We can help you keep track of your debts by recording them with the amount owed and to whom. When you make a payment through Tap cash or any other means, we can also record the payment and update your debt\n records accordingly.';
  static const String onboard6Text =
      'Tap cash can help you find trustworthy charities to make donations to, and you can also transfer money anonymously to any account without disclosing your identity. The recipient of the transferred money can choose to return or reject the transfer if they wish.';

  Map<String, dynamic> onboarding = {
    "titles": [
      onboard1Title,
      onboard2Title,
      onboard3Title,
      onboard4Title,
      onboard5Title,
      onboard6Title,
    ],
    "texts": [
      StringsManager.onboard1Text,
      StringsManager.onboard2Text,
      StringsManager.onboard3Text,
      StringsManager.onboard4Text,
      StringsManager.onboard5Text,
      StringsManager.onboard6Text,
    ],
  };

  /*
  ========================================
  ====== OnBoarding Strings Ends =========
  ========================================
  */

  dynamic stringsProvider(String screenName) {
    switch (screenName) {
      case onBoardScreen:
        return onboarding;
    }
  }
}
