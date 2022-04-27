// To parse this JSON data, do
//
//     final personsActivity = personsActivityFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart';

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

class PersonActivity {
  PersonActivity({
    this.url,
    this.name,
    this.gender,
    this.culture,
    this.born,
    required this.died,
    this.titles,
    this.aliases,
    this.father,
    this.mother,
    this.spouse,
    this.allegiances,
    this.books,
    this.povBooks,
    this.tvSeries,
    this.playedBy,
  });

  String? url;
  String? name;
  String? gender;
  String? culture;
  String? born;
  String? died;
  List<String>? titles;
  List<String>? aliases;
  String? father;
  String? mother;
  String? spouse;
  List<dynamic>? allegiances;
  List<String>? books;
  List<dynamic>? povBooks;
  List<String>? tvSeries;
  List<String>? playedBy;

  factory PersonActivity.fromJson(Map<String, dynamic> json) => PersonActivity(
        //url: json["url"],
        name: json["name"],
        gender: json["gender"],
        //culture: json["culture"],
        //born: json["born"],
        died: json["died"],
        //titles: List<String>.from(json["titles"].map((x) => x)),
        //aliases: List<String>.from(json["aliases"].map((x) => x)),
        father: json["father"],
        mother: json["mother"],
        spouse: json["spouse"],
        //allegiances: List<dynamic>.from(json["allegiances"].map((x) => x)),
        //books: List<String>.from(json["books"].map((x) => x)),
        //povBooks: List<dynamic>.from(json["povBooks"].map((x) => x)),
        //tvSeries: List<String>.from(json["tvSeries"].map((x) => x)),
        //playedBy: List<String>.from(json["playedBy"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
        "gender": gender,
        "culture": culture,
        "born": born,
        "died": died,
        // "titles": List<dynamic>.from(titles.map((x) => x)),
        // "aliases": List<dynamic>.from(aliases.map((x) => x)),
        "father": father,
        "mother": mother,
        "spouse": spouse,
        // "allegiances": List<dynamic>.from(allegiances.map((x) => x)),
        // "books": List<dynamic>.from(books.map((x) => x)),
        // "povBooks": List<dynamic>.from(povBooks.map((x) => x)),
        // "tvSeries": List<dynamic>.from(tvSeries.map((x) => x)),
        // "playedBy": List<dynamic>.from(playedBy.map((x) => x)),
      };
}

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
