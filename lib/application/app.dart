import 'package:flutter/material.dart';
import 'package:wedding_gift/application/state_holder_binder.dart';
import 'package:wedding_gift/constants.dart';
import 'package:wedding_gift/view/screens/bottom_navigation_screen.dart';
import 'package:get/get.dart';

class WeddingGift extends StatelessWidget {
  const WeddingGift({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: StateHolderBinder(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade300),
        useMaterial3: false,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: appBarColor,
          foregroundColor: appBarFontColor,
          elevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
        ),

      
        canvasColor: bottomNavColor,
        // its apply for bottom navigaton all the screen background color, for change screen color then change color form scaffold, bottom nav background color is not modify from scaffold
      ),
      // home: HomeScreen(),
      home: const BottomNavigationScreen(),
    );
  }
}
