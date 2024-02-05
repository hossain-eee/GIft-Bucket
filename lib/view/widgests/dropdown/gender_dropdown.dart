import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/controller/text_field_controller.dart';
import 'package:wedding_gift/model/guest_gift.dart';

class GenderDropdown extends StatelessWidget {
  const GenderDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFieldController>(
      builder: (controller) {
        return DropdownButton(
            dropdownColor: appBarColor,
            borderRadius: BorderRadius.circular(10),
            value: controller.guestGender,
            items: Gender.values
                .map(
                  (gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(
                      gender.name.toString(),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) {
                return;
              }
              controller.genderChange(value) ;
            });
      }
    );
  }
}
