import 'package:flutter/material.dart';

const Widget divider = Divider(color: Color(0xFFEEEEEE), thickness: 1);
Widget dividerSmall = Container(
  width: 40,
  decoration: const BoxDecoration(
    border: Border(
      bottom: BorderSide(
        color: Color(0xFFA0A0A0),
        width: 1,
      ),
    ),
  ),
);

class DividerSize extends StatelessWidget {
  final double space;
  const DividerSize({
    Key? key,
    required this.space,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
      SizedBox(
        height: space / 2,
      ),
      divider,
      SizedBox(
        height: space / 2,
      ),
    ]);
  }
}