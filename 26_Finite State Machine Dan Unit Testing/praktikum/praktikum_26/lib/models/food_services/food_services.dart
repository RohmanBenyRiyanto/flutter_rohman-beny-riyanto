import 'dart:convert';

import 'package:dio/dio.dart';

import '../food_model.dart';


class FoodServices {
  String baseUrl =
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/foods';

  Future<List<FoodModel>> getFoods() async {
    Response<List<dynamic>> response = await Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 3000,
        receiveTimeout: 3000,
      ),
    ).get(baseUrl);
    if (response.statusCode == 200) {
      List<FoodModel>? foodsList =
          response.data?.map((items) => FoodModel.fromJson(items)).toList();
      print('foods: ${response.data}');
      return foodsList ?? [];
    }
    return [];
  }
}