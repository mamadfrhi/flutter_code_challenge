class Person {
  Person({
    required this.url,
    required this.name,
    required this.gender,
    required this.culture,
    required this.born,
    required this.died,
    this.titles,
    this.aliases,
    required this.father,
    required this.mother,
    required this.spouse,
  });

  String url;
  String name;
  String gender;
  String culture;
  String born;
  String died;
  List<String>? titles;
  List<String>? aliases;
  String father;
  String mother;
  String spouse;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
      url: json["url"],
      name: json["name"],
      gender: json["gender"],
      culture: json["culture"],
      born: json["born"],
      died: json["died"],
      titles: List<String>.from(json["titles"].map((x) => x)),
      aliases: List<String>.from(json["aliases"].map((x) => x)),
      father: json["father"],
      mother: json["mother"],
      spouse: json["spouse"]);
}
