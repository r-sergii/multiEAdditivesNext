import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../app.dart';
import '../../pages/settings/settings.controller.dart';
import '../../pages/settings/settings.models.dart';
import './translator.provider.dart';
import './translator.controller.dart';
import './translator.model.dart';

class TranslatorService {
  final _getStorage = GetStorage();

  final host = "script.google.com";
  final path = "/macros/s/AKfycbyEI2pnxLJF489Kp5-qvCdDN8PhvN_Hv08mzplb9IXkoqVjFqSO13u1Q8OYl0CjBHZi/exec";

  Future<List<ResultTranslatorModel>> change(String lang) async {
    TranslatorController controler = TranslatorController();

    Map<String, dynamic> data = {};
    data['lang'] = lang;
    data['words'] = '${controler.find};${controler.danger};${controler.settings};${controler.about};'
        '${controler.colorthemes};${controler.language};${controler.confirm};${controler.cancel};'
        '${controler.screenshot};${controler.group};${controler.origin};${controler.download};${controler.use};'
        '${controler.question};${controler.issue};${controler.advice};${controler.message};${controler.signin};'
        '${controler.with_};${controler.vegans};${controler.classification};${controler.additives};'
        '${controler.signout};${controler.signup};${controler.email};${controler.password};'
        '${controler.notvalidemail};${controler.notvalidpassword};${controler.nexttime};${controler.privacyPolicy};'
        '${controler.noConnect};${controler.noAccess};${controler.license};${controler.notinfo};';
    debugPrint(data.toString());
    List<ResultTranslatorModel> result = await TranslatorProvider().getDataList(host, path, data);
    for (int i = 0; i < result.length; i++) {
      debugPrint(result[i].original);
      debugPrint(result[i].translation);
    }
    return result;
  }

  final host2 = "script.google.com";
  final path2 = "/macros/s/AKfycbyQn13dcchhG2uMeMrQwifABeg5s7JxwY14gR1a5zcAGCwfO9eAz35405ah_ozACnx4zw/exec";

  Future<List<ResultTranslatorModel>> translate(String lang, String str) async {
    Map<String, dynamic> data = {};
    data['from'] = 'RU';
    data['to'] = lang;
    data['words'] = str;
    List<ResultTranslatorModel> result = await TranslatorProvider().getDataList(host2, path2, data);
    for (int i = 0; i < result.length; i++) {
      debugPrint(result[i].original);
      debugPrint(result[i].translation);
    }
    return result;
  }
}

class LocaleService extends GetxController {

  LocaleService() {
    final first = App.storage.read<String>('locale') ?? 'en';
    final SettingsController settingsController = SettingsController();
    final code = settingsController.listItemLanguage.firstWhere(
      (element) => element.short == first.toUpperCase(),
      orElse: () => ItemLanguage(0, "English language", "EN"),
    );
    _codeLang = code.short ?? 'EN';
    current = createLocale(_codeLang.toLowerCase());
  }


  String get codeLang => _codeLang;
  Locale get current => _current;
  set current(Locale locale) {
    _current = locale;
    Get.updateLocale(_current);
    App.storage.write('locale', _current.languageCode);
  }

  Locale createLocale(String code) {
    final lang = code.split('_');
    debugPrint(code);
    return Locale(lang[0]);
  }

  late Locale _current;
  late String _codeLang;
}
