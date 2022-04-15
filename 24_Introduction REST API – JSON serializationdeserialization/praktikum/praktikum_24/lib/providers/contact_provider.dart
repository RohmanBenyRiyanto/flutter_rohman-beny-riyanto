import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/contact_model.dart';
import '../services/contact_service.dart';

class ContactProvider extends ChangeNotifier {
  List<ContactModel> _contacts = [];

  List<ContactModel> get contacts => _contacts;

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

  Future<ContactModel?> getContactById(int id) async {
    ContactModel? contactData = await ContactService().getContactById(id);
    notifyListeners();
    return contactData;
  }

  Future<bool> createContact(ContactModel contactAdd) async {
    try {
      await ContactService().createContact(contactAdd);

      print(
        'Contact created : \nId :   ${contactAdd.id}\nName : ${contactAdd.name}\nPhone : ${contactAdd.phone}',
      );
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


  }
