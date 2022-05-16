// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_challenge/bloc/home_bloc.dart';
import 'package:flutter_code_challenge/models/person_view.dart';
import 'person_card.dart';

class HomeListWidget extends StatelessWidget {
  final List<PersonView> persons;
  final BuildContext parentContext;

  const HomeListWidget(
      {Key? key, required this.persons, required this.parentContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: persons.length + 1, // because of the button
      itemBuilder: (BuildContext context, int index) {
        if (index == persons.length) {
          return _loadMoreButton();
        }
        return PersonCard(
            person: persons[index], grandParentCtx: parentContext);
      },
    );
  }

  ElevatedButton _loadMoreButton() {
    return ElevatedButton(
        child: const Text(
          'Load More',
        ),
        onPressed: () {
          final bloc = BlocProvider.of<HomeBloc>(parentContext);
          bloc.add(FetchPersonsEvent());
        });
  }
}
