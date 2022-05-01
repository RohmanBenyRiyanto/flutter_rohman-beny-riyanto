import 'package:flutter/widgets.dart';
import 'package:nyepatu/models/product_model.dart';

class SearchProvider extends ChangeNotifier {
  final List<ProductModel> _productsOnSearch = [];
  bool shouldDisplay = false;

  bool get shouldDisplaySearch => shouldDisplay;

  String? _message;

  List<ProductModel> get productsOnSearch => _productsOnSearch;
  String get message => _message!;

  Future<void> searchContact(String search, List<ProductModel> product) async {
    _productsOnSearch.clear();
    notifyListeners();
    for (var i = 0; i < product.length; i++) {
      if (product[i].name!.toLowerCase().contains(
                search.toLowerCase(),
              ) ||
          product[i].category!.name.toLowerCase().contains(
                search.toLowerCase(),
              )) {
        _productsOnSearch.add(product[i]);
        notifyListeners();
      }
      notifyListeners();
    }

    notifyListeners();
  }

  void buttonSearch() {
    shouldDisplay = !shouldDisplay;
    notifyListeners();
  }
}
