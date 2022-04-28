import 'dart:convert';
import 'package:flutter_code_challenge/models/PersonView.dart';
import 'package:http/http.dart';
import '../models/Person.dart';

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

  List<PersonView> personsViews(List<Person> personsModel) {
    List<PersonView> _personsViewArray = [];
    for (var person in personsModel) {
      final personView = PersonView(
        person.titles!,
        person.aliases!,
        person.name,
        person.gender,
        person.culture,
        person.born,
        person.died,
        person.father,
        person.father,
        person.spouse,
      );
      _personsViewArray.add(personView);
    }
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
