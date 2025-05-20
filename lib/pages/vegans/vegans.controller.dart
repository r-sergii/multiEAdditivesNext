import 'package:get/get.dart';

import '../../services/translator/translator.service.dart';
import 'vegans.models.dart';
import 'vegans.provider.dart';

class VegansController extends GetxController {
      int openStatus = -1;
  late List<VegansModel> vegansItems = [];

  @override
  void onInit() async {
    super.onInit();
    final localeService = Get.find<LocaleService>();
    print(localeService.current.languageCode.toUpperCase());
    await fillItems(localeService.current.languageCode.toUpperCase());
  }

  fillItems(String lang) async {
    vegansItems.clear();
    vegansItems.addAll(await VegansProvider().getItems(lang));
    update(['onItems']);
  }

  getItem(int id, String lang) async {
    return await VegansProvider().getItem(id, lang);
  }

  getVegans(int id, String lang) async {
    return await VegansProvider().getVegans(id, lang);
  }
}
