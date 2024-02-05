import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/controller/text_field_controller.dart';
import 'package:wedding_gift/model/guest_gift.dart';
import 'package:wedding_gift/view/widgests/dropdown/gender_dropdown.dart';
import 'package:wedding_gift/view/widgests/dropdown/gift_item_dropDown.dart';

class GiftInformationField extends StatelessWidget {
  const GiftInformationField({super.key});

  @override
  Widget build(BuildContext context) {
    Widget amountWidgetVariable = TextField(
      controller: textFieldController.amountController,
      maxLines: 1,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          prefixText: '\$',
          label: Text('Amount'),
          labelStyle: TextStyle(color: fontColor, fontSize: 18)),
    );
    Widget giftItemWidgetVariable = TextField(
      controller: textFieldController.giftController,
      maxLines: 1,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          label: Text('Gift Item'),
          labelStyle: TextStyle(color: fontColor, fontSize: 18)),
    );
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Gender'),
            SizedBox(
              width: 5,
            ),
            GenderDropdown(),
            Spacer(),
            Text('Gift type'),
            SizedBox(
              width: 10,
            ),
            GiftItemDropdown(),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: textFieldController.nameController,
          maxLines: 1,
          decoration: const InputDecoration(
              label: Text('Name'),
              labelStyle: TextStyle(color: fontColor, fontSize: 18)),
        ),
        const SizedBox(
          height: 20,
        ),
        GetBuilder<TextFieldController>(builder: (controller) {
          return Column(
            children: [
              if (controller.giftType == GiftType.money) amountWidgetVariable,
              // const Spacer(),
              if (controller.giftType == GiftType.gift) giftItemWidgetVariable,
              if (controller.giftType == GiftType.combo)
                Row(
                  children: [
                    Expanded(
                      child: amountWidgetVariable,
                    ),
                    const Spacer(),
                    Expanded(
                      child: giftItemWidgetVariable,
                    ),
                  ],
                ),
            ],
          );
        }),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          splashColor: appBarFontColor,
          onTap: () {
              FocusScope.of(context)
                .unfocus(); // close keypad when press this button
            modelClassController.addNewGuestGift();

          },
          child: Container(
            decoration: BoxDecoration(
                color: cardColor, borderRadius: BorderRadius.circular(20)),
            width: double.infinity,
            height: 50,
            child: const Center(child: Text('Add')),
          ),
        )
      ],
    );
  }
}
