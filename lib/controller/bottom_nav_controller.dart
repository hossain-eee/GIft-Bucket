import 'package:get/get.dart';

class BottomNavController extends GetxController {
  static BottomNavController instance = Get.find();
  int currentIndex = 0;
  void screenChange(int index) {
    currentIndex = index;
    update();
  }

  void backToHomeScreen() {
    screenChange(0);
    update();
  }
}
