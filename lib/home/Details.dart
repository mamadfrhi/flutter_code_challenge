import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/models/PersonView.dart';

class Details extends StatelessWidget {
  final PersonView person;
  const Details({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text("details"),
      ),
      body: Center(
          child: Column(
        children: [
          BigText(
            text: person.name,
          ),
          BigText(
            text: person.culture,
          ),
          BigText(
            text: person.father,
          ),
          BigText(
            text: person.gender,
          ),
          BigText(
            text: person.mother,
          ),
        ],
      )),
    );
  }
}
