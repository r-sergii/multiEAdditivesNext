import 'package:get/get.dart';

import '../../services/translator/translator.service.dart';
import 'classification.models.dart';
import 'classification.provider.dart';

class ClassificationController extends GetxController {
  int openStatus = -1;
  late List<ClassificationModel> classificationItems = [];

  @override
  void onInit() async {
    super.onInit();
    final localeService = Get.find<LocaleService>();
    print(localeService.current.languageCode.toUpperCase());
    await fillItems(localeService.current.languageCode.toUpperCase());
  }

  fillItems(String lang) async {
    classificationItems.clear();
    classificationItems.addAll(await ClassificationProvider().getItems(lang));
    update(['onItems']);
  }

  getItem(int id, String lang) async {
    return await ClassificationProvider().getItem(id, lang);
  }
}
