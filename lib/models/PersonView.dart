import 'package:http/http.dart';

class PersonView {
  final String _name;
  final String _gender;
  final String _culture;
  final String _born;
  final String _died;
  final String _father;
  final String _mother;
  final String _spouse;

  PersonView(this._name, this._gender, this._culture, this._born, this._died,
      this._father, this._mother, this._spouse);

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

  bool hasDetail() {
    return (_father != "") && (_spouse != "");
  }

  bool alive() {
    return (_died == "");
  }
}
