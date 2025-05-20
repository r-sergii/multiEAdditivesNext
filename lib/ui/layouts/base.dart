import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import '/services/translator/translator.controller.dart';
// import '../../services/user/user.controller.dart';
import '/shared/widgets/universal/page_body.dart';
import '/base_controller.dart';
import '/app_controller.dart';
// import '/pages/danger/danger.route.dart';
import '/main.dart';
// import '/routes.dart';

import './../../shared/const/app_data.dart';
import './../../shared/widgets/app/responsive_scaffold.dart';

class BaseLayout extends GetView {
  //<AuthService> {
  final Widget body;
  final Widget? title;
  final List<Widget>? actions;
  const BaseLayout(
    this.body, {
    Key? key,
    this.title,
    this.actions,
  }) : super(key: key);
  // const BaseLayout(this.body, {Key? key}) : super(key: key);

  // getIcon(bool value) {
  //   return value ? Icons.person_add : Icons.person_off;
  // }

  @override
  Widget build(BuildContext context) {
    // final UserController userController = Get.find<UserController>();
    late List<String> route;
    if (GetPlatform.isWeb == true) {
      route = ['/find', '/danger', '/group', '/origin', '/vegans', '/classification', '/settings'];//, '/web'];
    } else if (GetPlatform.isMobile == true) {
      route = ['/find', '/danger', '/group', '/origin', '/vegans', '/classification', '/settings'];//, '/mobile'];
      // route = ['/find', '/danger', '/group', '/origin', '/vegans', '/classification', '/settings', '/desktop'];
    } else if (GetPlatform.isLinux == true) //GetPlatform.isDesktop
    // } else
    {
      route = ['/find', '/danger', '/group', '/origin', '/vegans', '/classification', '/settings'];//, '/linux'];
    } else //GetPlatform.isDesktop
    {
      route = ['/find', '/danger', '/group', '/origin', '/vegans', '/classification', '/settings'];//, '/desktop'];
    }

    // List<String> route = ['/find', '/danger', '/group', '/origin', '/vegans', '/classification', '/settings', '/web'];
    final appController = Get.find<AppController>();
    final baseController = Get.find<BaseController>();
    final TranslatorController translator = Get.find<TranslatorController>();

    // The menu items that we use on the responsive side menu.
    final List<ResponsiveMenuItems> menuItems = <ResponsiveMenuItems>[
      ResponsiveMenuItems(
        label: translator.find,
        icon: Icons.search,
      ),
      ResponsiveMenuItems(
        label: translator.danger,
        icon: Icons.dangerous_outlined,
      ),
      ResponsiveMenuItems(
        label: translator.group,
        icon: Icons.group_work_outlined,
      ),
      ResponsiveMenuItems(
        label: translator.origin,
        icon: Icons.compost,
      ),
      ResponsiveMenuItems(
        label: translator.vegans,
        icon: Icons.eco_outlined,
      ),
      ResponsiveMenuItems(
        label: translator.classification,
        icon: Icons.account_tree_outlined,
      ),
      ResponsiveMenuItems(
        label: translator.settings,
        icon: Icons.settings,
      ),
      // ResponsiveMenuItems(
      //   label: !userController.isLoad.value ? translator.signin : translator.signout,
      //   icon: !userController.isLoad.value ? Icons.person_add : Icons.person_off,
      // ),
      // ResponsiveMenuItems(
      //   label: !userController.isLoad.value ? translator.signin : translator.signout,
      //   icon: getIcon(!userController.isLoad.value),
      // ),
    ];

    // return Scaffold(
    //     appBar: AppBar(
    //       actions: actions,
    //       title: title,
    //     ),
    final MediaQueryData media = MediaQuery.of(context);
    final double margins = AppData.responsiveInsets(media.size.width);
    final double topPadding = media.padding.top + kToolbarHeight + margins;
    final double bottomPadding = media.padding.bottom + margins;
    final bool isPhone =
        media.size.width < AppData.phoneWidthBreakpoint || media.size.height < AppData.phoneHeightBreakpoint;
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headlineMedium = textTheme.headlineSmall!;
    final bool isDark = theme.brightness == Brightness.dark;

    // Get our custom brand color from the BrandTheme extension, with a
    // fallback to primary color.
    final Color brandColor = theme.extension<BrandTheme>()!.brandColor ?? theme.colorScheme.primary;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: FlexSystemNavBarStyle.background,
        useDivider: false,
        opacity: 0.60,
      ),
      child: ResponsiveScaffold(
        title: Text(AppData.title(context)),
        // menuTitle: const Text(AppData.packageName),
        menuLeadingTitle: Text(
          AppData.title(context),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
        ),
        menuLeadingSubtitle: const Text('Version ${AppData.versionMajor}'),
        menuAboutTitle: translator.about,
        // menuLeadingAvatarLabel: 'FCS',
        // menuLeadingAvatarImage: 'images/icon.png',
        menuLeadingAvatarImage: 'images/eadditives_lite.png',
        menuItems: menuItems, // AppData.menuItems,
        menuItemsEnabled: baseController.menuItemsEnabled,
        menuItemsIconState: baseController.menuItemsIconState,
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: AppData.desktopWidthBreakpoint,
        extendBodyBehindAppBar: true,
        extendBody: true,
        onSelect: (int index) {
          // print(appController.themeMode);
          // // appController.onThemeModeChanged(ThemeMode.dark);
          // if (index == 1) {
          //   if (isDark) {
          //     appController.onThemeModeChanged(ThemeMode.light);
          //   } else {
          //     appController.onThemeModeChanged(ThemeMode.dark);
          //   }
          // }
          // if (index == 2) {
          //   Get.offAllNamed(route[0]);
          // }
          // if (index == 7) {
          //    Get.toNamed(route[7]);
          // }
          // if (index >= 7) {
          //   //6
          //   if (userController.isLoad.value == true) {
          //     userController.isLoad.value = false;
          //     userController.writeStorge("");
          //     Get.offAllNamed(route[userController.lastIndex]);
          //   } else {
          //     Get.toNamed(route[index]);
          //     // userController.update(['onReload']);
          //   }
          // } else {
            Get.offAllNamed(route[index]);
          // }
          // Get.offAllNamed(route[index]);
          // userController.lastIndex = index;
        },
        // body: body, // Row(
        // children: [Expanded(child: body)],
        // children: [SideMenu(controller: controller), Expanded(child: body)],
        // children: [SideMenu(), Expanded(child: body)],
        //)
        body: PageBody(
          child: body,
        ),
      ),
    );
  }
}
