// ignore: file_names
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
          // space
          const SizedBox(
            height: 45,
          ),
          // aliases
          BigText(
            text: person.aliases.join(),
          ),
          BigText(
            text: person.titles,
          ),
          // name
          BigText(
            text: person.name,
          ),
          // gender
          BigText(
            text: person.gender,
          ),
          // culture
          BigText(
            text: person.culture,
          ),
          // born
          BigText(
            text: person.born,
          ),
          // died
          BigText(
            text: person.died,
          ),
        ],
      )),
    );
  }
}
