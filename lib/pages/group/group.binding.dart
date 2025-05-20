import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import './group.controller.dart';

class GroupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GroupController>(GroupController());
    Get.lazyPut<EAdditivesController>(() => EAdditivesController());
  }
}
