import 'package:flutter/widgets.dart';

import '../models/user_models.dart';
import '../services/auth_services.dart';

enum AuthState { none, loading, hashdata, error }

class AuthProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel get user {
    if (_user != null) {
      return _user!;
    }

    return UserModel.fromJson({});
  }

  String? _message;
  String get message => _message!;

  AuthState? _state = AuthState.none;
  AuthState get state => _state!;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
    String name,
    String username,
    String email,
    String password,
  ) async {
    try {
      _state = AuthState.loading;
      notifyListeners();

      UserModel? user = await AuthService().register(
        name,
        username,
        email,
        password,
      );

      _state = AuthState.hashdata;
      notifyListeners();

      _user = user;

      return true;
    } catch (e) {
      _state = AuthState.error;
      notifyListeners();
      _message = "Register gagal";

      return false;
    }
  }

  Future<bool> login(
    String email,
    String password,
  ) async {
    try {
      _state = AuthState.loading;
      notifyListeners();

      final user = await AuthService().login(
        email,
        password,
      );

      _state = AuthState.hashdata;
      notifyListeners();

      _user = user;
      print("Dari auth provider: -> ${_user!.toJson()}");

      return true;
    } catch (e) {
      _state = AuthState.error;
      notifyListeners();

      _message = e.toString();

      return false;
    }
  }

  Future<dynamic> currentUser(
    String token,
  ) async {
    try {
      final user = await AuthService().currentUser(token);

      _state = AuthState.hashdata;
      notifyListeners();

      _user = user;

      return true;
    } catch (e) {
      _state = AuthState.error;
      notifyListeners();

      _message = e.toString();
      return false;
    }
  }

  Future<bool> editProfile(
    String token,
    String name,
    String username,
    String email,
  ) async {
    try {
      final user = await AuthService().updateUser(
        token,
        name,
        username,
        email,
      );

      _user = user;
      notifyListeners();

      return true;
    } catch (e) {
      _state = AuthState.error;
      notifyListeners();

      _message = e.toString();

      return false;
    }
  }

  Future<bool> logout(String token) async {
    try {
      _state = AuthState.loading;
      notifyListeners();

      final logout = await AuthService().logout(token);

      _state = AuthState.hashdata;
      notifyListeners();

      return logout;
    } catch (e) {
      _state = AuthState.error;
      notifyListeners();

      _message = "Logout gagal";

      return false;
    }
  }
}
