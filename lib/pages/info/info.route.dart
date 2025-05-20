import 'package:get/get.dart';
import './info.binding.dart';
import './info.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: '/info/:e',
    page: () {
      return const InfoPage();
    },
    binding: InfoBinding(),
  ),
];
