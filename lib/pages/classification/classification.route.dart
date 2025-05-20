import 'package:get/get.dart';
import 'classification.binding.dart';
import 'classification.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: '/classification',
    page: () {
      return ClassificationPage();
    },
    binding: ClassificationBinding(),
  ),
];
