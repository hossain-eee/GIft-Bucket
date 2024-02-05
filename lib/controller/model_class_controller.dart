import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_gift/boxes/boxes.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/model/guest_gift.dart';

class ModelClassController extends GetxController {
  static ModelClassController instance = Get.find();
  final box = Boxes.getHiveBoxInstance();
  String?
      searchUserInput; // receiving search bar TextField controller value by method
  //total guest and their gift

  //get all data from Hive
  List<GuestGift> listofGuest() {
    final data = box.values.toList();
    return data;
  }

  //Search and find guest name (home screen search by user input)
  List<GuestGift> searchUserName(String name) {
    final List<GuestGift> user =
        listofGuest().where((element) => element.name.contains(name)).toList();
    update();
    return user;
  }

  //filter the guest name according to gift type(fixed user for gift,money,both)
  List<GuestGift> filterGuestGiftType(GiftType gift) {
    final List<GuestGift> user =
        listofGuest().where((element) => element.giftType == gift).toList();
    update();
    return user;
    //this function return list type data, so whe we called this function to a scrren consturctor then no need to take function as a parametr, rather take list type variable, when called that screen (construtor) then put this function with its argument value then when called this function its a a list of data, because we know return type function we can use as variable like getter method.
  }

//assign search bar textfiled controller value in local variable
  void searchUserByName(String text) {
    searchUserInput = searchingcontroller.capetalizedFirstLetterWord(text);
    textFieldController.searchItem.clear();
    update();
  }

//get both, all guest list and filter guest list but use by apply condition (search or not search)
  List<GuestGift> get allTypesGuest {
    List<GuestGift> user = searchUserInput == null // comes from search bar
        ? listofGuest()
        : searchUserName(searchUserInput!);
    update();
    return user;
  }

  //add new guest with gift, set conditon if all field is empty and user press add button then close the bottom sheet, if any field is fill but other is empty then show the alert dialog
  void addNewGuestGift() {
    print("length of data : ${listofGuest().length}");
    String inputName = textFieldController.nameController.text;
    final String name =
        searchingcontroller.capetalizedFirstLetterWord(inputName);
    final int? amount = int.tryParse(textFieldController.amountController.text);
    final int? noOfGift = int.tryParse(textFieldController.giftController.text);
    final bool isAmountInvalid = amount == null || amount < 0;
    final bool isNoOfGifttInvalid = noOfGift == null || noOfGift < 0;
    //only money
    if (textFieldController.giftType == GiftType.money) {
      if (name.isEmpty && isAmountInvalid) {
        return Get.back();
      } else if (name.isEmpty || isAmountInvalid) {
        return showAliertMessage();
      }
      final data=
          GuestGift.onlyMoeny(name, textFieldController.guestGender, amount);
      print('gest gender : ${textFieldController.guestGender}');
      box.add(data);
      data.save();

      Get.back();
    }
    //only gift
    if (textFieldController.giftType == GiftType.gift) {
      if (name.isEmpty && isNoOfGifttInvalid) {
        return Get.back();
      } else if (name.isEmpty || isNoOfGifttInvalid) {
        return showAliertMessage();
      }

      final data =
          GuestGift.onlyGift(name, textFieldController.guestGender, noOfGift);

      box.add(data);
      data.save();
      Get.back();
    }
    //both money and gift
    if (textFieldController.giftType == GiftType.combo) {
      if (name.isEmpty && isNoOfGifttInvalid && isAmountInvalid) {
        return Get.back();
      } else if (name.isEmpty || isNoOfGifttInvalid || isAmountInvalid) {
        return showAliertMessage();
      }

      final data = GuestGift(
          name: name,
          gender: textFieldController.guestGender,
          amount: amount,
          noOfGift: noOfGift);

      box.add(data);
      data.save();
      Get.back();
    }
    update();
  }

  //alert message when field is empty in user input
  void showAliertMessage() {
    Get.defaultDialog(
        title: 'Invalid Input',
        backgroundColor: backgroundColor,
        content: const Text(
            'Please make sure a valid title, amount or no of gift was entered...'),
        contentPadding: const EdgeInsets.all(15),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: fontColor,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Okey',
                  )),
            ],
          )
        ]);
  }

  //update listofGuest from other controller page, when delete or edit perform
  void updatList(/* List<GuestGift> newList */) {
    // listofGuest = newList;
    listofGuest();
    update();
  }

/* ######################Calculation####################### */
  int get totalGuest => listofGuest().length;
  int get maleGuestTotal =>
      listofGuest().where((element) => element.gender == Gender.male).length;
  int get femaleGuestTotal =>
      listofGuest().where((element) => element.gender == Gender.female).length;

//number guest according to gift
  int get moneyGiftingGuest => listofGuest()
      .where((element) => element.giftType == GiftType.money)
      .length;
  int get giftGiftingGuest => listofGuest()
      .where((element) => element.giftType == GiftType.gift)
      .length;
  int get comboGiftingGuest => listofGuest()
      .where((element) => element.giftType == GiftType.combo)
      .length;

  //total amount
  int totalAmount() {
    int sum = 0;

    for (final taka in listofGuest()) {
      sum = sum + taka.amount;
    }

    update();
    return sum;
  }

  //total amount
  int totalGift() {
    int gift = 0;

    for (final taka in listofGuest()) {
      gift = gift + taka.noOfGift;
    }
 
    update();
    return gift;
  }
     @override
  void dispose() {
    box.close();
    super.dispose();
  }
}
