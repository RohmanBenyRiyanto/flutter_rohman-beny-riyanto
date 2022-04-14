import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/users.dart';

class Contact with ChangeNotifier {
  // List<User> _users = userList;

  List<User> userSave = userList;

  List<User> _userLoad = [];
  List<User> get userLoad => _userLoad;

  void addContact(User users) {
    userSave.insert(0, users);
    saveData();
    loadData();
    notifyListeners();
  }

  void deleteContact(int index) {
    _userLoad.removeAt(index);
    clearData();
    // saveData();
    // loadData();
    notifyListeners();
  }

  void updateContact(int index, User users) {
    _userLoad[index] = users;
    notifyListeners();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      final String? contactString = await prefs.getString('MyUser_Key');
      final List<User> usersSp = User.decode(contactString!).toList();
      String? json = prefs.getString('MyUser_Key');
      print(json);
      _userLoad = usersSp;
    } catch (Excepetion) {
      print('Data Null');
    }

    notifyListeners();
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String json = jsonEncode(userSave.toString());
    final String encodeData = User.encode(
      userSave,
    );

    // String json = jsonEncode(testUser);
    print('Generate JSON $encodeData');
    prefs.setString('MyUser_Key', encodeData);
    notifyListeners();
  }

  void clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print('Data Clear');
    notifyListeners();
  }
}
