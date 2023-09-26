import 'package:flutter/material.dart';

class Contact with ChangeNotifier {
  List<Map<String, String>> _contacts = [];

  List<Map<String, String>> get contacts => _contacts;

  void add(Map<String, String> contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void remove(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }
}
