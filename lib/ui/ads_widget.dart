import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'dart:io' show Platform;
// import 'package:get/get.dart';

// import 'ads_mobile.dart';
// import 'ads_web.dart';
// import 'ads_desktop/ads.desktop.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const AdsMobile();
    // return const AdsWeb();
    // return AdsDesktop();
    return const SizedBox.shrink();
    // return GetPlatform.isMobile ? const AdsMobile() : const SizedBox.shrink();
    // return Platform.isAndroid ? const AdsMobile() : const AdsWeb();
  }
}
