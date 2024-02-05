import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/controller/model_class_controller.dart';
import 'package:wedding_gift/controller/search_controller.dart';
import 'package:wedding_gift/model/guest_gift.dart';

class GuestCard extends StatelessWidget {
  const GuestCard({super.key, required this.guestGift});
  // final String name;
  final GuestGift guestGift;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        searchingcontroller.showGusetDetails(guestGift, context);
      },
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // color: const Color.fromARGB(255, 199, 112, 33),
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          child: GetBuilder<SearchingController>(builder: (mController) {
            return Row(
              children: [
                Text(
                  guestGift.name,
                  style:
                      const TextStyle(color: Colors.black, letterSpacing: 0.7),
                ),
                const Spacer(),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    mController.editBottomSheet(context, guestGift);
                  },
                  child: const Icon(Icons.edit),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    mController.deleteItem(guestGift, context);
                  },
                  child: const Icon(
                    Icons.delete,
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
