import 'package:flutter/material.dart';
import 'package:nyepatu/models/product_model.dart';

import '../themes/theme.dart';
import '../themes/transitions.dart';
import '../views/detail_screens/detail_screens.dart';

class FamiliarShoes extends StatelessWidget {
  const FamiliarShoes({
    Key? key,
    required this.product,
    required this.margins,
  }) : super(key: key);

  final ProductModel product;
  final double margins;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          FadeInRoute(
            routeName: DetailScreen.routeName,
            page: DetailScreen(
              product: product,
              id: product.category!.id,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: margins),
        padding: const EdgeInsets.all(12.0),
        height: 54.0,
        width: 54.0,
        decoration: BoxDecoration(
          color: cardBGColor,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Image.network(
          product.galery![0].url,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
