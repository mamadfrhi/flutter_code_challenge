import 'dart:convert';
import 'package:flutter_code_challenge/models/PersonView.dart';
import 'package:http/http.dart';
import '../models/PersonsActivity.dart';

class PersonsService {
  int pageNumber = 0;

  List<Person> _personsArray = [];

  Future<List<Person>> getPersons() async {
    String _baseURL = "https://www.anapioficeandfire.com/api/characters";
    pageNumber += 1;
    _baseURL = _baseURL + "?page=" + pageNumber.toString();
    final _baseURI = Uri.parse(_baseURL);
    final response = await get(_baseURI);
    final json = response.body;

    final List<Person>? persons = personsActivityFromJson(json);
    if (persons != null) {
      _personsArray += persons;
    }
    return _personsArray;
  }

  //
  // Conversion methods
  //

  List<PersonView> personsViews(List<Person> personsActivity) {
    List<PersonView> _personsViewArray = [];
    personsActivity.forEach((element) {
      final newPersonView = PersonView(
        element.name,
        element.gender,
        element.culture,
        element.born,
        element.died,
        element.father,
        element.father,
        element.spouse,
      );
      _personsViewArray.add(newPersonView);
    });
    return _personsViewArray;
  }

  List<Person> personsActivityFromJson(String strJSON) {
    final decodedBody = json.decode(strJSON);
    List<Person> _persons = [];
    decodedBody.forEach(
      (person) {
        final newPerson = Person.fromJson(person);
        _persons.add(newPerson);
      },
    );
    return _persons;
  }
}
