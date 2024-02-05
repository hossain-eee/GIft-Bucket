import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wedding_gift/boxes/boxes.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/model/guest_gift.dart';
import 'package:wedding_gift/view/widgests/add_edit/edit_gift_information.dart';
import 'package:wedding_gift/view/widgests/guest_profile.dart';

class SearchingController extends GetxController {
  static SearchingController instance = Get.find();
  //singleton instance of hive openBox, for every page this will create same instance so we don't need to call form other page to maintian same instance.
  final box = Boxes.getHiveBoxInstance();
//take user input and make it capital of first letter, same method will call whean search to avoid capital and small issue
  String capetalizedFirstLetterWord(String name) {
    String input = name;
    if (input.isEmpty) {
      return input;
    }
    final List<String> words = input.split(' ');
    final List<String> capitalized = words.map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).toList();
    return capitalized.join(' ');
  }

  //delete operation
  void deleteItem(GuestGift deleteItem, BuildContext context) {
    deleteItem.delete();
    //update the listofGuest by updatList() method calling, its just taking same list (prefered latest list but here is not possible wiht .remove() method) but when run the mehtod then getx update() also called inside  updatList() then its update so then got its current data.its just like setter method
    modelClassController.updatList();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: appBarColor,
      elevation: 0,
      duration: const Duration(seconds: 3),
      content: const Text('Item deleted'),
      action: SnackBarAction(
          label: 'Undo',
          textColor: appBarFontColor,
          onPressed: () {
            box.add(deleteItem);
            modelClassController.updatList();
            update();
          }),
    ));
    update();
  }

  //Edit list
  void editBottomSheet(BuildContext context, GuestGift guestGift) {
    //get the list value and set to controller so that when open text field there will be value in very field.
    textFieldController.nameController.text = guestGift.name;
    textFieldController.amountController.text = guestGift.amount.toString();
    textFieldController.giftController.text = guestGift.noOfGift.toString();
    textFieldController.guestGender = guestGift.gender;
    textFieldController.giftType = guestGift.giftType;
    double additionalHeight = MediaQuery.of(context).size.height * 0.9;

    showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            context: context,
            builder: (ctx) {
              // return GiftInformationField();
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).viewInsets.bottom +
                    additionalHeight,
                decoration: const BoxDecoration(
                  color: backgroundColor,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: GestureDetector(
                      onTap: (){
                        FocusScope.of(context).unfocus();
                      },
                      child: EditGiftInformationField(
                        guestGift: guestGift,
                      ),
                    ),
                  ),
                ),
              );
            })
        .whenComplete(() => textFieldController
            .clearTheController()); // when ever close the bottom sheet then clear all the controller.
  }

  void eidtCardItem(GuestGift guestGift) {
    // get the textfield value by controller which we set in  editBottomSheet() mehtod and put this value to the list, where we can edit or add other thing in textField which will recive by controller, then put this controller value to list specefic properties(variable). its not like adding new data.
    guestGift.name = capetalizedFirstLetterWord(textFieldController
        .nameController
        .text); //apply capitalized method for capital of first letter
    guestGift.amount =
        int.tryParse(textFieldController.amountController.text) ?? 0;
    guestGift.noOfGift =
        int.tryParse(textFieldController.giftController.text) ?? 0;
    guestGift.gender = textFieldController.guestGender;
    guestGift.giftType = textFieldController.giftType;
    guestGift.save(); // save edit data to hive
    modelClassController.updatList(); //update main list that is listofGuest
    update();
    Get.back();
  }

  //show guest details in botto sheet when user click list of guest
  void showGusetDetails(GuestGift guestGift, BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text(
              'Guest Details',
            ),
            content: GuestProfile(
              guestGift: guestGift,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            backgroundColor: backgroundColor,
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(color: fontColor),
                  ))
            ],
          );
        });
  }

  @override
  void dispose() {
    box.close();
    super.dispose();
  }
}
