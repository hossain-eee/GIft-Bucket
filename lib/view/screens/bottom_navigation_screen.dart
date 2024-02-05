import 'package:flutter/material.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/controller/bottom_nav_controller.dart';
import 'package:wedding_gift/view/screens/guest_gift_combo_screen.dart';
import 'package:wedding_gift/view/screens/chart_screen.dart';
import 'package:wedding_gift/view/screens/gift_screen.dart';
import 'package:wedding_gift/view/screens/home_screen.dart';
import 'package:wedding_gift/view/screens/money_screen.dart';
import 'package:wedding_gift/view/widgests/add_edit/gift_information_field.dart';
import 'package:get/get.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  // int _selectedIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    GiftScreen(),
    MoneyScreen(),
    GuestGiftCombo(),
    ChartScreen(),
  ];


//guest and gift taking filed
  void _showGuestField() {
    showModalBottomSheet(
  
            useSafeArea: false, // default false,
            isScrollControlled: true,
            context: context,
            builder: (ctx) {
            
              return Container(
                 decoration: const BoxDecoration(
                      color: backgroundColor,
                    ),
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: GestureDetector(
                          //remove keypad when click on subbmit button of keypad
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          child: const GiftInformationField()),
                    ),
                  ),
                ),
              );
            })
        .whenComplete(() => textFieldController
            .clearTheController()); // when ever close the bottom sheet then clear all the controller.
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (btmNavController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Gift Bucket"),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: fontColor,
          unselectedItemColor: appBarColor,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.card_giftcard,
                ),
                label: 'Gift'),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Money',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.gif_box_outlined,
                ),
                label: 'Combo'),
            BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart), label: 'Chart'),
          ],
          currentIndex: bottomNavController.currentIndex,
          onTap: (int index) {
            bottomNavController.screenChange(index);
          },
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: backgroundColor,
            ),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: _pages[btmNavController.currentIndex],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: cardColor,
          elevation: 0.5,
          onPressed: _showGuestField,
          child: const Icon(
            Icons.add,
          ),
        ),
      );
    });
  }
}
