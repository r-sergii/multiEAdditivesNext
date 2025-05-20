import 'package:get/get.dart';

import '../../services/translator/translator.service.dart';
import 'group.models.dart';
import 'group.provider.dart';

class GroupController extends GetxController {
  int openStatus = -1;
  late List<GroupModel> groupItems = [];

  @override
  void onInit() async {
    super.onInit();
    final localeService = Get.find<LocaleService>();
    print(localeService.current.languageCode.toUpperCase());
    await fillItems(localeService.current.languageCode.toUpperCase());
  }

  fillItems(String lang) async {
    groupItems.clear();
    groupItems.addAll(await GroupProvider().getItems(lang));
    update(['onItems']);
  }

  getItem(int id, String lang) async {
    return await GroupProvider().getItem(id, lang);
  }

  getOrigin(int id, String lang) async {
    return await GroupProvider().getGroup(id, lang);
  }
}
