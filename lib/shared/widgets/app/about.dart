import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/pages/start/start.dialog.dart';
import '/services/translator/translator.controller.dart';
import '../../const/app_data.dart';
import '../../utils/link_text_span.dart';

/// An about icon button used on the example's app app bar.
class AboutIconButton extends StatelessWidget {
  const AboutIconButton({super.key, this.color});

  /// The color used on the icon button.
  ///
  /// If null, default to Icon() class default color.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.info, color: color),
      onPressed: () {
        showAppAboutDialog(context);
      },
    );
  }
}

// This [showAppAboutDialog] function is based on the [AboutDialog] example
// that exist(ed) in the Flutter Gallery App.
void showAppAboutDialog(BuildContext context) {
  final ThemeData theme = Theme.of(context);
  final TextStyle aboutTextStyle = theme.textTheme.bodyLarge!;
  final TextStyle footerStyle = theme.textTheme.bodySmall!;
  final TextStyle linkStyle = theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.primary);
  final TranslatorController translator = Get.find<TranslatorController>();

  final MediaQueryData media = MediaQuery.of(context);
  final double width = media.size.width;
  final double height = media.size.height;

  // Get the card's ShapeBorder from the themed card shape.
  // This was kind of interesting to do, seem to work, for this case at least.
  final ShapeBorder? shapeBorder = theme.cardTheme.shape;
  double buttonRadius = 4; // Default un-themed value
  if (shapeBorder is RoundedRectangleBorder?) {
    final BorderRadiusGeometry? border = shapeBorder?.borderRadius;
    if (border is BorderRadius?) {
      final Radius? radius = border?.topLeft;
      buttonRadius = radius?.x == radius?.y ? (radius?.x ?? 4.0) : 4.0;
    }
  }

  showAboutDialog(
    context: context,
    applicationName: AppData.title(context),
    applicationVersion: AppData.version,
    applicationIcon: Image.asset(AppData.icon, width: 80, height: 80), //'images/eadditives_lite.png'),
    // applicationIcon: Row(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     FlexThemeModeOptionButton(
    //       optionButtonBorderRadius: buttonRadius,
    //       selected: true,
    //       width: 30,
    //       height: 30,
    //       flexSchemeColor: FlexSchemeColor(
    //         primary: theme.colorScheme.primary,
    //         primaryContainer: theme.colorScheme.primaryContainer,
    //         secondary: theme.colorScheme.secondary,
    //         secondaryContainer: theme.colorScheme.secondaryContainer,
    //       ),
    //     ),
    //   ],
    // ),
    applicationLegalese: '${AppData.copyright}\n${AppData.author}\n${AppData.license}',
    // applicationLegalese: '${AppData.copyright}\n${AppData.license}',
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: RichText(
          text: TextSpan(
            children: [
              // TextSpan(style: aboutTextStyle, text: 'Handbook of food additives. \n\n'),
              WidgetSpan(
                child: Icon(Icons.info_outline, color: Theme.of(context).colorScheme.primary),
              ),
              TextSpan(style: aboutTextStyle, text: '\t\t'),
              LinkTextSpan(
                style: linkStyle,
                uri: AppData.multiAppsUri,
                text: 'multiApps.inf.ua',
              ),
              TextSpan(style: aboutTextStyle, text: '\n'),
              WidgetSpan(
                child: Icon(Icons.email_outlined, color: Theme.of(context).colorScheme.primary),
              ),
              TextSpan(style: aboutTextStyle, text: '\t\t'),
              LinkTextSpan(
                style: linkStyle,
                uri: AppData.supportUri,
                text: 'multiApps@i.ua',
              ),
              if(GetPlatform.isWeb != true)
                TextSpan(style: aboutTextStyle, text: '\n'),
              if(GetPlatform.isWeb != true)
                WidgetSpan(
                  child: Icon(Icons.star_border, color: Theme.of(context).colorScheme.primary),
                ),
              if(GetPlatform.isWeb != true)
                TextSpan(style: aboutTextStyle, text: '\t\t'),
              if (GetPlatform.isWeb == true)
                LinkTextSpan(
                  style: linkStyle,
                  uri: AppData.storeWebUri,
                  text: AppData.storeWebName,
                ),
              if (GetPlatform.isAndroid == true)
                LinkTextSpan(
                  style: linkStyle,
                  uri: AppData.storeAndroidUri,
                  text: AppData.storeAndroidName,
                ),
              if (GetPlatform.isLinux == true)
                LinkTextSpan(
                  style: linkStyle,
                  uri: AppData.storeLinuxUri,
                  text: AppData.storeLinuxName,
                ),
              if (GetPlatform.isWindows == true)
                LinkTextSpan(
                  style: linkStyle,
                  uri: AppData.storeWindowsUri,
                  text: AppData.storeWindowsName,
                ),
              TextSpan(style: aboutTextStyle, text: '\n'),
              WidgetSpan(
                child: Icon(Icons.local_police, color: Theme.of(context).colorScheme.primary),
              ),
              TextSpan(style: aboutTextStyle, text: '\t\t'),
              LinkTextSpan(
                style: linkStyle,
                uri: AppData.privacyPolicyUri,
                text: translator.privacyPolicy,
              ),
              TextSpan(style: aboutTextStyle, text: '\n'),
              // CupertinoIcons.rosette
              WidgetSpan(
                child: Icon(Icons.workspace_premium_outlined, color: Theme.of(context).colorScheme.primary),
              ),
              TextSpan(style: aboutTextStyle, text: '\t\t'),
              ButtonTextSpan(
                style: linkStyle,
                uri: AppData.privacyPolicyUri,
                text: translator.license,
                callback: () {
                  Get.dialog(
                    LicenseDialogShowcase(
                      app: 'multiE Additives',
                      appStyle: aboutTextStyle,
                      version: AppData.version,
                      style: linkStyle,
                    ),
                  );
                },
              ),
              TextSpan(style: aboutTextStyle, text: '\n'),

              // TextSpan(
              //   style: aboutTextStyle,
              //   text: 'The ${AppData.title(context)} application demonstrates '
              //       'features of the ${AppData.packageName} Flutter theming '
              //       'package.\n\n'
              //       'To learn more, check out the package on ',
              // ),
              // LinkTextSpan(
              //   style: linkStyle,
              //   uri: AppData.packageUri,
              //   text: 'pub.dev',
              // ),
              // TextSpan(
              //   style: aboutTextStyle,
              //   text: '. It also includes the source '
              //       'code of this application.\n\n',
              // ),
              // TextSpan(
              //   style: footerStyle,
              //   text: 'Built with Flutter ${AppData.flutterVersion}, '
              //       'using ${AppData.packageName} '
              //       '${AppData.packageVersion}\n'
              //       'Media size (w:${width.toStringAsFixed(0)}, '
              //       'h:${height.toStringAsFixed(0)})\n\n',
              // ),
            ],
          ),
        ),
      ),
    ],
  );
}
