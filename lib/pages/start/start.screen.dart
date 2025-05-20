// import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../ui/icons/icons.dart';
import './start.controller.dart';

// ImageView(String? imageUrl) {
//   if (imageUrl == null || imageUrl.isEmpty) {
//     return const Icon(Icons.do_not_disturb);
//   }

//   if (!GetPlatform.isWeb) return Image.network(imageUrl);
//   // https://github.com/flutter/flutter/issues/41563
//   // ignore: undefined_prefixed_name
//   ui.platformViewRegistry.registerViewFactory(
//     imageUrl,
//     (int _) => ImageElement()..src = imageUrl,
//   );
//   return HtmlElementView(
//     viewType: imageUrl,
//   );
// }
class StartPage extends GetView<StartController> {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const Center(child: CircularProgressIndicator());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/eadditives_lite.png'), //assets/splash.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.cell_tower, size: 80, color: Theme.of(context).secondaryHeaderColor),
                // Obx(() => Icon(Icons.bolt,//CupertinoIcons.bolt_circle,
                Obx(() => Icon(CupertinoIcons.bolt_circle,
                    size: 80, color: controller.isInet ? Colors.greenAccent : Colors.redAccent)),
                // Icon(CupertinoIcons.cube_box, size: 80, color: Theme.of(context).secondaryHeaderColor),
                // Obx(() => Icon(CupertinoIcons.circle,//.cloud, //Icons.cloud_circle_outlined,
                // Obx(() => Icon(Icons.cloud_circle_outlined,
                Obx(() =>
                    AIcon.cloudInCircle(size: 80, color: controller.isBackend ? Colors.greenAccent : Colors.redAccent)),
                // Icon(Icons.person_outline, size: 80, color: Theme.of(context).secondaryHeaderColor),
                // Icon(Icons.account_circle_outlined, size: 80, color: Theme.of(context).secondaryHeaderColor),
                // Obx(() => Icon(Icons.person, //CupertinoIcons.person_circle,
                Obx(() => Icon(CupertinoIcons.person_circle,
                    size: 80, color: controller.isUser ? Colors.greenAccent : Colors.redAccent)),
                // const HtmlElementView(viewType: 'http://multiapps.inf.ua/icons/calendar_lite.png'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
