import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_gift/controller/model_class_controller.dart';
import 'package:wedding_gift/view/widgests/guest/guest_card.dart';

class GuestList extends StatelessWidget {
  const GuestList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.55,
      child: GetBuilder<ModelClassController>(builder: (modelController) {
        final guest = modelController.allTypesGuest;
        return guest.isNotEmpty
            ? ListView.builder(
                itemCount: guest.length,
                itemBuilder: (context, index) {
                  return GuestCard(
                    guestGift:guest[index],
                  );
                },
              )
            : const Center(
                child: Text(
                  'No data found!',
                  style: TextStyle(fontSize: 24),
                ),
              );
      }),
    );
  }
}
