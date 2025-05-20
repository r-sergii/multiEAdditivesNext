import 'package:get/get.dart';

import 'eadditives.models.dart';
import 'eadditives.provider.dart';

class EAdditivesController extends GetxController {
  late List<EAdditivesModel> eadditivesItems = [];

  @override
  void onInit() async {
    super.onInit();
  }

  fillDangerItems(int item) async {
    eadditivesItems.clear();
    eadditivesItems.addAll(await EAdditivesProvider().getDanger(item));
    update(['onItems']);
  }

  fillVegansItems(int item) async {
    eadditivesItems.clear();
    eadditivesItems.addAll(await EAdditivesProvider().getVegans(item));
    update(['onItems']);
  }

  fillOriginItems(int item) async {
    eadditivesItems.clear();
    eadditivesItems.addAll(await EAdditivesProvider().getOrigin(item));
    update(['onItems']);
  }

  fillGroupsItems(int item) async {
    eadditivesItems.clear();
    eadditivesItems.addAll(await EAdditivesProvider().getGroups(item));
    update(['onItems']);
  }

  fillClassificationItems(int start, int count) async {
    eadditivesItems.clear();
    eadditivesItems.addAll(await EAdditivesProvider().getClassification(start, count));
    update(['onItems']);
  }

  Future<EAdditivesModelExt> getAdditives(String e, String lang) async {
    return await EAdditivesProvider().getAdditives(e, lang);
  }

  Future<CountModel> getCount(String e) async {
    return await EAdditivesProvider().getCount(e);
  }
}
