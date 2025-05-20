import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import 'classification.controller.dart';

class ClassificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ClassificationController>(ClassificationController());
    Get.lazyPut<EAdditivesController>(() => EAdditivesController());
  }
}
