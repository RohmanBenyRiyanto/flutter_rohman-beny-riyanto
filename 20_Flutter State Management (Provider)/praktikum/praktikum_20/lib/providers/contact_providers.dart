import 'package:flutter/widgets.dart';

import '../models/users.dart';

class Contact with ChangeNotifier {
  final List<User> _users = UserList;
  List<User> get users => _users;

  List<User> _usersOnSearch = [];
  List<User> get usersOnSearch => _usersOnSearch;

  String _searchString = "";

  void addContact(User users) {
    _users.insert(0, users);
    notifyListeners();
  }
}
