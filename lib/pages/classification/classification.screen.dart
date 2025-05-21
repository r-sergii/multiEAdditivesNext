import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import '../eadditives/eadditives.widget.dart';
import './../../ui/layouts/base.dart';
import 'classification.controller.dart';
import 'classification.models.dart';

class ClassificationPage extends GetView<ClassificationController> {
  ClassificationPage({Key? key}) : super(key: key);

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
      // const Text("find"),

      Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
        ),
        body: GetBuilder<ClassificationController>(
          init: controller,
          id: 'onItems',
          builder: (controller) {
            return controller.classificationItems.isNotEmpty
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

  // _getListData(BuildContext context) {
  //   List<Widget> widgets = [];
  //   controller.findItems.forEach((element) {
  //     widgets.add(ClassificationCard(model: element));
  //   });
  //   return widgets;
  // }

  _getListData(BuildContext context) {
    List<Widget> widgets = [];
    controller.classificationItems.forEach((element) {
      widgets.add(ClassificationCard(model: element));
      if (controller.openStatus == element.id) {
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

class ClassificationCard extends StatelessWidget {
  final ClassificationModel model;
  const ClassificationCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () async {
        final controllerDanger = Get.find<ClassificationController>();
        if (controllerDanger.openStatus == model.id) {
          controllerDanger.openStatus = -1;
          controllerDanger.update(['onItems']);
        } else {
          controllerDanger.openStatus = model.id;
          final controllerEAdditives = Get.find<EAdditivesController>();
          await controllerEAdditives.fillClassificationItems(model.start, model.offset);
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
          child: Center(
            child: Text(
              model.classification,
              style: TextStyle(color: theme.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
