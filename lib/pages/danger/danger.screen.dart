import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../app.dart';
import '../../shared/const/app_data.dart';
import '../eadditives/eadditives.controller.dart';
import '../eadditives/eadditives.widget.dart';
import '../start/start.dialog.dart';
import '/ui/layouts/base.dart';
import './danger.controller.dart';
import 'danger.models.dart';

class DangerPage extends GetView<DangerController> {
  DangerPage({Key? key}) : super(key: key);

  final appBarActions = [
    IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(CupertinoIcons.checkmark),
    ),
  ];

  final appBarTitle = const Text('menu_financial_send_invoice');

  isEULA(BuildContext context) async {
    final ThemeData theme = Theme.of(context);
    final TextStyle aboutTextStyle = theme.textTheme.bodyLarge!;
    final TextStyle linkStyle = theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.primary);
    if (!App.isEULA) {
      // await Get.dialog(
      //   LicenseDialogShowcase(
      //     app: 'multiE Additives',
      //     appStyle: aboutTextStyle,
      //     version: AppData.version,
      //     style: linkStyle,
      //   ),
      // );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return LicenseDialogShowcase(
            app: 'multiE Additives',
            appStyle: aboutTextStyle,
            version: AppData.version,
            style: linkStyle,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int count = (size.width / 120.0).round();

    // return FutureBuilder<void>(
    //   future: isEULA(context),
    //   builder: (
    //     BuildContext context,
    //     AsyncSnapshot<void> snapshot,
    //   ) {
        return BaseLayout(
          // const Text("danger"),

          Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 0,
            ),
            body: GetBuilder<DangerController>(
              init: controller,
              id: 'onItems',
              builder: (controller) {
                return controller.dangerItems.isNotEmpty
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
      // },
    // );
  }

  _getListData(BuildContext context) {
    List<Widget> widgets = [];
    controller.dangerItems.forEach((element) {
      widgets.add(DangerCard(model: element));
      if (controller.openStatus == element.danger) {
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

class DangerCard extends StatelessWidget {
  final DangerModel model;
  const DangerCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () async {
        final controllerDanger = Get.find<DangerController>();
        if (controllerDanger.openStatus == model.danger) {
          controllerDanger.openStatus = -1;
          controllerDanger.update(['onItems']);
        } else {
          controllerDanger.openStatus = model.danger;
          final controllerEAdditives = Get.find<EAdditivesController>();
          await controllerEAdditives.fillDangerItems(controllerDanger.openStatus);
          controllerDanger.update(['onItems']);
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
          child: Icon(
            Icons.dangerous,
            color: _getColor(model.danger),
            size: iconSize,
          ),
        ),
      ),
    );
  }

  _getColor(int dangerous) {
    switch (dangerous) {
      case 5:
        return Colors.red;
      case 4:
        return Colors.amber;
      case 3:
        return Colors.yellow;
      case 2:
        return Colors.green;
      case 1:
        return Colors.lightGreenAccent;
      case 0:
        return Colors.lightBlueAccent;
      default:
        return Colors.lightBlueAccent;
    }
  }
}

const iconSize2 = 24.0;

class DangerTile extends StatelessWidget {
  final DangerModel model;
  const DangerTile({Key? key, required this.model}) : super(key: key);

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
          Icon(
            Icons.dangerous,
            color: _getColor(model.danger),
            size: iconSize2,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              model.name,
              style: TextStyle(color: theme.primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      ),
    );
  }

  _getColor(int dangerous) {
    switch (dangerous) {
      case 5:
        return Colors.red;
      case 4:
        return Colors.amber;
      case 3:
        return Colors.yellow;
      case 2:
        return Colors.green;
      case 1:
        return Colors.lightGreenAccent;
      case 0:
        return Colors.lightBlueAccent;
      default:
        return Colors.lightBlueAccent;
    }
  }
}
