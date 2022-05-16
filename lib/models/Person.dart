class Person {
  final String url;
  final String name;
  final String gender;
  final String culture;
  final String born;
  final String died;
  final List<String>? titles;
  final List<String>? aliases;
  final String father;
  final String mother;
  final String spouse;

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
