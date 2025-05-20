import 'package:get/get.dart';
import './start.controller.dart';

class StartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StartController>(() => StartController());
  }
}