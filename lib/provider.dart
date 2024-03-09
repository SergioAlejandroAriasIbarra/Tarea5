import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class LogicalProvider with ChangeNotifier {
  List<Map<String, String>> _datos = [
    {
      "name": "Reyno",
      "location": "muy lejano",
      "notes": "Ninguno",
      "checkbox": "Currently in season"
    },
  ];
  String _name = "";
  String _location = "";
  String _notes = "";
  String _checkbox = "false";
  bool _value = false;

  String get name => _name;
  String get location => _location;
  String get notes => _notes;
  String get checkbox => _checkbox;
  List get listDatos => _datos;
  bool get value => _value;

  void valueOfCheckB() {
    _value = !value;
    notifyListeners();
  }

  void addDatatoList(name, location, notes, check) {
    _datos.add({
      "name": name,
      "location": location,
      "notes": notes,
      "checkbox": _value == true ? "Currently in season" : "No"
    });
    notifyListeners();
  }

  void clearCheckB() {
    _value = false;
    notifyListeners();
  }
}
