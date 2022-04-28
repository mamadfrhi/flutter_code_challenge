import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code_challenge/screens/home/Home.dart';
import 'package:flutter_code_challenge/services/PersonsServices.dart';

void main() => runApp(const PersonsApp());

class PersonsApp extends StatelessWidget {
  const PersonsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => PersonsService(),
          )
        ],
        child: const HomePage(),
      ),
    );
  }
}
