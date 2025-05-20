import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app_controller.dart';
import 'config.dart';
import 'services/translator/translator.controller.dart';
import 'services/translator/translator.service.dart';

abstract class StorageFields {
  // static const sLOCALE = 'LOCALE';
  // static const sUID = 'uid';
  // static const sTHEME = "theme";

  static const find = 'find';
  static const danger = 'danger';
  static const group = 'group';
  static const origin = 'origin';
  static const classification = 'classification';
  static const settings = 'settings';
  static const about = 'about';
  static const colorthemes = 'colorthemes';
  static const language = 'language';
  static const confirm = 'confirm';
  static const cancel = 'cancel';
  static const screenshot = 'screenshot';
  static const download = 'download';
  static const use = 'use';
  static const question = 'question';
  static const issue = 'issue';
  static const advice = 'advice';
  static const message = 'message';
  static const signin = 'signin';
  static const signout = 'signout';
  static const signup = 'signup';
  static const with_ = 'with_';
  static const vegans = 'vegans';
  static const additives = 'additives';
  static const email = 'email';
  static const password = 'password';
  static const notvalidemail = 'notvalidemail';
  static const notvalidpassword = 'notvalidpassword';
  static const nexttime = 'nexttime';
  static const privacyPolicy = 'privacyPolicy';
  static const noConnect = 'noConnect';
  static const noAccess = 'noAccess';
  static const license = 'license';
  static const notinfo = 'notinfo';
}

abstract class App {
  static const String packageName = 'multieadditives';
  static late Config config;
  static late GetStorage storage;
  static late LocaleService localeService;
  static late TranslatorController translatorController;
  static late AppController appController;
  static late bool isEULA;
  // Get.put(LocaleService(), permanent: true);
  // Get.put(TranslatorController());
  // Get.put(AppController());

  static Future<void> init(Config config) async {
    App.config = config;
    // WidgetsFlutterBinding.ensureInitialized();

    await GetStorage.init(packageName);
    App.storage = GetStorage(packageName, '/');
    translatorController = Get.put(TranslatorController());
    localeService = Get.put(LocaleService(), permanent: true);
    if (localeService.codeLang != 'en') {
      TranslatorService tr = TranslatorService();
      // translatorController.upload(await tr.change(localeService.codeLang)); // not need!!!
      translatorController.readStorage();
    }
    appController = Get.put(AppController());
    isEULA = App.storage.read<bool>('EULA') ?? false;
  }

  writeStorage() {
    App.storage.write('EULA', isEULA);
  }

  readStorage() {
    isEULA = App.storage.read<bool>('EULA') ?? false;
  }
}
