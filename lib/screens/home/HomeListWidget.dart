// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_challenge/bloc/home_bloc.dart';
import 'package:flutter_code_challenge/models/PersonView.dart';
import '../details/Details.dart';

class HomeListWidget extends StatelessWidget {
  const HomeListWidget(
      {Key? key, required this.persons, required this.parentContext})
      : super(key: key);
  final List<PersonView> persons;
  final BuildContext parentContext;

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

// TODO: make separate widget for Card

class PersonCard extends StatelessWidget {
  final PersonView person;
  final BuildContext grandParentCtx;
  const PersonCard(
      {Key? key, required this.person, required this.grandParentCtx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(person.name),
        subtitle: Text(person.gender.name.toString()),
        trailing: person.alive()
            ? null
            : const Icon(
                Icons.heart_broken,
                color: Colors.black,
              ),
        enabled: person.hasDetail(),
        onTap: () => _navigateToDetailPage(grandParentCtx, person),
      ),
    );
  }

  void _navigateToDetailPage(parentContext, person) async {
    Navigator.of(parentContext).push(
      MaterialPageRoute(
        builder: (_) => Details(
          person: person,
        ),
      ),
    );
  }
}
