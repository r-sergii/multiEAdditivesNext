import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '/app_controller.dart';
import '../../services/translator/translator.service.dart';
import '../../services/translator/translator.controller.dart';
import 'settings.controller.dart';
import '/routes.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TranslatorController translator = Get.find<TranslatorController>();
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final appBarActions = [
      IconButton(
        onPressed: () {
          // Get.back();
          Get.offAllNamed('/find');
        },
        icon: const Icon(CupertinoIcons.checkmark),
      ),
    ];

    final appBarTitle = Text(translator.settings);
    ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        actions: appBarActions,
        title: appBarTitle,
        leading: IconButton(
          onPressed: () {
            // Get.back();
            Get.offAllNamed('/find');
          },
          icon: const Icon(CupertinoIcons.back),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: scrollController,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: <Widget>[
                  Form(
                    child: SingleChildScrollView(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              translator.colorthemes,
                              // style: headlineTextStyle,
                            ),
                            // style: TextStyle(color: Theme.of(context).colorScheme.colorText, fontSize: 20)),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: Colors.grey.shade500,
                            ),
                            child: Obx(
                              // () => OutlineDropdownButton<int>(
                              () => DropdownButton<int>(
                                isExpanded: true,
                                onChanged: (value) {
                                  controller.selectedValueTheme = value == null ? 0 : value.toInt();
                                  debugPrint(value.toString());
                                },
                                hint: Text(translator.colorthemes),
                                value: controller.selectedValueTheme,
                                items: controller.listItemColorTheme.map((e) {
                                  return DropdownMenuItem(
                                    value: e.i,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Card(
                                          color: e.color,
                                          child: const SizedBox(width: 24, height: 24),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(e.title),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              translator.language,
                              // style: headlineTextStyle,
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: Colors.grey.shade500,
                            ),
                            child: Obx(
                              // () => OutlineDropdownButton<int>(
                              () => DropdownButton<int>(
                                isExpanded: true,
                                hint: Text(translator.language),
                                value: controller.selectedValueLang, //_value2,
                                onChanged: (value) {
                                  controller.selectedValueLang = value == null ? 0 : value.toInt();
                                  debugPrint(value.toString());
                                },
                                items: controller.listItemLanguage.map((e) {
                                  return DropdownMenuItem(
                                    value: e.i,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(e.short),
                                        const SizedBox(width: 10),
                                        Text(
                                          e.title,
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // ReadMoreButton(
                              //   onPressed: () async {
                              //     if (controller.selectedValueLang == 0) {
                              //       translator.reload(TranslatorController());
                              //     } else {
                              //       TranslatorService tr = TranslatorService();
                              //       translator.upload(await tr.change(
                              //           controller.listItemLanguage[controller.selectedValueLang].short));
                              //     }
                              //     Navigator.pushNamed(context, Routes.home);
                              //   },
                              //   title: translator.confirm,
                              // ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () async {
                                    //switch lang
                                    if (controller.selectedValueLang == 0) {
                                      translator.reload(TranslatorController());
                                      translator.writeStorage();
                                    } else {
                                      TranslatorService tr = TranslatorService();
                                      translator.upload(await tr
                                          .change(controller.listItemLanguage[controller.selectedValueLang].short));
                                      translator.writeStorage();

                                      // final localeService = Get.find<LocaleService>();
                                      // localeService.current = localeService.createLocale(controller
                                      //     .listItemLanguage[controller.selectedValueLang].short
                                      //     .toLowerCase());
                                      // if (localeService.current == localeService.createLocale('en')) {
                                      //   localeService.current = localeService.createLocale('he');
                                      // } else {
                                      //   localeService.current = localeService.createLocale('en');
                                      // }
                                    }
                                    final localeService = Get.find<LocaleService>();
                                    localeService.current = localeService.createLocale(
                                        controller.listItemLanguage[controller.selectedValueLang].short.toLowerCase());
                                    //switch theme
                                    final appController = Get.find<AppController>();
                                    // if (isDark) {
                                    if (controller.selectedValueTheme == 0) {
                                      appController.onThemeModeChanged(ThemeMode.light);
                                    } else {
                                      appController.onThemeModeChanged(ThemeMode.dark);
                                    }
                                    Get.offAllNamed(Routes.find);
                                  },
                                  child: Text(translator.confirm,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.greenAccent,
                                      ),
                                      //textScaleFactor: 2.5,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true),
                                ),
                              ),
                              // ReadMoreButton(
                              //     onPressed: () => Navigator.pushNamed(context, Routes.home), title: translator.cancel),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Get.offAllNamed(Routes.find);
                                  },
                                  child: Text(translator.cancel,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.redAccent,
                                      ),
                                      //textScaleFactor: 2.5,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
