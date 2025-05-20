import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';

class AppController extends GetxController {
  late ThemeMode _themeMode; // = ThemeMode.system;

  AppController() {
    final theme = App.storage.read<int>('theme') ?? 0;
    //ThemeMode.system;
    debugPrint(theme.toString());
    onThemeModeChanged(ThemeMode.values[theme]);
  }

  set themeMode(ThemeMode value) {
    _themeMode = value;
  }

  ThemeMode get themeMode {
    return _themeMode;
  }

  @override
  void onInit() {
    _themeMode = ThemeMode.system;
    super.onInit();
  }

  onThemeModeChanged(ThemeMode mode) {
    themeMode = mode;
    Get.changeThemeMode(themeMode);
    update();
    App.storage.write('theme', mode.index);
  }
}
