import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tap_cash/constants/assets_manager.dart';
import '../../../constants/colors_manager.dart';
import '../../../constants/styles_manager.dart';

class HomeLowerSection extends StatefulWidget {
  const HomeLowerSection({Key? key}) : super(key: key);

  @override
  State<HomeLowerSection> createState() => _HomeLowerSectionState();
}

class _HomeLowerSectionState extends State<HomeLowerSection> {
  final List<String> texts = [
    'How to save electricity?',
    'How to save electricity?',
    'How to save electricity?',
  ];
  final List<String> icons = [
    IconsAssets.cord,
    IconsAssets.cord,
    IconsAssets.cord,
  ];
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'FAQs',
              style: MyStyles.textStyle20.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              'All',
              style: MyStyles.textStyle16
                  .copyWith(color: MyColors.grey, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            itemCount: texts.length,
            physics: const ScrollPhysics(),
            scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 185,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: MyColors.babyBlue, width: 5)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        texts[index],
                        style: MyStyles.textStyle20,
                      ),
                      Image.asset(
                        icons[index],
                        width: 30,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: texts.length,
          effect: ExpandingDotsEffect(
            activeDotColor: MyColors.babyBlue,
            dotColor: MyColors.lightGrey,
            dotHeight: 3.0.w,
            dotWidth: 3.0.h,
          ),
        ),
      ],
    );
  }
}
