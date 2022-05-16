// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/models/person_view.dart';
import 'package:flutter_code_challenge/screens/details/widgets/big_text.dart';
import 'package:flutter_code_challenge/screens/details/widgets/gender_icon.dart';
import 'package:flutter_code_challenge/screens/details/widgets/icon_text.dart';
import '../../resources/detail_titles_container.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // aliases
            BigText(
              text: _detailsTitleContainer.aliasesTitle + person.aliases.join(),
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
            GenderIcon(gender: person.gender),
            // culture
            BigText(
              text: _detailsTitleContainer.cultureTitle + person.culture,
            ),
            // born
            IconText(
              iconData: Icons.child_care,
              text: person.born,
            ),
            // died
            IconText(
              iconData: Icons.dangerous,
              text: person.died,
            ),
          ],
        ),
      ),
    );
  }
}
