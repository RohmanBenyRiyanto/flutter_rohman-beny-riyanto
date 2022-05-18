import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductService {
  String basedUrl = "https://srv1.shamoserver.my.id/api";

  Future<List<ProductModel>> getProduct() async {
    try {
      Uri apiUrl = Uri.parse(basedUrl + "/products?limit=20");

      final response = await http.get(apiUrl);

      List jsonObject = jsonDecode(response.body)["data"]["data"];

      List<ProductModel> product = [];

      for (var item in jsonObject) {
        product.add(ProductModel.fromJson(item));
      }

      return product;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> getProductByCategory(int categoryId) async {
    try {
      Uri apiUrl =
          Uri.parse(basedUrl + "/products?limit=20&categories=$categoryId");

      final response = await http.get(apiUrl);
      List jsonObject = jsonDecode(response.body)["data"]["data"];

      List<ProductModel> product = [];

      for (var item in jsonObject) {
        product.add(ProductModel.fromJson(item));
      }

      return product;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<ProductModel>> getProductByTags(String productTags) async {
    try {
      Uri apiUrl = Uri.parse(basedUrl + "/products?limit=20&tags=$productTags");

      final response = await http.get(apiUrl);
      List jsonObject = jsonDecode(response.body)["data"]["data"];

      List<ProductModel> product = [];

      for (var item in jsonObject) {
        product.add(ProductModel.fromJson(item));
      }

      return product;
    } catch (e) {
      throw Exception(e);
    }
  }
}
