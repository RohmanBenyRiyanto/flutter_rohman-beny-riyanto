import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/product_service.dart';

// ignore: constant_identifier_names
enum ProductState { None, Loading, HasData, NoData, Error }

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> _productsByTagsPopular = [];
  List<ProductModel> _productsByTagsNew = [];

  List<ProductModel> _productByCategory = [];

  ProductState _state = ProductState.None;
  String? _message;

  ProductProvider() {
    buildListProduct();
  }

  ProductState get state => _state;

  List<ProductModel> get products => _products;
  List<ProductModel> get productsByTagsPopular => _productsByTagsPopular;
  List<ProductModel> get productsByTagsNew => _productsByTagsNew;
  List<ProductModel> get productByCategory => _productByCategory;

  String get message => _message!;

  buildListProduct() {
    _getProducts();
  }

  buildListProductByTags() {
    _getProductByTagsPopular('popular');
    _getProductByTagsNew('new');
  }

  buildListProductByCategory(int id) {
    _getProductByCategory(id);
    notifyListeners();
  }

  Future<dynamic> _getProducts() async {
    try {
      _state = ProductState.Loading;
      notifyListeners();

      final response = await ProductService().getProduct();

      if (response.isEmpty) {
        _state = ProductState.NoData;
        notifyListeners();

        return _message = "No data found";
      } else {
        _state = ProductState.HasData;
        notifyListeners();

        return _products = response;
      }
    } catch (e) {
      _state = ProductState.Error;
      notifyListeners();

      return _message = e.toString();
    }
  }

  Future<dynamic> _getProductByTagsPopular(String tags) async {
    try {
      _state = ProductState.Loading;
      notifyListeners();

      final response = await ProductService().getProductByTags(tags);

      if (response.isEmpty) {
        _state = ProductState.NoData;
        notifyListeners();
        return _message = "No data found";
      } else {
        _state = ProductState.HasData;
        notifyListeners();
        return _productsByTagsPopular = response;
      }
    } catch (e) {
      _state = ProductState.Error;
      notifyListeners();
      return _message = e.toString();
    }
  }

  Future<dynamic> _getProductByTagsNew(String tags) async {
    try {
      _state = ProductState.Loading;
      notifyListeners();

      final response = await ProductService().getProductByTags(tags);

      if (response.isEmpty) {
        _state = ProductState.NoData;
        notifyListeners();
        return _message = "No data found";
      } else {
        _state = ProductState.HasData;
        notifyListeners();
        return _productsByTagsNew = response;
      }
    } catch (e) {
      _state = ProductState.Error;
      notifyListeners();
      return _message = e.toString();
    }
  }

  Future<dynamic> _getProductByCategory(int id) async {
    try {
      _state = ProductState.Loading;
      notifyListeners();

      final responses = await ProductService().getProductByCategory(id);

      if (products.isEmpty) {
        _state = ProductState.NoData;
        notifyListeners();

        return _message = "Data tidak ditemukan!";
      } else {
        _state = ProductState.HasData;
        notifyListeners();

        return _productByCategory = responses;
      }
    } catch (e) {
      _state = ProductState.Error;
      notifyListeners();

      return _message = e.toString();
    }
  }
}
