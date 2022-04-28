// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/models/PersonView.dart';
import 'package:flutter_code_challenge/screens/details/BigTextWidget.dart';
import 'package:flutter_code_challenge/screens/details/IconWidget.dart';

import 'IconTextWidget.dart';

class Details extends StatelessWidget {
  final PersonView person;
  const Details({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // aliases
              BigText(
                text: 'Aliases:\n' + person.aliases.join(),
              ),
              // titles
              BigText(
                text: 'Titles:\n' + person.titles.join(),
              ),
              // name
              BigText(
                text: 'Name: ' + person.name,
              ),
              // gender
              GenderIconWidget(
                  gender:
                      (person.gender == "Male") ? Gender.male : Gender.female),
              // culture
              BigText(
                text: "Culture:" + person.culture,
              ),
              // born
              IconTextWidget(
                iconData: Icons.child_care,
                text: person.born,
              ),
              // died
              IconTextWidget(
                iconData: Icons.dangerous,
                text: person.died,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
