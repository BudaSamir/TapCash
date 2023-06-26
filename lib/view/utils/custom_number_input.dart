import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../constants/assets_manager.dart';
import '../../constants/colors_manager.dart';
import '../../constants/styles_manager.dart';

class CustomNumbersInput extends StatefulWidget {
  const CustomNumbersInput({Key? key}) : super(key: key);

  @override
  State<CustomNumbersInput> createState() => _CustomNumbersInputState();
}

class _CustomNumbersInputState extends State<CustomNumbersInput> {
  List<int> number = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
  ];
  int zero = 0;
  List<String> result = [];
  var activeCodenum = 0;
  List<bool> activeCode = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  late String passCode;
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  @override
  Widget build(BuildContext context) {
    // return
    // SizedBox(
    //   height: 600,
    //   child:
    // ScreenLock(correctString: '123456', onUnlocked: (){},));
    // return SizedBox(
    //   height: 700,
    //   child: PasscodeScreen(
    //     backgroundColor: Colors.transparent,
    //     title: const Text(''),
    //       passwordEnteredCallback: (String enterPassword) {},
    //       cancelButton: Text('cancel'),
    //       deleteButton: Text('delete'),
    //       shouldTriggerVerification: _verificationNotifier.stream,
    //     circleUIConfig: const CircleUIConfig(
    //       borderColor: Colors.grey,
    //       fillColor: MyColors.blue,
    //       circleSize: 16
    //     ),
    //     keyboardUIConfig: const KeyboardUIConfig(
    //       digitTextStyle: MyStyles.textStyle24,
    //     ),
    //   ),
    // );
    return Column(children: [
      SizedBox(
        height: 50,
        width: double.infinity,
        child: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: activeCode.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: activeCode[index] == true
                        ? const Color(0xFF26BAEE)
                        : const Color(0xFFEAEEF1),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      const SizedBox(height: 25),
      SizedBox(
        height: 450,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 40,
            mainAxisExtent: 90,
          ),
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return index == 9
                ? Text(
                    'Forget?',
                    textAlign: TextAlign.center,
                    style: MyStyles.textStyle10.copyWith(
                      color: MyColors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : index == 10
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            if (result.length < 6) {
                              result.add(zero.toString());
                              activeCode[activeCodenum++] = true;
                              print(result.join());
                            }
                          });
                        },
                        child: Text(
                          zero.toString(),
                          textAlign: TextAlign.center,
                          style: MyStyles.textStyle20.copyWith(
                            color: MyColors.mainColor,
                          ),
                        ),
                      )
                    : index == 11
                        ? Container(
                            alignment: Alignment.topCenter,
                            child: Image.asset(IconsAssets.fingerPrint00))
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                if (result.length < 6) {
                                  result.add([number[index]].toString());
                                  activeCode[activeCodenum++] = true;
                                  print(result.join());
                                }
                              });
                            },
                            child: Text(
                              number[index].toString(),
                              textAlign: TextAlign.center,
                              style: MyStyles.textStyle20.copyWith(
                                color: MyColors.mainColor,
                              ),
                            ),
                          );
          },
        ),
      ),
    ]);
  }
}
