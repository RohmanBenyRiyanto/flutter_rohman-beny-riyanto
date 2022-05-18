// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nyepatu/models/category_model.dart';

class CategoryServices {
  String basedUrl = "https://srv1.shamoserver.my.id/api";

  Future<List<CategoryModel>> getCategory() async {
    try {
      Uri apiUrl = Uri.parse(basedUrl + "/categories");

      final response = await http.get(apiUrl);

      List jsonObject = jsonDecode(response.body)["data"]["data"];

      List<CategoryModel> category = [];

      for (var item in jsonObject) {
        category.add(CategoryModel.fromJson(item));
      }
      print('From Category  Services : ${response.body}');

      return category;
    } catch (e) {
      throw Exception(3);
    }
  }
}
