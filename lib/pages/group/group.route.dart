import 'package:get/get.dart';
import './group.binding.dart';
import './group.screen.dart';

List<GetPage> routes = [
  GetPage(
    name: '/group',
    page: () {
      return GroupPage();
    },
    binding: GroupBinding(),
  ),
];
