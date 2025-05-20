import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import './vegans.controller.dart';

class VegansBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<VegansController>(VegansController());
    Get.lazyPut<EAdditivesController>(() => EAdditivesController());
  }
}
