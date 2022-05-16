import 'package:flutter/material.dart';
import '../../../resources/GenderEnum.dart';

class GenderIcon extends StatelessWidget {
  final Gender gender;
  const GenderIcon({Key? key, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (gender == Gender.male) {
      return const Icon(
        Icons.male,
        size: 50,
        color: Colors.blue,
      );
    }
    return const Icon(
      Icons.female,
      size: 50,
      color: Colors.pink,
    );
  }
}
