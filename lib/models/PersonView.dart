class PersonView {
  PersonView({
    required this.url,
    required this.name,
    required this.gender,
    required this.culture,
    required this.born,
    required this.died,
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
  String father;
  String mother;
  String spouse;

  bool hasDetail() {
    return (father != "") && (spouse != "");
  }

  bool notAlive() {
    return (died != "");
  }
}
