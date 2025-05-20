import 'package:get/get.dart';

import '../../services/translator/translator.service.dart';
import 'origin.models.dart';
import 'origin.provider.dart';

class OriginController extends GetxController {
  int openStatus = -1;
  late List<OriginModel> originItems = [];

  @override
  void onInit() async {
    super.onInit();
    final localeService = Get.find<LocaleService>();
    print(localeService.current.languageCode.toUpperCase());
    await fillItems(localeService.current.languageCode.toUpperCase());
  }

  fillItems(String lang) async {
    originItems.clear();
    originItems.addAll(await OriginProvider().getItems(lang));
    update(['onItems']);
  }

  getItem(int id, String lang) async {
    return await OriginProvider().getItem(id, lang);
  }

  getOrigin(int id, String lang) async {
    return await OriginProvider().getOrigin(id, lang);
  }
}
