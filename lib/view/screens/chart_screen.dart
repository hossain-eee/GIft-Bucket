import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/controller/model_class_controller.dart';
import 'package:wedding_gift/view/widgests/chart/chart.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ModelClassController>(builder: (_calculationController) {
      return PopScope(
         canPop: false,
      onPopInvoked: (bool dip) {
        bottomNavController.backToHomeScreen();
      },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: bottomNavColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Guest : ${_calculationController.totalGuest}',style: textStyleChartScreen,),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Total Male Guest : ${_calculationController.maleGuestTotal}',style: textStyleChartScreen),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Total Female Guest : ${_calculationController.femaleGuestTotal}',style: textStyleChartScreen),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Total amount : ${_calculationController.totalAmount()}',style: textStyleChartScreen),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          'Total Number of Gift : ${_calculationController.totalGift()}',style: textStyleChartScreen),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Chart(),
          ],
        ),
      );
    });
  }
}
