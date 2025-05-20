import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection_ext/iterables.dart';

import '../../routes.dart';
import 'eadditives.models.dart';

const iconSize = 24.0;

class EAdditivesCard extends StatelessWidget {
  final EAdditivesModel model;
  const EAdditivesCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        print(model.e);
        Get.toNamed('/${Routes.info}/${model.e}');
      },
      child: Card(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(15.0),
        // ),
        color: theme.cardColor,
        elevation: 1.5,
        child: GridTile(
          // footer: Text(
          //   model.name,
          //   style: TextStyle(color: theme.primaryColor),
          //   textAlign: TextAlign.center,
          //   maxLines: 2,
          //   overflow: TextOverflow.ellipsis,
          // ),
          // child: Icon(
          //   Icons.dangerous,
          //   color: _getColor(model.danger),
          //   size: iconSize,
          // ),
          header: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Icon(
                Icons.dangerous,
                color: _getColor(model.danger),
                size: iconSize,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 10.0),
              child: _getVegansIcons(model.vegans, isDark),
            ),
          ]),
          footer: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _getOrigin(model, theme),
            ),
          ),
          child: Center(
            child: Text(
              model.e,
              style: TextStyle(color: theme.primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }

  _getOrigin(EAdditivesModel model, ThemeData theme) {
    List<Widget> list = [];
    model.origin.forEachIndexed((index, element) {
      list.add(
        _getOriginIcons(int.parse(model.origin[index]), theme),
      );
    });
    return list;
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

  _getOriginIcons(int origin, ThemeData theme) {
    switch (origin) {
      case 6:
        return Icon(
          Icons.diamond_outlined,
          color: theme.primaryColor,
        );
      case 5:
        return Icon(
          Icons.vaccines_outlined,
          color: theme.primaryColor,
        );
      case 4:
        return Icon(
          Icons.cruelty_free_outlined,
          color: theme.primaryColor,
        );
      case 3:
        return Icon(
          Icons.biotech_outlined,
          color: theme.primaryColor,
        );
      case 2:
        return Icon(
          Icons.coronavirus_outlined,
          color: theme.primaryColor,
        );
      case 1:
        return Icon(
          Icons.eco_outlined,
          color: theme.primaryColor,
        );
      default:
        return Icon(
          Icons.eco_outlined,
          color: theme.primaryColor,
        );
    }
  }
}
