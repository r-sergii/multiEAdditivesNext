import 'package:get/get.dart';

import 'shared/const/app_data.dart';
import 'shared/widgets/app/responsive_scaffold.dart';

class BaseController extends GetxController {
  // Enabled state of each menuItem.
  late List<bool> menuItemsEnabled;
  // Active state of each menuItem.
  late List<ResponsiveMenuItemIconState> menuItemsIconState;

  // set themeMode(ThemeMode value) {
  //   _themeMode = value;
  // }

  // ThemeMode get themeMode {
  //   return _themeMode;
  // }

  @override
  void onInit() {
    menuItemsEnabled = List<bool>.generate(AppData.menuItems.length, (int i) => false);
    menuItemsEnabled[0] = true;
    menuItemsEnabled[1] = true;
    menuItemsEnabled[2] = true;
    menuItemsEnabled[3] = true;
    menuItemsEnabled[4] = true;
    menuItemsEnabled[5] = true;
    menuItemsEnabled[6] = true;
    // menuItemsEnabled[7] = true;
    menuItemsIconState = List<ResponsiveMenuItemIconState>.generate(
        AppData.menuItems.length, (int i) => ResponsiveMenuItemIconState.primary);
    super.onInit();
  }

  // onThemeModeChanged(ThemeMode mode) {
  //   themeMode = mode;
  // }
}
