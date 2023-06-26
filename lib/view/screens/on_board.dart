import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tap_cash/app_routes.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import 'package:tap_cash/constants/strings_manager.dart';
import 'package:tap_cash/constants/styles_manager.dart';
import 'package:tap_cash/controller/landing_controllers/onboarding_controller.dart';
import 'package:tap_cash/view/utils/main_button.dart';

import '../../constants/colors_manager.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  void initState() {
    _checkIfSeen();
    super.initState();
  }

  _checkIfSeen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool seen = preferences.getBool('seen') ?? false;
    if (seen) {
      GoRouter.of(context).push(AppRouter.layout);
    } else {
      await preferences.setBool('seen', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = Provider.of<StringsManager>(context);
    final onboard = Provider.of<OnboardingController>(context);
    final pagesContent = strings.stringsProvider(strings.getonBoardScreen);
    final pagesCount = pagesContent['texts'].length;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 4,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 600.h,
                child: PageView.builder(
                  itemCount: pagesCount,
                  controller: onboard.pageController,
                  scrollBehavior: const CupertinoScrollBehavior(),
                  onPageChanged: (index) {
                    setState(() {
                      onboard.currentIndex == index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 75,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index == 0
                                  ? Text(
                                      'Let\'s go',
                                      style: MyStyles.textStyle20.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : InkWell(
                                      child: Image.asset(
                                        IconsAssets.arrowBack,
                                        width: 24,
                                      ),
                                      onTap: () {
                                        onboard.pageToPage(
                                            context: context,
                                            pagesCount: pagesCount,
                                            next: false);
                                      },
                                    ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    IconsAssets.logo2,
                                    width: 46,
                                  ),
                                  Text(
                                    'Tap Cash',
                                    style: MyStyles.textStyle12.copyWith(
                                        color: MyColors.mainColor,
                                        fontWeight: FontWeight.w600),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 80.h,
                        ),
                        Image.asset(
                          onboard.images[index],
                          height: 232.h,
                          width: 260,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(
                          pagesContent["titles"][index],
                          style: MyStyles.textStyle20.copyWith(
                            fontWeight: FontWeight.w600,
                            color: MyColors.mainColor,
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        SizedBox(
                          width: 315.w,
                          child: Text(
                            pagesContent["texts"][index],
                            textAlign: TextAlign.center,
                            style: MyStyles.textStyle16.copyWith(
                              color: MyColors.mainColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SmoothPageIndicator(
                controller: onboard.pageController,
                count: pagesCount,
                effect: WormEffect(
                  activeDotColor: MyColors.green,
                  dotColor: MyColors.lightGrey,
                  dotHeight: 16.0.w,
                  dotWidth: 16.0.h,
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              MainButton(
                text: onboard.currentIndex == pagesCount - 1
                    ? "Get Started"
                    : 'Next',
                onPressed: () {
                  onboard.pageToPage(
                      context: context, pagesCount: pagesCount, next: true);
                },
                backgroundColor: MyColors.mainColor,
                textColor: MyColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
