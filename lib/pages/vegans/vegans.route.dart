import 'package:get/get.dart';
import './vegans.binding.dart';
import './vegans.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: '/vegans',
    page: () {
      return VegansPage();
    },
    binding: VegansBinding(),
  ),
];
