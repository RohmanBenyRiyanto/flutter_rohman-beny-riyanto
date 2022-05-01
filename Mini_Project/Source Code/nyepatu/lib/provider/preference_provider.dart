import 'package:flutter/material.dart';

import '../models/user_models.dart';
import '../preferences/user_preferences.dart';

class PreferencesProvider extends ChangeNotifier {
  Future<UserModel> getUser() async {
    UserModel? userData = await UserPreferences().getUser();
    notifyListeners();

    return userData;
  }

  setUser(dynamic user) async {
    await UserPreferences().setUser(user);
    notifyListeners();
  }

  deleteUser() async {
    await UserPreferences().deleteUser();
    notifyListeners();
  }
}
