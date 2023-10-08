import 'package:alta_mvvm/models/api/contact_api.dart';
import 'package:alta_mvvm/models/contact_model.dart';
import 'package:flutter/material.dart';

class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];

  // Getter
  List<Contact> get contacts => _contacts;

  // Setter
  getContacts() async {
    final c = await ContactAPI.getContacts();
    _contacts = c;
    notifyListeners();
  }
}
