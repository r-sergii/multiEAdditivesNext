import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import './find.controller.dart';

class FindBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindController>(() => FindController());
    Get.lazyPut<EAdditivesController>(() => EAdditivesController());
  }
}
