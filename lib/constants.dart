import 'package:flutter/material.dart';
import 'package:wedding_gift/controller/bottom_nav_controller.dart';

import 'package:wedding_gift/controller/model_class_controller.dart';
import 'package:wedding_gift/controller/search_controller.dart';
import 'package:wedding_gift/controller/text_field_controller.dart';

//Colors
const backgroundColor = Color.fromARGB(255, 240, 191, 134);
const fontColorHeading = Color.fromARGB(255, 84, 33, 20);
const fontColor = Color.fromARGB(255, 151, 93, 41);
const appBarColor = Color.fromARGB(255, 227, 189, 149);
const appBarFontColor = Color.fromARGB(255, 159, 99, 48);
// color: const Color.fromARGB(255, 199, 112, 33),
const cardColor = Color.fromARGB(55, 199, 112, 33);
const bottomNavColor = Color.fromARGB(255, 211, 143, 83);
const charBarBackground = Color.fromARGB(255, 226, 169, 119);
const chartbarTextColor = Color.fromARGB(255, 66, 32, 12);
const chartBarPercentageColor = Color.fromARGB(255, 89, 0, 1);
//controller
var textFieldController = TextFieldController.instance;
var modelClassController = ModelClassController.instance;
var searchingcontroller = SearchingController.instance;
var bottomNavController = BottomNavController.instance;

//text color
var textStyleChartScreen = const TextStyle(
  fontSize: 15,
  letterSpacing: 1,
  fontWeight: FontWeight.normal,
  // color: Color.fromARGB(255, 30, 23, 16),
  // color: Color.fromARGB(255, 68, 35, 16),
  color: chartbarTextColor,
);
