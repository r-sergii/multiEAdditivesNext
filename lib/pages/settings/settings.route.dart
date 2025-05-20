import 'package:get/get.dart';
import './settings.binding.dart';
import './settings.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: '/settings',
    page: () {
      return const SettingsPage();
    },
    binding: SettingsBinding(),
  ),
];
