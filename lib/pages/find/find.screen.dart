import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import '../../routes.dart';
import '../../services/translator/translator.controller.dart';
import '../eadditives/eadditives.controller.dart';
import './../../ui/layouts/base.dart';
import './find.controller.dart';

const double localListViewWidth = 100.0;
const double localListViewHeight = 50.0;

class FindPage extends GetView<FindController> {
  FindPage({Key? key}) : super(key: key);

  // FindModel numberValue;
  // int _currentValue00;// = 1;
  // int _currentValue0;// = 1;
  // int _currentValue;// = 1;

  final appBarActions = [
    IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(CupertinoIcons.checkmark),
    ),
  ];

  final appBarTitle = const Text('menu_financial_send_invoice');
  final TranslatorController translator = Get.find<TranslatorController>();

  @override
  Widget build(BuildContext context) {
    // final body = const Text("S");

    return BaseLayout(
      // const Text("find"),
      getBody(context),
      actions: appBarActions,
      title: appBarTitle,
    );
  }

  getBody(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                getRowNumberPicker(context),
                Center(
                  child: Obx(() => Text(controller.eText.value, style: const TextStyle(fontSize: 35.0))),
                ),
                getCircleButton(context),
              ]),
            ),
          ),
        ],
      );
    } else {
      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: getRowNumberPicker(context),
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: Obx(() => Text(controller.eText.value, style: const TextStyle(fontSize: 35.0))),
                      ),
                      getCircleButton(context),
                    ]),
              ]),
            ),
          ),
        ],
      );
    }
  }

  getCircleButton(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Ink(
          decoration: ShapeDecoration(
            shape: const CircleBorder(),
            color: theme.primaryColor,
          ),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: theme.canvasColor,
            ),
            onPressed: () async {
              final controllerEAdditives = Get.find<EAdditivesController>();
              print(controller.eText.value);
              final model = await controllerEAdditives.getCount(controller.eText.value);
              if (model.count == 0) {
                Get.snackbar(
                  controller.eText.value.toString(),
                  translator.notinfo,
                  colorText: theme.indicatorColor,
                  backgroundColor: theme.hintColor,
                  icon: const Icon(Icons.add_alert),
                );
              } else {
                Get.toNamed('/${Routes.info}/${controller.eText.value}');
              }
            },
          )),
    );
  }

  getRowNumberPicker(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GetBuilder<FindController>(
      init: controller,
      id: 'onChanges',
      builder: (controller) {
        return Row(
          // center the children
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            NumberPicker(
              value: controller.findModel.currentValue00,
              minValue: 1,
              maxValue: 17,
              step: 1,
              haptics: true,
              // itemCount: 1,
              itemWidth: localListViewWidth,
              itemHeight: localListViewHeight,
              textStyle: TextStyle(fontSize: 25.0, color: theme.primaryColor),
              selectedTextStyle: const TextStyle(fontSize: 35.0),
              onChanged: (value) {
                controller.onChange00(value);
              },
            ),
            NumberPicker(
              value: controller.findModel.currentValue0,
              minValue: 0,
              maxValue: 9,
              step: 1,
              haptics: true,
              // itemCount: 1,
              itemWidth: localListViewWidth,
              itemHeight: localListViewHeight,
              textStyle: TextStyle(fontSize: 25.0, color: theme.primaryColor),
              selectedTextStyle: const TextStyle(fontSize: 35.0),
              onChanged: (value) {
                controller.onChange0(value);
              },
            ),
            NumberPicker(
              value: controller.findModel.currentValue,
              minValue: 0,
              maxValue: 9,
              step: 1,
              haptics: true,
              itemWidth: localListViewWidth,
              itemHeight: localListViewHeight,
              textStyle: TextStyle(fontSize: 25.0, color: theme.primaryColor),
              selectedTextStyle: const TextStyle(fontSize: 35.0),
              onChanged: (value) {
                controller.onChange(value);
              },
            ),
          ],
        );
      },
    );
  }
}
