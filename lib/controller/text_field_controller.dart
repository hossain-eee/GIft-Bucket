import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_gift/model/guest_gift.dart';

class TextFieldController extends GetxController {
  static TextFieldController instance = Get.find();
  //search bar
  final TextEditingController searchItem = TextEditingController();
//Guest information
  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController giftController = TextEditingController();

  Gender guestGender = Gender.male;
  GiftType giftType = GiftType.money;
  void genderChange(Gender gender) {
    guestGender = gender;
    print('guestGender is: $guestGender');
    update();
  }

  void giftTypeChange(GiftType gift) {
    giftType = gift;
    print('Gift type is : $giftType');
    update();
  }

//clear the conttroller 
  void clearTheController() {
    nameController.clear();
    amountController.clear();
    giftController.clear();
    update();
  }
  @override
  void onClose() {
    searchItem.dispose();
    nameController.dispose();
    amountController.dispose();
    giftController.dispose();
    print('controller is dispose');
    super.onClose();
  }
}
