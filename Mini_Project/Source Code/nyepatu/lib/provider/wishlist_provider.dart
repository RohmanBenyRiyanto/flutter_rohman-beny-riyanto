import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:nyepatu/provider/product_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  // void saveDataFav(List<ProductModel> list) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   // String json = jsonEncode(list.toString());
  //   final String encodeData = ProductModel.encode(
  //     _favoritesProduct,
  //   );

  //   // String json = jsonEncode(testUser);
  //   print('Generate JSON $encodeData');
  //   prefs.setString('favorite', encodeData);
  //   notifyListeners();
  // }

  // void loadData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try {
  //     final String? productString = await prefs.getString('favorite');
  //     final List<ProductModel> usersSp =
  //         ProductModel.decode(productString!).toList();
  //     String? json = prefs.getString('MyUser_Key');
  //     print(json);
  //     _prefFavorite = usersSp;
  //   } catch (Excepetion) {
  //     print('Data Null');
  //   }

  //   notifyListeners();
  // }
}
