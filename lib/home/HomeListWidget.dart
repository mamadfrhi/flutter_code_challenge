import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_challenge/bloc/home_bloc.dart';
import 'package:flutter_code_challenge/home/Details.dart';
import 'package:flutter_code_challenge/models/PersonView.dart';
import '../models/PersonsActivity.dart';

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
        return Card(
          child: ListTile(
            title: Text(persons[index].name),
            subtitle: Text(persons[index].gender),
            trailing: persons[index].notAlive()
                ? const Icon(
                    Icons.heart_broken,
                    color: Colors.black,
                  )
                : null,
            onTap: () => _navigateToDetailPage(parentContext, persons[index]),
          ),
        );
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
          bloc.add(GetPersonsEvent());
        });
  }

  void _navigateToDetailPage(ctx, person) async {
    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (_) => Details(
              person: person,
            )));
  }
}
