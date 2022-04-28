import 'package:flutter/material.dart';
import 'BigTextWidget.dart';

class IconTextWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  const IconTextWidget({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 50,
          color: Colors.black,
        ),
        Expanded(
          child: BigText(text: text),
        )
      ],
    );
  }
}
