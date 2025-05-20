import 'package:get/get.dart';
import './find.binding.dart';
import './find.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: '/find',
    page: () {
      return FindPage();
    },
    binding: FindBinding(),
  ),
];
