import 'package:flutter/material.dart';

class User with ChangeNotifier {
  List<Map<String, String>> _users = [];

  List<Map<String, String>> get users => _users;

  void add(Map<String, String> user) {
    _users.add(user);
    notifyListeners();
  }
}
