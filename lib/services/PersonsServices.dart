import 'dart:convert';
import 'package:http/http.dart';

import '../models/PersonsActivity.dart';

List<PersonActivity> personsActivityFromJson(String strJSON) {
  final decodedBody = json.decode(strJSON);
  List<PersonActivity> _persons = [];
  decodedBody.forEach(
    (person) {
      final newPerson = PersonActivity.fromJson(person);
      _persons.add(newPerson);
    },
  );
  return _persons;
}

String personsActivityToJson(PersonActivity data) => json.encode(data.toJson());

class PersonsService {
  int pageNumber = 0;

  List<PersonActivity> _personsArray = [];

  Future<List<PersonActivity>> getPersons() async {
    String _baseURL = "https://www.anapioficeandfire.com/api/characters";
    pageNumber += 1;
    _baseURL = _baseURL + "?page=" + pageNumber.toString();
    final _baseURI = Uri.parse(_baseURL);
    final response = await get(_baseURI);
    final json = response.body;

    final List<PersonActivity>? persons = personsActivityFromJson(json);
    if (persons != null) {
      _personsArray += persons;
    }
    return _personsArray;
  }
}
