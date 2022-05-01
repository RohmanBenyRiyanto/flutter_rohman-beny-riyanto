import 'package:flutter/widgets.dart';
import 'package:nyepatu/models/category_model.dart';

import '../services/category_services.dart';

class CategoryProvider extends ChangeNotifier {
  List<CategoryModel> _categories = [];

  List<CategoryModel> get categories => _categories;

  set categories(List<CategoryModel>? categories) {
    _categories = categories!;
    notifyListeners();
  }

  Future<List<CategoryModel>> getCategories() async {
    final categories = await CategoryServices().getCategory();
    notifyListeners();

    return _categories = categories;
  }
}
