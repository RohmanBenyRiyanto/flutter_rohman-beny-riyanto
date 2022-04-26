import 'package:flutter/widgets.dart';

import '../../models/food_model.dart';
import '../../models/food_services/food_services.dart';

enum FoodViewState { idle, loading, error }

class FoodViewModel with ChangeNotifier {
  FoodViewState _state = FoodViewState.idle;

  FoodViewState get state => _state;

  List<FoodModel> _foods = [];

  List<FoodModel> get foods => _foods;

  changeState(FoodViewState s) {
    _state = s;
    notifyListeners();
  }

  fetchFoods() async {
    changeState(FoodViewState.loading);
    notifyListeners();
    try {
      List<FoodModel> products = await FoodServices().getFoods();
      _foods = products;
      notifyListeners();

      changeState(FoodViewState.idle);
    } catch (e) {
      changeState(FoodViewState.error);
    }
    notifyListeners();
  }
}
