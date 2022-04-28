import 'package:flutter_code_challenge/screens/details/widgets/IconWidget.dart';

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

  ///  Getter / Setters

  List<String> get aliases {
    if (_aliases.isNotEmpty && _aliases.first != "") {
      List<String> aliases = [];
      for (var alias in _aliases) {
        if (alias.isNotEmpty) {
          aliases.add(alias + "\n");
        }
      }
      return aliases;
    }
    return ["No aliases specified!"];
  }

  List<String> get titles {
    if (_titles.isNotEmpty) {
      List<String> titles = [];
      for (var title in _titles) {
        titles.add(title + "\n");
      }
      return titles;
    }
    return [""];
  }

  String get name {
    if (_name == "") {
      return "No Name";
    }
    return _name;
  }

  Gender get gender {
    if (_gender == "Male") {
      return Gender.male;
    }
    return Gender.female;
  }

  String get culture {
    if (_culture == "") {
      return "Not specified!";
    }
    return _culture;
  }

  String get born {
    if (_born == "") {
      return "Not specified!";
    }
    return _born;
  }

  String get died {
    if (_died == "") {
      return "Not specified!";
    }
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

  ///  Custom perperties

  bool hasDetail() {
    return (_father != "") && (_spouse != "");
  }

  bool alive() {
    return (_died == "");
  }
}
