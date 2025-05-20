import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import '../sections/sections.controller.dart';
import './info.controller.dart';

class InfoBinding implements Bindings {
  @override
  void dependencies() {
    //
    Get.put<EAdditivesController>(EAdditivesController());
    //
    Get.put<SectionsController>(SectionsController());
    Get.put<InfoController>(InfoController());
    // Get.put<EAdditivesController>(EAdditivesController());
  }
}
