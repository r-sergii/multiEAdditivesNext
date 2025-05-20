import 'package:get/get.dart';
import './pages/classification/classification.route.dart' as classification;
import './pages/danger/danger.route.dart' as danger;
import './pages/find/find.route.dart' as find;
import './pages/group/group.route.dart' as group;
import './pages/info/info.route.dart' as info;
import './pages/origin/origin.route.dart' as origin;
import './pages/settings/settings.route.dart' as settings;
import './pages/start/start.route.dart' as start;
import './pages/vegans/vegans.route.dart' as vegans;

class Routes {
  static const String web = "web";
  static const String mobile = "mobile";
  static const String desktop = "desktop";
  static const String linux = "linux";
  static const String password = "password";
  static const String danger = "danger";
  static const String classification = "classification";
  static const String find = "find";
  static const String group = "group";
  static const String info = "info";
  static const String origin = "origin";
  static const String settings = "settings";
  static const String start = "start";
  static const String vegans = "vegans";
}

final List<GetPage> _routes = List<GetPage>.empty(growable: true)
  // ..addAll(web.routes)
  // ..addAll(mobile.routes)
  // ..addAll(desktop.routes)
  // ..addAll(linux.routes)
  // ..addAll(password.routes)
  ..addAll(classification.routes)
  ..addAll(danger.routes)
  ..addAll(find.routes)
  ..addAll(group.routes)
  ..addAll(info.routes)
  ..addAll(origin.routes)
  ..addAll(settings.routes)
  ..addAll(start.routes)
  ..addAll(vegans.routes);

List<GetPage> getRoutes() {
  return _routes;
}
