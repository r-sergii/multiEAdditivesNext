import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../eadditives/eadditives.controller.dart';
import '../eadditives/eadditives.widget.dart';
import './../../ui/layouts/base.dart';
import './group.controller.dart';
import 'group.models.dart';

class GroupPage extends GetView<GroupController> {
  GroupPage({Key? key}) : super(key: key);

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
      // const Text("group"),
      Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 0,
        ),
        body: GetBuilder<GroupController>(
          init: controller,
          id: 'onItems',
          builder: (controller) {
            return controller.groupItems.isNotEmpty
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
  //   controller.groupItems.forEach((element) {
  //     widgets.add(GroupCard(model: element));
  //   });
  //   return widgets;
  // }

  _getListData(BuildContext context) {
    List<Widget> widgets = [];
    controller.groupItems.forEach((element) {
      widgets.add(GroupCard(model: element));
      if (controller.openStatus == element.groups) {
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

class GroupCard extends StatelessWidget {
  final GroupModel model;
  const GroupCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () async {
        final controllerGroup = Get.find<GroupController>();
        if (controllerGroup.openStatus == model.groups) {
          controllerGroup.openStatus = -1;
          controllerGroup.update(['onItems']);
        } else {
          controllerGroup.openStatus = model.groups;
          final controllerEAdditives = Get.find<EAdditivesController>();
          await controllerEAdditives.fillGroupsItems(controllerGroup.openStatus);
          controllerGroup.update(['onItems']);
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
            Icons.group_work_outlined,
            color: theme.primaryColor,
            size: iconSize,
          ),
          // child: Center(
          //   child: Text(model.name, style: TextStyle(color: theme.primaryColor), textAlign: TextAlign.center),
          // ),
          // header: Icon(
          //   Icons.group_work_outlined,
          //   color: theme.primaryColor,
          //   size: iconSize,
          // ),
          // child: const SizedBox(),
          // Center(child: Icon(Icons.touch_app,)),
        ),
      ),
    );
  }
}

class GroupTile extends StatelessWidget {
  final GroupModel model;
  const GroupTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 40,
      width: 160,
      child: Card(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
}
