
import 'package:flutter/material.dart';
import '../services/PersonsServices.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget({Key? key, required this.persons}) : super(key: key);
  final List<PersonActivity> persons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: persons.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(persons[index].name!),
            subtitle: Text(persons[index].gender!),
          ),
        );
      },
    );
  }