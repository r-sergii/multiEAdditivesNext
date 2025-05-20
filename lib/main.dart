import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'app_controller.dart';
import 'base_controller.dart';
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
  Get.put(BaseController());
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

//Flex section
final FlexSchemeColor _schemeLight = FlexSchemeColor.from(
  primary: const Color(0xFF00296B),
  secondary: const Color(0xFFFF7B00),
  brightness: Brightness.light,
);

final FlexSchemeColor _schemeDark = FlexSchemeColor.from(
  primary: const Color(0xFF6B8BC3),
  secondary: const Color(0xffff7155),
  brightness: Brightness.dark,
);

const FlexScheme _scheme = FlexScheme.flutterDash;
const bool _useScheme = true;
const double _appBarElevation = 0.5;
const double _appBarOpacity = 0.94;
const bool _computeDarkTheme = false;
const int _toDarkLevel = 30;
const bool _swapColors = false;
const int _usedColors = 6;

const FlexKeyColors _keyColors = FlexKeyColors(
  useKeyColors: false, // <-- set to true enable M3 seeded ColorScheme.
  useSecondary: true,
  useTertiary: true,
  keepPrimary: false, // <-- Keep defined value, do not use the seeded result.
  keepPrimaryContainer: false,
  keepSecondary: false,
  keepSecondaryContainer: false,
  keepTertiary: false,
  keepTertiaryContainer: false,
);

final FlexTones _flexTonesLight = FlexTones.material(Brightness.light);
final FlexTones _flexTonesDark = FlexTones.material(Brightness.dark);

final String? _fontFamily = GoogleFonts.notoSans().fontFamily;

const TextTheme _textTheme = TextTheme(
  displayLarge: TextStyle(fontSize: 53),
  displayMedium: TextStyle(fontSize: 41),
  displaySmall: TextStyle(fontSize: 36),
  labelSmall: TextStyle(fontSize: 11, letterSpacing: 0.5),
);

const FlexSurfaceMode _surfaceMode = FlexSurfaceMode.highBackgroundLowScaffold;
const int _blendLevel = 20;
const bool _useSubThemes = true;

const FlexSubThemesData _subThemesData = FlexSubThemesData(
  interactionEffects: true,
  defaultRadius: null,
  bottomSheetRadius: 24,
  useTextTheme: true,
  inputDecoratorBorderType: FlexInputBorderType.outline,
  inputDecoratorIsFilled: true,
  inputDecoratorUnfocusedHasBorder: true,
  inputDecoratorSchemeColor: SchemeColor.primary,
  chipSchemeColor: SchemeColor.primary,
  elevatedButtonElevation: 1,
  thickBorderWidth: 2, // Default is 2.0.
  thinBorderWidth: 1.5, // Default is 1.5.
  bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
  bottomNavigationBarBackgroundSchemeColor: SchemeColor.background,
);

const bool _transparentStatusBar = true;

const FlexTabBarStyle _tabBarForAppBar = FlexTabBarStyle.forAppBar;

const bool _tooltipsMatchBackground = true;

final VisualDensity _visualDensity = FlexColorScheme.comfortablePlatformDensity;

final TargetPlatform _platform = defaultTargetPlatform;

class BrandTheme extends ThemeExtension<BrandTheme> {
  const BrandTheme({
    this.brandColor,
  });
  final Color? brandColor;

  // You must override the copyWith method.
  @override
  BrandTheme copyWith({
    Color? brandColor,
  }) =>
      BrandTheme(
        brandColor: brandColor ?? this.brandColor,
      );

  // You must override the lerp method.
  @override
  BrandTheme lerp(ThemeExtension<BrandTheme>? other, double t) {
    if (other is! BrandTheme) {
      return this;
    }
    return BrandTheme(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
    );
  }
}

// Custom const theme with our brand color in light mode.
BrandTheme lightBrandTheme = const BrandTheme(
  brandColor: Color.fromARGB(255, 8, 79, 71),
);

// Custom const theme with our brand color in dark mode.
BrandTheme darkBrandTheme = const BrandTheme(
  brandColor: Color.fromARGB(255, 167, 227, 218),
);
//

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
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
      theme: _getTheme(),
      darkTheme: _getDarkTheme(),
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

  _getTheme() {
    return FlexThemeData.light(
      colors: _useScheme ? null : _schemeLight,
      scheme: _scheme,
      swapColors: _swapColors, // If true, swap primary and secondaries.
      usedColors: _usedColors,
      lightIsWhite: false,

      // colorScheme: const ColorScheme.light(),

      // primary: FlexColor.indigo.light.primary,
      // primaryContainer: FlexColor.greenLightPrimaryContainer,
      // secondary: FlexColor.indigo.light.secondary,
      // secondaryContainer: FlexColor.indigo.light.secondaryContainer,
      // surface: FlexColor.lightSurface,
      // background: FlexColor.lightBackground,
      // error: FlexColor.materialLightErrorHc,
      // scaffoldBackground: FlexColor.lightScaffoldBackground,
      // dialogBackground: FlexColor.lightSurface,
      // appBarBackground: FlexColor.barossaLightPrimary,

      appBarStyle: FlexAppBarStyle.primary,
      appBarElevation: _appBarElevation,
      appBarOpacity: _appBarOpacity,
      transparentStatusBar: _transparentStatusBar,
      tabBarStyle: _tabBarForAppBar,
      surfaceMode: _surfaceMode,
      blendLevel: _blendLevel,
      tooltipsMatchBackground: _tooltipsMatchBackground,

      fontFamily: _fontFamily,
      textTheme: _textTheme,
      primaryTextTheme: _textTheme,
      keyColors: _keyColors,
      tones: _flexTonesLight,
      subThemesData: _useSubThemes ? _subThemesData : null,
      visualDensity: _visualDensity,
      platform: _platform,

      typography: Typography.material2021(
        platform: _platform,
      ),
      // Add all our custom theme extensions, in this case we only have one.
      extensions: <ThemeExtension<dynamic>>{
        lightBrandTheme,
      },
    );
  }

  _getDarkTheme() {
    return FlexThemeData.dark(
      colors: (_useScheme && _computeDarkTheme)
          ? FlexColor.schemes[_scheme]!.light.toDark(_toDarkLevel)
          : _useScheme
              ? null
              : _computeDarkTheme
                  ? _schemeLight.toDark(_toDarkLevel, true)
                  // And finally, use the defined custom dark colors.
                  : _schemeDark,
      // To use a built-in scheme based on enum, don't assign colors above.
      scheme: _scheme,
      swapColors: _swapColors,
      usedColors: _usedColors,
      // For an optional ink black dark mode, set darkIsTrueBlack to true.
      darkIsTrueBlack: false,

      appBarStyle: FlexAppBarStyle.background,
      appBarElevation: _appBarElevation,
      appBarOpacity: _appBarOpacity,
      transparentStatusBar: _transparentStatusBar,
      tabBarStyle: _tabBarForAppBar,
      surfaceMode: _surfaceMode,
      blendLevel: _blendLevel,
      tooltipsMatchBackground: _tooltipsMatchBackground,
      fontFamily: _fontFamily,
      textTheme: _textTheme,
      primaryTextTheme: _textTheme,
      keyColors: _keyColors,
      tones: _flexTonesDark,
      subThemesData: _useSubThemes ? _subThemesData : null,
      visualDensity: _visualDensity,
      platform: _platform,

      typography: Typography.material2021(
        platform: _platform,
      ),
      // Add all our custom theme extensions, in this case we only have one.
      extensions: <ThemeExtension<dynamic>>{
        darkBrandTheme,
      },
    );
  }
}
