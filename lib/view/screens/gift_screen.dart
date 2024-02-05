import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/controller/model_class_controller.dart';
import 'package:wedding_gift/model/guest_gift.dart';
import 'package:wedding_gift/view/widgests/guest/guest_list_with_gift_type_filter.dart';

class GiftScreen extends StatelessWidget {
  const GiftScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool dip) {
        bottomNavController.backToHomeScreen();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Guest List with Gift',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: fontColorHeading),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<ModelClassController>(
              //without GetBuilder data will not live update in this gift screen
              builder: (modelController) {
            return GuestListWithGiftTypeFilter(
              giftType: modelController.filterGuestGiftType(GiftType.gift),
            );
          }),
        ],
      ),
    );
  }
}
