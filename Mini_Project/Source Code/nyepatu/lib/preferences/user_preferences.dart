import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_models.dart';

class UserPreferences {
  final saveUser = "user";

  Future<UserModel> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    Map<String, dynamic>? userMap;
    final userData = prefs.getString(saveUser);
    print("User Prefernces: getUser ->$userData");

    if (userData != null) {
      userMap = jsonDecode(userData) as Map<String, dynamic>;
    }

    if (userMap != null) {
      final user = UserModel.fromJson(userMap);
      return user;
    }
    return UserModel.fromJson({});
  }

  setUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final setUser = jsonEncode(user);
    print("User Prefernces: setUser ->$setUser");
    await prefs.setString(saveUser, setUser);
  }

  deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}