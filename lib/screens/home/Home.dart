import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_challenge/bloc/home_bloc.dart';
import 'package:flutter_code_challenge/screens/home/HomeListWidget.dart';
import 'package:flutter_code_challenge/services/PersonsServices.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => HomeBloc(
            RepositoryProvider.of<PersonsService>(context),
          )..add(GetPersonsEvent())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Persons'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              final persons = state.persons;
              return HomeListWidget(
                parentContext: context,
                persons: persons,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
