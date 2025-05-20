import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'app_controller.dart';
import 'config.dart';
import 'pages/appsload/appsload.controller.dart';
import 'routes.dart';
import 'services/translator/translator.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (GetPlatform.isWindows || GetPlatform.isLinux || GetPlatform.isMacOS) {
    await windowManager.ensureInitialized();
    WindowManager.instance.setMinimumSize(const Size(800, 480));
    // WindowManager.instance.setMaximumSize(const Size(1024, 768));
  }
  HttpOverrides.global = MyHttpOverrides();
  await initServices();
  Get.put(AppsLoadController());
  runApp(const MyApp());
}

Future initServices() async {
  await App.init(Config());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeService = Get.find<LocaleService>();
    final appController = Get.find<AppController>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'multiE Additives',
      initialRoute: '/start', 
      // theme: _getTheme(),
      // darkTheme: _getDarkTheme(),
      themeMode: appController.themeMode,
      // builder: (context, child) => getHomeWidget(child: child),
      builder: (context, child) => ResponsiveWrapper.builder(BouncingScrollWrapper.builder(context, child!),
          maxWidth: 1200,
          minWidth: 390, //450,
          defaultScale: true,
          breakpoints: [
            // const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.resize(390, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      getPages: getRoutes(),
    );
  }

  // _getTheme() {
  //   return FlexThemeData.light(
  //     colors: _useScheme ? null : _schemeLight,
  //     scheme: _scheme,
  //     swapColors: _swapColors, // If true, swap primary and secondaries.
  //     usedColors: _usedColors,
  //     lightIsWhite: false,

  //     // colorScheme: const ColorScheme.light(),

  //     // primary: FlexColor.indigo.light.primary,
  //     // primaryContainer: FlexColor.greenLightPrimaryContainer,
  //     // secondary: FlexColor.indigo.light.secondary,
  //     // secondaryContainer: FlexColor.indigo.light.secondaryContainer,
  //     // surface: FlexColor.lightSurface,
  //     // background: FlexColor.lightBackground,
  //     // error: FlexColor.materialLightErrorHc,
  //     // scaffoldBackground: FlexColor.lightScaffoldBackground,
  //     // dialogBackground: FlexColor.lightSurface,
  //     // appBarBackground: FlexColor.barossaLightPrimary,

  //     appBarStyle: FlexAppBarStyle.primary,
  //     appBarElevation: _appBarElevation,
  //     appBarOpacity: _appBarOpacity,
  //     transparentStatusBar: _transparentStatusBar,
  //     tabBarStyle: _tabBarForAppBar,
  //     surfaceMode: _surfaceMode,
  //     blendLevel: _blendLevel,
  //     tooltipsMatchBackground: _tooltipsMatchBackground,

  //     fontFamily: _fontFamily,
  //     textTheme: _textTheme,
  //     primaryTextTheme: _textTheme,
  //     keyColors: _keyColors,
  //     tones: _flexTonesLight,
  //     subThemesData: _useSubThemes ? _subThemesData : null,
  //     visualDensity: _visualDensity,
  //     platform: _platform,

  //     typography: Typography.material2021(
  //       platform: _platform,
  //     ),
  //     // Add all our custom theme extensions, in this case we only have one.
  //     extensions: <ThemeExtension<dynamic>>{
  //       lightBrandTheme,
  //     },
  //   );
  // }

  // _getDarkTheme() {
  //   return FlexThemeData.dark(
  //     colors: (_useScheme && _computeDarkTheme)
  //         ? FlexColor.schemes[_scheme]!.light.toDark(_toDarkLevel)
  //         : _useScheme
  //             ? null
  //             : _computeDarkTheme
  //                 ? _schemeLight.toDark(_toDarkLevel, true)
  //                 // And finally, use the defined custom dark colors.
  //                 : _schemeDark,
  //     // To use a built-in scheme based on enum, don't assign colors above.
  //     scheme: _scheme,
  //     swapColors: _swapColors,
  //     usedColors: _usedColors,
  //     // For an optional ink black dark mode, set darkIsTrueBlack to true.
  //     darkIsTrueBlack: false,

  //     appBarStyle: FlexAppBarStyle.background,
  //     appBarElevation: _appBarElevation,
  //     appBarOpacity: _appBarOpacity,
  //     transparentStatusBar: _transparentStatusBar,
  //     tabBarStyle: _tabBarForAppBar,
  //     surfaceMode: _surfaceMode,
  //     blendLevel: _blendLevel,
  //     tooltipsMatchBackground: _tooltipsMatchBackground,
  //     fontFamily: _fontFamily,
  //     textTheme: _textTheme,
  //     primaryTextTheme: _textTheme,
  //     keyColors: _keyColors,
  //     tones: _flexTonesDark,
  //     subThemesData: _useSubThemes ? _subThemesData : null,
  //     visualDensity: _visualDensity,
  //     platform: _platform,

  //     typography: Typography.material2021(
  //       platform: _platform,
  //     ),
  //     // Add all our custom theme extensions, in this case we only have one.
  //     extensions: <ThemeExtension<dynamic>>{
  //       darkBrandTheme,
  //     },
  //   );
  // }
}
