// ignore: file_names
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
          )..add(
              // tring get event
              GetPersonsEvent(),
            )),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Persons'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeLoadingState:
                return const Center(child: CircularProgressIndicator());
              case HomeLoadedState:
                final persons = (state as HomeLoadedState).persons;
                return HomeListWidget(parentContext: context, persons: persons);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
