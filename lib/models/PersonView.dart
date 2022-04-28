class PersonView {
  final List<String> _titles;
  final List<String> _aliases;
  final String _name;
  final String _gender;
  final String _culture;
  final String _born;
  final String _died;
  final String _father;
  final String _mother;
  final String _spouse;

  PersonView(
      this._titles,
      this._aliases,
      this._name,
      this._gender,
      this._culture,
      this._born,
      this._died,
      this._father,
      this._mother,
      this._spouse);

//
//  Getter / Setters
//
  List<String> get aliases {
    if (_aliases.isNotEmpty) {
      List<String> aliases = [];
      for (var alias in _aliases) {
        aliases.add(alias + "\n");
      }
      return aliases;
    }
    return [""];
  }

  String get titles {
    if (_titles.isNotEmpty) {
      var str = "";
      for (var title in _titles) {
        str += titles + "\n";
      }
      return str;
    }
    return "";
  }

  String get name {
    if (_name == "") {
      return "No Name";
    } else {
      return _name;
    }
  }

  String get gender {
    return _gender;
  }

  String get culture {
    return _culture;
  }

  String get born {
    return _born;
  }

  String get died {
    return _died;
  }

  String get father {
    return _father;
  }

  String get mother {
    return _mother;
  }

  String get spouse {
    return _spouse;
  }

//
//  Custom perperties
//

  bool hasDetail() {
    return (_father != "") && (_spouse != "");
  }

  bool alive() {
    return (_died == "");
  }
}
