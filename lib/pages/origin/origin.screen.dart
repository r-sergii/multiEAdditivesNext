import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import '../eadditives/eadditives.widget.dart';
import './../../ui/layouts/base.dart';
import './origin.controller.dart';
import 'origin.models.dart';

class OriginPage extends GetView<OriginController> {
  OriginPage({Key? key}) : super(key: key);

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
      // const Text("origin"),

      Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
        ),
        body: GetBuilder<OriginController>(
          init: controller,
          id: 'onItems',
          builder: (controller) {
            return controller.originItems.isNotEmpty
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
    controller.originItems.forEach((element) {
      widgets.add(OriginCard(model: element));
      if (controller.openStatus == element.origin) {
        final controllerEAdditives = Get.find<EAdditivesController>();
        controllerEAdditives.eadditivesItems.forEach((element2) {
          widgets.add(EAdditivesCard(model: element2));
        });
      }
    });
    return widgets;
  }
}

const iconSize = 32.0;

class OriginCard extends StatelessWidget {
  final OriginModel model;
  const OriginCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () async {
        final controllerOrigin = Get.find<OriginController>();
        if (controllerOrigin.openStatus == model.origin) {
          controllerOrigin.openStatus = -1;
          controllerOrigin.update(['onItems']);
        } else {
          controllerOrigin.openStatus = model.origin;
          final controllerEAdditives = Get.find<EAdditivesController>();
          await controllerEAdditives.fillOriginItems(controllerOrigin.openStatus);
          controllerOrigin.update(['onItems']);
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
          child: _getOriginIcons(model.origin, theme),
          // Center(child: Icon(Icons.touch_app,)),
        ),
      ),
    );
  }

  _getOriginIcons(int origin, ThemeData theme) {
    switch (origin) {
      case 6:
        return Icon(
          Icons.diamond_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      case 5:
        return Icon(
          Icons.vaccines_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      case 4:
        return Icon(
          Icons.cruelty_free_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      case 3:
        return Icon(
          Icons.biotech_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      case 2:
        return Icon(
          Icons.coronavirus_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      case 1:
        return Icon(
          Icons.eco_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      default:
        return Icon(
          Icons.eco_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
    }
  }
}

class OriginTile extends StatelessWidget {
  final OriginModel model;
  const OriginTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 40,
      width: 200,
      child: Card(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(width: 10),
          _getOriginIcons(model.origin, theme),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              model.name,
              style: TextStyle(color: theme.primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ]),
      ),
    );
  }

  _getOriginIcons(int origin, ThemeData theme) {
    switch (origin) {
      case 6:
        return Icon(
          Icons.diamond_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      case 5:
        return Icon(
          Icons.vaccines_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      case 4:
        return Icon(
          Icons.cruelty_free_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      case 3:
        return Icon(
          Icons.biotech_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      case 2:
        return Icon(
          Icons.coronavirus_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      case 1:
        return Icon(
          Icons.eco_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
      default:
        return Icon(
          Icons.eco_outlined,
          color: theme.primaryColor,
          size: iconSize,
        );
    }
  }
}
