import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/controller/model_class_controller.dart';
import 'package:wedding_gift/model/guest_gift.dart';
import 'package:wedding_gift/view/widgests/chart/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({
    super.key,
  });

  //chart data
  List<GuestGiftBucket> get bucket {
    return [
      GuestGiftBucket.categoryGuest(
          modelClassController.listofGuest(), GiftType.gift),
      GuestGiftBucket.categoryGuest(
          modelClassController.listofGuest(), GiftType.money),
      GuestGiftBucket.categoryGuest(
          modelClassController.listofGuest(), GiftType.combo),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 8,
      ),
      height: 180,
      decoration: const BoxDecoration(
        color: charBarBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GetBuilder<ModelClassController>(
              builder: (_modelClassController) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    for (final buckets in bucket)
                      ChartBar(
                          fill: buckets.categoryGuest.isEmpty
                              ? 0
                              : buckets.categoryGuest.length /
                                  _modelClassController.totalGuest)
                  ],
                );
              }
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: bucket
                .map((buckets) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 0),
                        child: Icon(
                          categoryIcons[buckets.giftType],
                          size: 30,
                          color: const Color.fromARGB(255, 68, 35, 16),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
