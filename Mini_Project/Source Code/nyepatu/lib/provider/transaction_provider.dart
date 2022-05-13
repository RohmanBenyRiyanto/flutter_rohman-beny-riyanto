// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:nyepatu/models/cart_model.dart';
import 'package:nyepatu/services/transaction_services.dart';

import '../themes/transitions.dart';
import '../views/checkout_screens/checkout_succes.dart';

enum TransactionStatus {
  idle,
  loading,
  success,
  failed,
}

class TransactionProvider with ChangeNotifier {
  bool _isLoading = false;

  TransactionStatus _state = TransactionStatus.idle;

  TransactionStatus get state => _state;

  bool get isLoading => _isLoading;

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> handleCheckout(
    String token,
    List<CartModel> list,
    double total,
    context,
  ) async {
    try {
      _state = TransactionStatus.loading;
      notifyListeners();

      _isLoading = true;

      if (await checkout(
        token,
        list,
        total,
      )) {
        list = [];
        _isLoading = false;

        Navigator.pushAndRemoveUntil(
            context,
            FadeInRoute(
              page: const CheckOutSuccess(),
            ),
            (route) => false);
        notifyListeners();

        _state = TransactionStatus.success;
        notifyListeners();
      } else {
        _isLoading = false;
        _state = TransactionStatus.failed;
        notifyListeners();
      }
    } catch (e) {
      print(e);
      _state = TransactionStatus.failed;
      notifyListeners();
    }
    notifyListeners();
  }
}
