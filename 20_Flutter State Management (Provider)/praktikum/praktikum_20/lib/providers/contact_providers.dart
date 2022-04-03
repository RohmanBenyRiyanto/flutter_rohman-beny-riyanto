import 'dart:async';

import 'package:flutter/widgets.dart';

import '../models/users.dart';

class Contact with ChangeNotifier {
  final List<User> _users = UserList;
  List<User> get users => _users;

  List<User> _usersOnSearch = [];
  List<User> get usersOnSearch => _usersOnSearch;

  void addContact(User users) {
    _users.insert(0, users);
    notifyListeners();
  }

  void searchMethod(String value) {
    _usersOnSearch = UserList.where(
      (_usersOnSearch) =>
          _usersOnSearch.name.toLowerCase().contains(value.toLowerCase()),
    ).toList();
    _usersOnSearch = UserList.where(
      (_usersOnSearch) => _usersOnSearch.phone
          .toLowerCase()
          .contains(value.toLowerCase().toString()),
    ).toList();
    notifyListeners();
  }

  void onRefresh(context) async {
    await Future.delayed(Duration(milliseconds: 500));
    notifyListeners();
  }
}
