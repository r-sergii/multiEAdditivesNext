// import 'dart:convert';

import 'package:get/get.dart';
import '../../services/translator/translator.service.dart';
import '../eadditives/eadditives.controller.dart';
import '../eadditives/eadditives.models.dart';
import '../sections/sections.controller.dart';
import 'info.models.dart';
import 'info.provider.dart';

class InfoController extends GetxController {
  List<InfoModel> infoItems1 = [];
  List<InfoModel> infoItems2 = [];
  List<InfoModel> infoItems3 = [];
  List<InfoModel> infoItems4 = [];
  List<InfoModel> infoItems5 = [];
  List<InfoModel> infoItems6 = [];
  List<InfoModel> infoItems7 = [];
  late List<List<InfoModel>> infoItems;

  final EAdditivesController additivesController = Get.find<EAdditivesController>();
  final SectionsController sectionsController = Get.find<SectionsController>();
  late bool isLoad = false;
  late EAdditivesModelExt eAdditivesModel;
  TranslatorService tr = TranslatorService();

  @override
  void onInit() async {
    super.onInit();
    infoItems = [
      infoItems1,
      infoItems2,
      infoItems3,
      infoItems4,
      infoItems5,
      infoItems6,
      infoItems7,
    ];
    final localeService = Get.find<LocaleService>();
    print(localeService.current.languageCode.toUpperCase());
    eAdditivesModel = await additivesController.getAdditives(
        Get.parameters["e"] ?? 'E100', localeService.current.languageCode.toUpperCase());
    eAdditivesModel.make();
    isLoad = true;
    // eAdditivesModel.groupsItems!.forEach((element) {
    //   print(element.name);
    // });
    // eAdditivesModel.originItems!.forEach((element) {
    //   print(element.name);
    // });
    await sectionsController.fillSectionsItems(localeService.current.languageCode.toUpperCase());
    await getAdditives(Get.parameters["e"] as String, localeService.current.languageCode.toUpperCase());
    // update(['onModel']);
    // await setTranslate1();
  }

  fillItems(String lang) async {
    infoItems1.clear();
    infoItems1.addAll(await InfoProvider().getItems());
    update(['onItems']);
  }

  getItem(int id, String lang) async {
    return await InfoProvider().getItem(id, lang);
  }

  getAdditives(String e, String lang) async {
    // await section1.getAdditives(e, lang);
    infoItems1.clear();
    // final list = await InfoProvider().getAdditives(e, 1, lang);
    // print(list.length);
    // infoItems1.addAll(list);
    infoItems1.addAll(await InfoProvider().getAdditives(e, 1, lang));
    infoItems2.clear();
    infoItems2.addAll(await InfoProvider().getAdditives(e, 2, lang));
    infoItems3.clear();
    infoItems3.addAll(await InfoProvider().getAdditives(e, 3, lang));
    infoItems4.clear();
    infoItems4.addAll(await InfoProvider().getAdditives(e, 4, lang));
    infoItems5.clear();
    infoItems5.addAll(await InfoProvider().getAdditives(e, 5, lang));
    infoItems6.clear();
    infoItems6.addAll(await InfoProvider().getAdditives(e, 6, lang));
    infoItems7.clear();
    infoItems7.addAll(await InfoProvider().getAdditives(e, 7, lang));
    update(['onItems']);
  }

  Future<void> setTranslate(int index) async {
    final localeService = Get.find<LocaleService>();
    infoItems[index].forEach((element) async {
      ////for use Google Translate
      element.info = await translate(localeService.current.languageCode.toUpperCase(), element.info);
      ////for use Resource
      // element.info = element.info;
      ///
      element.isTranslate = true;
      update(['onModel']);
    });
  }

  bool isTranslate(int index) {
    if (infoItems[index].isNotEmpty) {
      return infoItems[index][0].isTranslate;
    } else {
      return true;
    }
  }

  Future<String> translate(String lang, String data) async {
    // String data = '$infoItems1[0].info';//;$infoItems[1].info';
    print(data);
    final res = await tr.translate(lang, data);
    print(res[0].original);
    print(res[0].translation);
    return res[0].translation;
  }
}
