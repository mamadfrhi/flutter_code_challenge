// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/models/PersonView.dart';
import 'package:flutter_code_challenge/screens/details/widgets/BigTextWidget.dart';
import 'package:flutter_code_challenge/screens/details/widgets/IconWidget.dart';
import '../../resources/TitlesContainer.dart';
import 'widgets/IconTextWidget.dart';

class Details extends StatelessWidget {
  final PersonView person;
  final DetailsTitleContainer _detailsTitleContainer =
      DetailsTitleContainer.shared;
  Details({Key? key, required this.person}) : super(key: key);

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
                text:
                    _detailsTitleContainer.aliasesTitle + person.aliases.join(),
              ),
              // titles
              BigText(
                text: _detailsTitleContainer.titlesTitle + person.titles.join(),
              ),
              // name
              BigText(
                text: _detailsTitleContainer.nameTitle + person.name,
              ),
              // gender
              GenderIconWidget(gender: person.gender),
              // culture
              BigText(
                text: _detailsTitleContainer.cultureTitle + person.culture,
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
