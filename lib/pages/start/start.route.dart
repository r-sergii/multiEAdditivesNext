import 'package:get/get.dart';
import './start.binding.dart';
import './start.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: '/start',
    page: () {
      return const StartPage();
    },
    binding: StartBinding(),
  ),
];
