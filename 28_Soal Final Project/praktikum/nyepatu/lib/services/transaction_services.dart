import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/cart_model.dart';

class TransactionService {
  String baseUrl = 'https://srv1.shamoserver.my.id/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = Uri.parse('$baseUrl/checkout');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode(
      {
        'address': 'Karanganyar',
        'items': carts
            .map((cart) => {
                  'id': cart.product.id,
                  'quantity': cart.quantity,
                })
            .toList(),
        'status': 'PENDING',
        'total_price': totalPrice,
        'shipping_price': 10,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // ignore: avoid_print
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }
}
