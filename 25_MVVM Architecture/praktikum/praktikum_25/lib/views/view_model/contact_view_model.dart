import 'package:flutter/widgets.dart';

import '../../models/api/contact_api.dart';
import '../../models/contact_model.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> _contacts = [];

  List<ContactModel> get contacts => _contacts;

  final List<ContactModel> _usersOnSearch = [];

  List<ContactModel> get usersOnSearch => _usersOnSearch;

  set contact(List<ContactModel> contacts) {
    _contacts = contacts;
    notifyListeners();
  }

  Future<List<ContactModel>> getContacts() async {
    List<ContactModel> contactsData = await ContactService().getContacts();
    contact = contactsData;
    notifyListeners();
    return contacts;
  }

  Future<bool> createContact(ContactModel contactAdd) async {
    try {
      await ContactService().createContact(contactAdd);
      _contacts.add(contactAdd);
      notifyListeners();
      return true;
    } catch (e) {
      print('Create Contact Error: $e');
      return false;
    }
  }

  Future<bool> deleteContact(int index) async {
    try {
      contacts.removeAt(index);
      notifyListeners();
      return true;
    } catch (e) {
      print('Delete Contact Error: $e');
      return false;
    }
  }

  Future<void> searchContact(String search, List<ContactModel> contacts) async {
    _usersOnSearch.clear();
    for (var i = 0; i < contacts.length; i++) {
      if (contacts[i].name!.toLowerCase().contains(
            search.toLowerCase(),
          )) {
        _usersOnSearch.add(contacts[i]);
      }
    }
    notifyListeners();
  }
}
