import 'package:flutter/material.dart';

class GenderIconWidget extends StatelessWidget {
  final Gender gender;
  const GenderIconWidget({Key? key, required this.gender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (gender == Gender.male) {
      return const Icon(
        Icons.male,
        size: 50,
        color: Colors.blue,
      );
    } else {
      return const Icon(
        Icons.female,
        size: 50,
        color: Colors.pink,
      );
    }
  }
}

enum Gender { male, female }
