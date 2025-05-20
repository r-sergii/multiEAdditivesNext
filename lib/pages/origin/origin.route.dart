import 'package:get/get.dart';
import './origin.binding.dart';
import './origin.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: '/origin',
    page: () {
      return OriginPage();
    },
    binding: OriginBinding(),
  ),
];
