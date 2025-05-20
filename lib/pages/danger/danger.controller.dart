import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app.dart';
import '../../services/translator/translator.service.dart';
import '../../shared/const/app_data.dart';
import '../start/start.dialog.dart';
import 'danger.models.dart';
import 'danger.provider.dart';

class DangerController extends GetxController {
  int openStatus = -1;
  late List<DangerModel> dangerItems = [];

  @override
  void onInit() {
    super.onInit();
    final localeService = Get.find<LocaleService>();
    print(localeService.current.languageCode.toUpperCase());
    // await
    fillItems(localeService.current.languageCode.toUpperCase());
    Future.delayed(Duration.zero, () {
      isEULA();
    });
  }

  Future<void> fillItems(String lang) async {
    dangerItems.clear();
    // final items = await DangerProvider().getItems(lang);
    // dangerItems.addAll(items);
    dangerItems.addAll(await DangerProvider().getItems(lang));
    update(['onItems']);
    // await DangerProvider().getItems(lang).then((value) {
    //   dangerItems.clear();
    //   dangerItems.addAll(value);
    //   update(['onItems']);
    // });
  }

  getItem(int id, String lang) async {
    return await DangerProvider().getItem(id, lang);
  }

  getDanger(int id, String lang) async {
    return await DangerProvider().getDanger(id, lang);
  }

  isEULA() async {
    final ThemeData theme = Theme.of(Get.context!);
    final TextStyle aboutTextStyle = theme.textTheme.bodyLarge!;
    final TextStyle linkStyle = theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.primary);
    if (!App.isEULA) {
      await Get.dialog(
        LicenseDialogShowcase(
          app: 'multiE Additives',
          appStyle: aboutTextStyle,
          version: AppData.version,
          style: linkStyle,
        ),
      );
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return LicenseDialogShowcase(
      //       app: 'multiE Additives',
      //       appStyle: aboutTextStyle,
      //       version: AppData.version,
      //       style: linkStyle,
      //     );
      //   },
      // );
    }
  }
}
