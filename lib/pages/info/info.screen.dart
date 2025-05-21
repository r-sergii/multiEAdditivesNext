import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '/pages/info/info.models.dart';
import '../group/group.models.dart';
import '/pages/group/group.screen.dart';
import '/pages/vegans/vegans.screen.dart';
import '../../services/translator/translator.controller.dart';
import '../../ui/text.dart';
import '../danger/danger.screen.dart';
import '../eadditives/eadditives.widget.dart';
// import '../origin/origin.models.dart';
import '../origin/origin.screen.dart';
import 'info.controller.dart';

const iconSize = 24.0;

class InfoPage extends GetView<InfoController> {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TranslatorController translator = Get.find<TranslatorController>();
    // final ThemeData theme = Theme.of(context);
    // final bool isDark = theme.brightness == Brightness.dark;

    // final appBarActions = [
    //   IconButton(
    //     onPressed: () {
    //       Get.back();
    //       // Get.offAllNamed('/find');
    //     },
    //     icon: const Icon(CupertinoIcons.checkmark),
    //   ),
    // ];

    // final appBarTitle = Text('${translator.additives}: ${Get.parameters["e"]}');
    // final appBarTitle = GetBuilder<InfoController>(
    //   init: controller,
    //   id: 'onModel',
    //   builder: (controller) {
    //     // return controller.eAdditivesModel.isLoad == true
    //     //     ? Text('${translator.additives}: ${controller.eAdditivesModel.e}')
    //     //     : Text('${translator.additives}: ');
    //     return Text('${translator.additives}: ${controller.eAdditivesModel.e}');
    //   },
    // );
// const CircularProgressIndicator()
    return GetBuilder<InfoController>(
      init: controller,
      id: 'onItems',
      builder: (controller) {
        return controller.isLoad != true
            ? Scaffold(
                appBar: AppBar(
                  title: Text('${translator.additives}: '),
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                      // Get.offAllNamed('/');
                    },
                    icon: const Icon(CupertinoIcons.back),
                  ),
                ),
                body: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Text('${translator.additives}: ${controller.eAdditivesModel.e}'),
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                      // Get.offAllNamed('/');
                    },
                    icon: const Icon(CupertinoIcons.back),
                  ),
                ),
                body: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 0), //32),
                        child: Column(
                          children: <Widget>[
                            Form(
                              child: SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
                                  // child: (MediaQuery.of(context).orientation == Orientation.portrait)
                                  //     ? _getVertical(context)
                                  //     : _getHorizontal(context),

                                  //  (MediaQuery.of(context).size.height + 100 > MediaQuery.of(context).size.width)
                                  //     ? _getVertical(context)
                                  //     : _getHorizontal(context),

                                  child: (GetPlatform.isMobile == true)
                                      ? (MediaQuery.of(context).orientation == Orientation.portrait)
                                          ? _getVertical(context)
                                          : _getHorizontal(context)
                                      : (MediaQuery.of(context).size.height + 100 > MediaQuery.of(context).size.width)
                                          ? _getVertical(context)
                                          : _getHorizontal(context)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }

  // _getItem(InfoModel model) {
  //   return VisibilityDetector(
  //     key: const Key('my-widget-key'),
  //     onVisibilityChanged: (visibilityInfo) {
  //       var visiblePercentage = visibilityInfo.visibleFraction * 100;
  //       debugPrint('Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
  //     },
  //     child: model.paragraph.contains(RegExp('T')) ? TextBody(text: model.info) : TextBlockquote(text: model.info),
  //   );
  // }

  _getHeader(String sectionName, int sectionNomer) {
    return VisibilityDetector(
      key: Key(sectionNomer.toString()),
      onVisibilityChanged: (visibilityInfo) async {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;
        debugPrint('Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
        if (visiblePercentage > 0) {
          if (!controller.isTranslate(sectionNomer)) {
            await controller.setTranslate(sectionNomer);
          }
        }
      },
      child: SectionHeader(caption: sectionName),
    );
  }

  _getItem(InfoModel model) {
    return GetBuilder<InfoController>(
        init: controller,
        tag: '${model.id}',
        id: 'onModel',
        builder: (controller) {
          return model.isTranslate
              ? model.paragraph.contains(RegExp('T'))
                  ? TextBody(text: model.info)
                  : TextBlockquote(text: model.info)
              : const Center(child: CircularProgressIndicator());
        });
  }

  _getBody() {
    // controller.infoItems
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (controller.infoItems1.isNotEmpty) _getHeader(controller.sectionsController.sectionsItems[0].name, 0),
      if (controller.infoItems1.isNotEmpty)
        ...List.generate(
          controller.infoItems1.length,
          (index) => Align(
            alignment: Alignment.centerLeft,
            child: _getItem(controller.infoItems1[index]),
          ),
        ).toList(),
      if (controller.infoItems2.isNotEmpty) _getHeader(controller.sectionsController.sectionsItems[1].name, 1),
      if (controller.infoItems2.isNotEmpty)
        ...List.generate(
          controller.infoItems2.length,
          (index) => Align(
            alignment: Alignment.centerLeft,
            child: _getItem(controller.infoItems2[index]),
          ),
        ).toList(),
      if (controller.infoItems3.isNotEmpty) _getHeader(controller.sectionsController.sectionsItems[2].name, 2),
      if (controller.infoItems3.isNotEmpty)
        ...List.generate(
          controller.infoItems3.length,
          (index) => Align(
            alignment: Alignment.centerLeft,
            child: _getItem(controller.infoItems3[index]),
          ),
        ).toList(),
      if (controller.infoItems4.isNotEmpty) _getHeader(controller.sectionsController.sectionsItems[3].name, 3),
      if (controller.infoItems4.isNotEmpty)
        ...List.generate(
          controller.infoItems4.length,
          (index) => Align(
            alignment: Alignment.centerLeft,
            child: _getItem(controller.infoItems4[index]),
          ),
        ).toList(),
      if (controller.infoItems5.isNotEmpty) _getHeader(controller.sectionsController.sectionsItems[4].name, 4),
      if (controller.infoItems5.isNotEmpty)
        ...List.generate(
          controller.infoItems5.length,
          (index) => Align(
            alignment: Alignment.centerLeft,
            child: _getItem(controller.infoItems5[index]),
          ),
        ).toList(),
      if (controller.infoItems6.isNotEmpty) _getHeader(controller.sectionsController.sectionsItems[5].name, 5),
      if (controller.infoItems6.isNotEmpty)
        ...List.generate(
          controller.infoItems6.length,
          (index) => Align(
            alignment: Alignment.centerLeft,
            child: _getItem(controller.infoItems6[index]),
          ),
        ).toList(),
      if (controller.infoItems7.isNotEmpty) _getHeader(controller.sectionsController.sectionsItems[6].name, 6),
      if (controller.infoItems7.isNotEmpty)
        ...List.generate(
          controller.infoItems7.length,
          (index) => Align(
            alignment: Alignment.centerLeft,
            child: _getItem(controller.infoItems7[index]),
          ),
        ).toList(),
    ]);
  }

  // _getBody() {
  //   return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
  //     if (controller.infoItems1.isNotEmpty) SectionHeader(caption: controller.sectionsController.sectionsItems[0].name),
  //     if (controller.infoItems1.isNotEmpty)
  //       ...List.generate(
  //         controller.infoItems1.length,
  //         (index) => Align(
  //           alignment: Alignment.centerLeft,
  //           child: controller.infoItems1[index].paragraph.contains(RegExp('T'))
  //               ? TextBody(text: controller.infoItems1[index].info)
  //               : TextBlockquote(text: controller.infoItems1[index].info),
  //         ),
  //       ).toList(),
  //     if (controller.infoItems2.isNotEmpty) SectionHeader(caption: controller.sectionsController.sectionsItems[1].name),
  //     if (controller.infoItems2.isNotEmpty)
  //       ...List.generate(
  //         controller.infoItems2.length,
  //         (index) => Align(
  //           alignment: Alignment.centerLeft,
  //           child: controller.infoItems2[index].paragraph.contains(RegExp('T'))
  //               ? TextBody(text: controller.infoItems2[index].info)
  //               : TextBlockquote(text: controller.infoItems2[index].info),
  //         ),
  //       ).toList(),
  //     if (controller.infoItems3.isNotEmpty) SectionHeader(caption: controller.sectionsController.sectionsItems[2].name),
  //     if (controller.infoItems3.isNotEmpty)
  //       ...List.generate(
  //         controller.infoItems3.length,
  //         (index) => Align(
  //           alignment: Alignment.centerLeft,
  //           child: controller.infoItems3[index].paragraph.contains(RegExp('T'))
  //               ? TextBody(text: controller.infoItems3[index].info)
  //               : TextBlockquote(text: controller.infoItems3[index].info),
  //         ),
  //       ).toList(),
  //     if (controller.infoItems4.isNotEmpty) SectionHeader(caption: controller.sectionsController.sectionsItems[3].name),
  //     if (controller.infoItems4.isNotEmpty)
  //       ...List.generate(
  //         controller.infoItems4.length,
  //         (index) => Align(
  //           alignment: Alignment.centerLeft,
  //           child: controller.infoItems4[index].paragraph.contains(RegExp('T'))
  //               ? TextBody(text: controller.infoItems4[index].info)
  //               : TextBlockquote(text: controller.infoItems4[index].info),
  //         ),
  //       ).toList(),
  //     if (controller.infoItems5.isNotEmpty) SectionHeader(caption: controller.sectionsController.sectionsItems[4].name),
  //     if (controller.infoItems5.isNotEmpty)
  //       ...List.generate(
  //         controller.infoItems5.length,
  //         (index) => Align(
  //           alignment: Alignment.centerLeft,
  //           child: controller.infoItems5[index].paragraph.contains(RegExp('T'))
  //               ? TextBody(text: controller.infoItems5[index].info)
  //               : TextBlockquote(text: controller.infoItems5[index].info),
  //         ),
  //       ).toList(),
  //     if (controller.infoItems6.isNotEmpty) SectionHeader(caption: controller.sectionsController.sectionsItems[5].name),
  //     if (controller.infoItems6.isNotEmpty)
  //       ...List.generate(
  //         controller.infoItems6.length,
  //         (index) => Align(
  //           alignment: Alignment.centerLeft,
  //           child: controller.infoItems6[index].paragraph.contains(RegExp('T'))
  //               ? TextBody(text: controller.infoItems6[index].info)
  //               : TextBlockquote(text: controller.infoItems6[index].info),
  //         ),
  //       ).toList(),
  //     if (controller.infoItems7.isNotEmpty) SectionHeader(caption: controller.sectionsController.sectionsItems[6].name),
  //     if (controller.infoItems7.isNotEmpty)
  //       ...List.generate(
  //         controller.infoItems7.length,
  //         (index) => Align(
  //           alignment: Alignment.centerLeft,
  //           child: controller.infoItems7[index].paragraph.contains(RegExp('T'))
  //               ? TextBody(text: controller.infoItems7[index].info)
  //               : TextBlockquote(text: controller.infoItems7[index].info),
  //         ),
  //       ).toList(),
  //   ]);
  // }

  _getVertical(BuildContext context) {
    final TranslatorController translator = Get.find<TranslatorController>();
    final size = MediaQuery.of(context).size;
    int count = (size.width / 200.0).round();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text('${controller.eAdditivesModel.e} - ${controller.eAdditivesModel.name}',
              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 120,
              height: 120,
              child: EAdditivesCard(
                model: controller.eAdditivesModel.toModel(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ExtendedHeader(caption: translator.danger),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DangerTile(model: controller.eAdditivesModel.dangerItem!),
                  ],
                ),
                ExtendedHeader(caption: translator.vegans),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    VegansTile(model: controller.eAdditivesModel.vegansItem!),
                  ],
                ),
              ],
            )
          ],
        ),
        ExtendedHeader(caption: translator.origin),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: _getListOriginData(context),
        // ),
        LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            height: controller.eAdditivesModel.originItems!.length > 2 ? 80 : 40,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              crossAxisCount: count,
              childAspectRatio: 4,
              children: List.generate(
                controller.eAdditivesModel.originItems!.length,
                (index) {
                  return OriginTile(model: controller.eAdditivesModel.originItems![index]);
                },
              ),
            ),
          );
        }),
        ExtendedHeader(caption: translator.group),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: _getListGroupsData(context),
        // )
        LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            // height: (controller.eAdditivesModel.groupsItems!.length ~/ 2 * 40) +
            //     controller.eAdditivesModel.groupsItems!.length.toDouble(),
            height: _calcVertHeight(controller.eAdditivesModel.groupsItems!),
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              crossAxisCount: count,
              childAspectRatio: 4,
              children: List.generate(
                controller.eAdditivesModel.groupsItems!.length,
                (index) {
                  return GroupTile(model: controller.eAdditivesModel.groupsItems![index]);
                },
              ),
            ),
          );
        }),
        _getBody()
      ],
    );
  }

  _getHorizontal(BuildContext context) {
    final TranslatorController translator = Get.find<TranslatorController>();
    final size = MediaQuery.of(context).size;
    int count = (size.width / 200.0).round();
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text('${controller.eAdditivesModel.e} - ${controller.eAdditivesModel.name}',
              style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 28)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 120,
              height: 120,
              child: EAdditivesCard(
                model: controller.eAdditivesModel.toModel(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ExtendedHeader(caption: translator.danger),
                    DangerTile(model: controller.eAdditivesModel.dangerItem!),
                    ExtendedHeader(caption: translator.vegans),
                    VegansTile(model: controller.eAdditivesModel.vegansItem!),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ExtendedHeader(caption: translator.origin),
                    // VegansTile(model: controller.eAdditivesModel.vegansItem!),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _getListOriginData(context),
                )
              ],
            )
          ],
        ),
        // ExtendedHeader(caption: translator.group),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: _getListGroupsData(context),
        // )
        ExtendedHeader(caption: translator.group),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   children: _getListGroupsData(context),
        // )
        LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            // height: ((controller.eAdditivesModel.groupsItems!.length ~/ 3) * 40) +
            //     controller.eAdditivesModel.groupsItems!.length.toDouble() +
            //     2.0,
            height: _calcHorizHeight(controller.eAdditivesModel.groupsItems!),
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0,
              crossAxisCount: count,
              childAspectRatio: 4,
              children: List.generate(
                controller.eAdditivesModel.groupsItems!.length,
                (index) {
                  return GroupTile(model: controller.eAdditivesModel.groupsItems![index]);
                },
              ),
            ),
          );
        }),
        _getBody(),
      ],
    );
  }

  _getListOriginData(BuildContext context) {
    List<Widget> widgets = [];
    controller.eAdditivesModel.originItems!.forEach((element) {
      widgets.add(OriginTile(model: element));
    });
    return widgets;
  }

  _getListGroupsData(BuildContext context) {
    List<Widget> widgets = [];
    controller.eAdditivesModel.groupsItems!.forEach((element) {
      widgets.add(GroupTile(model: element));
    });
    return widgets;
  }

  _calcHorizHeight(List<GroupModel>? groupsItems) {
    List<int> h = [0, 1, 1, 1, 2, 2, 2, 3, 3];
    // groupsItems!.length
    // return h[groupsItems!.length] * 40.0 + groupsItems!.length.toDouble();
    return h[groupsItems!.length] * 40.0 + groupsItems.length.toDouble();
  }

  _calcVertHeight(List<GroupModel>? groupsItems) {
    List<int> h = [0, 1, 1, 2, 2, 3, 3, 4, 4];
    // groupsItems!.length
    // return h[groupsItems!.length] * 40.0 + groupsItems!.length.toDouble() + 2.0;
    return h[groupsItems!.length] * 40.0 + groupsItems.length.toDouble() + 2.0;
  }
}

class ExtendedHeader extends StatelessWidget {
  final String caption;
  const ExtendedHeader({Key? key, required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(caption, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor)),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String caption;
  const SectionHeader({Key? key, required this.caption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = '${caption[0].toUpperCase()}${caption.substring(1)}';
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(title, style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor)),
      ),
    );
  }
}
