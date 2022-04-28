import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  const BigText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 25),
    );
  }
}
