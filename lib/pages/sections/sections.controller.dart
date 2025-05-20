import 'package:get/get.dart';

import 'sections.models.dart';
import 'sections.provider.dart';

class SectionsController extends GetxController {
  late List<SectionsModel> sectionsItems = [];

  @override
  void onInit() async {
    super.onInit();
  }

  fillSectionsItems(String lang) async {
    sectionsItems.clear();
    sectionsItems.addAll(await SectionsProvider().getItems(lang));
    update(['onItems']);
  }

  getItem(int id, String lang) async {
    return await SectionsProvider().getItem(id, lang);
  }

  getSection(int id, String lang) async {
    return await SectionsProvider().getSection(id, lang);
  }
}
