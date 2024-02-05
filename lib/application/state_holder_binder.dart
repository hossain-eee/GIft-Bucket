import 'package:get/get.dart';
import 'package:wedding_gift/controller/bottom_nav_controller.dart';
import 'package:wedding_gift/controller/model_class_controller.dart';
import 'package:wedding_gift/controller/search_controller.dart';
import 'package:wedding_gift/controller/text_field_controller.dart';

class StateHolderBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(TextFieldController());
    Get.put(ModelClassController());
    Get.put(SearchingController());
    Get.put(BottomNavController());
  }
}
