// ignore_for_file: constant_identifier_names, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

enum FavoriteState { None, Loading, HasData, NoData, Error }

class WishlistProvider extends ChangeNotifier {
  List<ProductModel> _favoritesProduct = [];

  List<ProductModel> _prefFavorite = [];
  FavoriteState _state = FavoriteState.None;
  String? _message;

  WishlistProvider() {
    _getAllFavorite();
  }

  List<ProductModel> get prefFavorite => _prefFavorite;
  List<ProductModel> get favoritesProduct => _favoritesProduct;
  FavoriteState get state => _state;
  String get message => _message!;

  set favoritesProduct(List<ProductModel> favoritesProduct) {
    _favoritesProduct = favoritesProduct;
    notifyListeners();
  }

  dynamic _getAllFavorite() {
    try {
      _state = FavoriteState.Loading;
      notifyListeners();

      if (_favoritesProduct.isEmpty) {
        _state = FavoriteState.NoData;
        notifyListeners();

        return _message == "Anda belum menambahkan Product Favorite";
      } else {
        _state = FavoriteState.HasData;
        notifyListeners();

        return favoritesProduct = _favoritesProduct;
      }
    } catch (e) {
      _state = FavoriteState.Error;
      notifyListeners();

      return _message = e.toString();
    }
  }

  bool isFavorited(ProductModel product) {
    if (_favoritesProduct.indexWhere((element) => element.id == product.id) ==
        -1) {
      return false;
    }
    return true;
  }

  void setFavorite(ProductModel product) {
    if (!isFavorited(product)) {
      _favoritesProduct.add(product);
    } else {
      _favoritesProduct.removeWhere((element) => element.id == product.id);
    }
    _getAllFavorite();
  }
}
