import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import '../eadditives/eadditives.widget.dart';
import './../../ui/layouts/base.dart';
import './vegans.controller.dart';
import 'vegans.models.dart';

class VegansPage extends GetView<VegansController> {
  VegansPage({Key? key}) : super(key: key);

  final appBarActions = [
    IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(CupertinoIcons.checkmark),
    ),
  ];

  final appBarTitle = const Text('menu_financial_send_invoice');

  @override
  Widget build(BuildContext context) {
    // final body = const Text("S");
    final size = MediaQuery.of(context).size;
    int count = (size.width / 120.0).round();

    return BaseLayout(
      // const Text("vegans"),

      Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
        ),
        body: GetBuilder<VegansController>(
          init: controller,
          id: 'onItems',
          builder: (controller) {
            return controller.vegansItems.isNotEmpty
                ? Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: GridView.count(
                          primary: true,
                          padding: const EdgeInsets.all(1.0),
                          crossAxisCount: count, //3,
//      childAspectRatio: 0.85,
                          mainAxisSpacing: 1.0,
                          crossAxisSpacing: 1.0,
                          children: _getListData(context),
                        ),
                      ),
                    ],
                  )
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      actions: appBarActions,
      title: appBarTitle,
    );
  }

  _getListData(BuildContext context) {
    List<Widget> widgets = [];
    controller.vegansItems.forEach((element) {
      widgets.add(VegansCard(model: element));
      if (controller.openStatus == element.vegans) {
        final controllerEAdditives = Get.find<EAdditivesController>();
        controllerEAdditives.eadditivesItems.forEach((element2) {
          widgets.add(EAdditivesCard(model: element2));
        });
      }
    });
    return widgets;
  }
}

const iconSize = 40.0;

class VegansCard extends StatelessWidget {
  // final String title;
  // final IconData iconData;
  final VegansModel model;
  const VegansCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    return GestureDetector(
      onTap: () async {
        final controllerVegans = Get.find<VegansController>();
        if (controllerVegans.openStatus == model.vegans) {
          controllerVegans.openStatus = -1;
          controllerVegans.update(['onItems']);
        } else {
          controllerVegans.openStatus = model.vegans;
          final controllerEAdditives = Get.find<EAdditivesController>();
          await controllerEAdditives.fillVegansItems(controllerVegans.openStatus);
          controllerVegans.update(['onItems']);
        }
      },
      child: Card(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        // ),
        color: theme.cardColor,
        elevation: 1.5,
        child: GridTile(
          footer: Text(
            model.name,
            style: TextStyle(color: theme.primaryColor),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          child: _getVegansIcons(model.vegans, isDark),
          // Center(child: Icon(Icons.touch_app,)),
        ),
      ),
    );
  }

  _getVegansIcons(int vegans, bool isDark) {
    switch (vegans) {
      case 0:
        return Icon(
          CupertinoIcons.exclamationmark,
          color: !isDark ? Colors.green : Colors.greenAccent,
          size: iconSize,
        );
      case 1:
        return Icon(
          Icons.question_mark,
          color: !isDark ? Colors.amber[500] : Colors.yellowAccent,
          size: iconSize,
        );
      case 2:
        return Icon(
          CupertinoIcons.clear,
          color: !isDark ? Colors.red : Colors.redAccent,
          size: iconSize,
        );
    }
  }
}

const iconSize2 = 24.0;

class VegansTile extends StatelessWidget {
  final VegansModel model;
  const VegansTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    return SizedBox(
      height: 40,
      width: 200,
      child: Card(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(width: 10),
          _getVegansIcons(model.vegans, isDark),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              model.name,
              style: TextStyle(color: theme.primaryColor),
            ),
          ),
        ]),
      ),
    );
  }

  _getVegansIcons(int vegans, bool isDark) {
    switch (vegans) {
      case 0:
        return Icon(
          CupertinoIcons.exclamationmark,
          color: !isDark ? Colors.green : Colors.greenAccent,
          size: iconSize2,
        );
      case 1:
        return Icon(
          Icons.question_mark,
          color: !isDark ? Colors.amber[500] : Colors.yellowAccent,
          size: iconSize2,
        );
      case 2:
        return Icon(
          CupertinoIcons.clear,
          color: !isDark ? Colors.red : Colors.redAccent,
          size: iconSize2,
        );
    }
  }
}
