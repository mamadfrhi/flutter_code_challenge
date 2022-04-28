import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/models/PersonView.dart';
import 'package:flutter_code_challenge/screens/details/BigTextWidget.dart';

class Details extends StatelessWidget {
  final PersonView person;
  const Details({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          BigText(
            text: person.name,
          ),
          BigText(
            text: person.gender,
          ),
          BigText(
            text: person.culture,
          ),
          BigText(
            text: person.born,
          ),
          BigText(
            text: person.died,
          ),
        ],
      )),
    );
  }
}
