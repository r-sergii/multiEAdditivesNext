import 'package:get/get.dart';
import './danger.binding.dart';
import './danger.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: '/danger',
    page: () {
      return DangerPage();
    },
    binding: DangerBinding(),
  ),
];
