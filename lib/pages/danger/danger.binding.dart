import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import './danger.controller.dart';

class DangerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DangerController>(DangerController());
    Get.lazyPut<EAdditivesController>(() => EAdditivesController());
  }
}
