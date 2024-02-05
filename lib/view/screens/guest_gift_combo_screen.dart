import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/controller/model_class_controller.dart';
import 'package:wedding_gift/model/guest_gift.dart';
import 'package:wedding_gift/view/widgests/guest/guest_list_with_gift_type_filter.dart';

class GuestGiftCombo extends StatelessWidget {
  const GuestGiftCombo({super.key});

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
            'Guest List with both money and gift',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: fontColorHeading),
          ),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<ModelClassController>(
              //without GetBuilder data will not live update in this combo screen
              builder: (modelController) {
            return GuestListWithGiftTypeFilter(
              giftType: modelController.filterGuestGiftType(GiftType.combo),
            );
          }),
        ],
      ),
    );
  }
}
