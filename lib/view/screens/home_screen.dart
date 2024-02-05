import 'package:flutter/material.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/view/widgests/guest/guest_list_all.dart';
import 'package:wedding_gift/view/widgests/search_bar_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    modelClassController.searchUserInput = null;
    //when user search something then show the search result, after that need to null again the user input search variable to show all data when load home page from navigate to other page, unless previous data will exist
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
       onWillPop: () async {
        // Show an AlertDialog
        bool exit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Are you sure you want to exit?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false); // Stay on the current screen
                  },
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true); // Allow app exit
                  },
                  child: Text('Yes'),
                ),
              ],
            );
          },
        );

        return exit ?? false;}, 
      child: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBarItem(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Guest List',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: fontColorHeading),
              ),
              const SizedBox(
                height: 10,
              ),
              const GuestList(),
            ],
          ),
        ),
      ),
    );
  }
}
