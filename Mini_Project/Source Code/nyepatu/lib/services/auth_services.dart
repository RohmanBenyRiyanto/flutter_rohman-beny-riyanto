import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user_models.dart';
import 'package:dio/dio.dart';

class AuthService {
  String basedUrl = "https://srv1.shamoserver.my.id/api";

  Dio dio = Dio();

  Future<UserModel> register(
    String name,
    String username,
    String email,
    String password,
  ) async {
    Uri apiUrl = Uri.parse(basedUrl + "/register");

    try {
      final response = await http.post(
        apiUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": name,
          "username": username,
          "email": email,
          "password": password,
        }),
      );

      print(response.body);
      final jsonObject = jsonDecode(response.body)["data"];
      UserModel user = UserModel.fromJson(jsonObject["user"]);
      user.token = "Bearer " + jsonObject["access_token"];

      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserModel> login(
    String email,
    String password,
  ) async {
    Uri apiUrl = Uri.parse(basedUrl + "/login");

    try {
      final response = await http.post(
        apiUrl,
        headers: {"Content-Type": "applicaton/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print(response.body);
      final jsonObject = jsonDecode(response.body)["data"];
      UserModel user = UserModel.fromJson(jsonObject["user"]);
      user.token = "Bearer " + jsonObject["access_token"];
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserModel> currentUser(String token) async {
    Uri apiUrl = Uri.parse(basedUrl + "/user");

    try {
      final response = await http.get(
        apiUrl,
        headers: {
          "Content-Type": "applicaton/json",
          "Authorization": token,
        },
      );

      print(response.body);
      final jsonObject = jsonDecode(response.body)["data"];
      UserModel user = UserModel.fromJson(jsonObject);
      user.token = token;

      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<UserModel> updateUser(
    String token,
    String name,
    String username,
    String email,
  ) async {
    Uri apiUrl = Uri.parse(basedUrl + "/user");
    try {
      final response = await http.post(
        apiUrl,
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
        body: jsonEncode({
          "name": name,
          "username": username,
          "email": email,
        }),
      );

      print(response.body);
      final jsonObject = jsonDecode(response.body)["data"];
      final user = UserModel.fromJson(jsonObject);
      user.token = token;

      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> logout(String token) async {
    Uri apiUrl = Uri.parse(basedUrl + "/logout");
    try {
      final response = await http.post(
        apiUrl,
        headers: {
          "Content-Type": "application/json",
          "Authorization": token,
        },
      );

      final jsonObject = jsonDecode(response.body)["data"];
      print(response.body);

      return jsonObject;
    } catch (e) {
      throw Exception(e);
    }
  }
}
