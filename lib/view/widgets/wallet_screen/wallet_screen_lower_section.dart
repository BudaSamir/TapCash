import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tap_cash/controller/cubit/wallet_cubit/wallet_cubit.dart';
import '../../../constants/assets_manager.dart';
import '../../../constants/colors_manager.dart';
import '../../../constants/styles_manager.dart';
import '../../../models/money_data.dart';

class WalletScreenLowerSection extends StatefulWidget {
  const WalletScreenLowerSection({Key? key}) : super(key: key);

  @override
  State<WalletScreenLowerSection> createState() =>
      _WalletScreenLowerSectionState();
}

class _WalletScreenLowerSectionState extends State<WalletScreenLowerSection> {
  bool isIncome = true;
  bool isSpend = true;
  List<MoneyData> chartData1 = <MoneyData>[
    MoneyData('Jan', 80),
    MoneyData('Feb', 85),
    MoneyData('Mar', 10),
    MoneyData('Apr', 30),
    MoneyData('May', 50),
    MoneyData('June', 70),
    MoneyData('July', 20),
    MoneyData('Aug', 40),
    MoneyData('Sep', 10),
    MoneyData('Oct', 40),
    MoneyData('Nov', 90),
    MoneyData('Dec', 60),
  ];

  List<MoneyData> chartData2 = <MoneyData>[
    MoneyData('Jan', 20),
    MoneyData('Feb', 32),
    MoneyData('Mar', 25),
    MoneyData('Apr', 20),
    MoneyData('May', 28),
    MoneyData('June', 70),
    MoneyData('July', 20),
    MoneyData('Aug', 40),
    MoneyData('Sep', 40),
    MoneyData('Oct', 40),
    MoneyData('Nov', 40),
    MoneyData('Dec', 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: BlocConsumer<WalletCubit, WalletState>(
        listener: (context, state) {},
        builder: (context, state) {
          WalletCubit cubit = BlocProvider.of(context);
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        cubit.year--;
                      });
                    },
                    child: Image.asset(
                      IconsAssets.arrowBack0,
                      width: 7,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    cubit.year.toString(),
                    style: MyStyles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: cubit.year == DateTime.now().year
                            ? MyColors.mainColor
                            : MyColors.grey),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        cubit.year < DateTime.now().year
                            ? cubit.year++
                            : cubit.year = DateTime.now().year;
                      });
                    },
                    child: Image.asset(
                      IconsAssets.arrowForward0,
                      width: 7,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 42,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isIncome = false;
                            isSpend = true;
                          });
                        },
                        child: Container(
                          width: 110,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isSpend && isIncome == false
                                ? MyColors.mintGreen
                                : MyColors.white,
                            border:
                                Border.all(color: MyColors.mainColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: MyColors.mintGreen,
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'SPEND',
                                style: MyStyles.textStyle16.copyWith(
                                  color: MyColors.mainColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isIncome = true;
                            isSpend = false;
                          });
                        },
                        child: Container(
                          width: 110,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isIncome && isSpend == false
                                ? MyColors.rose
                                : MyColors.white,
                            border:
                                Border.all(color: MyColors.mainColor, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: MyColors.rose,
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'INCOME',
                                style: MyStyles.textStyle16.copyWith(
                                  color: MyColors.mainColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSpend = true;
                        isIncome = true;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isSpend == false || isIncome == false
                            ? MyColors.white
                            : MyColors.mainColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: MyColors.mainColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Total',
                          style: MyStyles.textStyle16.copyWith(
                            color: isSpend == false || isIncome == false
                                ? MyColors.mainColor
                                : MyColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series: <StackedLineSeries<MoneyData, String>>[
                  StackedLineSeries<MoneyData, String>(
                    isVisible:
                        cubit.year < DateTime.now().year ? false : isSpend,
                    color: MyColors.mintGreen,
                    width: 2,
                    dataSource: chartData1,
                    xValueMapper: (MoneyData money, _) => money.month,
                    yValueMapper: (MoneyData money, _) => money.money,
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.circle,
                      borderWidth: 5,
                      color: MyColors.mintGreen,
                    ),
                    name: 'Spend',
                  ),
                  StackedLineSeries<MoneyData, String>(
                    isVisible:
                        cubit.year < DateTime.now().year ? false : isIncome,
                    color: MyColors.rose,
                    width: 2,
                    dataSource: chartData2,
                    xValueMapper: (MoneyData money, _) => money.month,
                    yValueMapper: (MoneyData money, _) => money.money,
                    markerSettings: const MarkerSettings(
                      isVisible: true,
                      shape: DataMarkerType.circle,
                      borderWidth: 5,
                      color: MyColors.rose,
                    ),
                    name: 'Income',
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "\"To know the total value of conversion operations during a specific month, select either incomes or spends first, and then click on the corresponding month or month's circle.\"",
                style: MyStyles.textStyle16.copyWith(
                  color: MyColors.mainColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
