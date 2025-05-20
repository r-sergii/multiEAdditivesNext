import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import './origin.controller.dart';

class OriginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<OriginController>(OriginController());
    Get.lazyPut<EAdditivesController>(() => EAdditivesController());
  }
}
