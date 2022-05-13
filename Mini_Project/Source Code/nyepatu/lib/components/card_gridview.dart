import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nyepatu/animation/fade_animation.dart';

import 'package:nyepatu/models/product_model.dart';
import 'package:provider/provider.dart';

import '../provider/cart_provider.dart';
import '../themes/theme.dart';
import '../themes/transitions.dart';
import '../views/cart_screens/cart_screens.dart';
import '../views/detail_screens/detail_screens.dart';
import 'button_add.dart';
import 'button_whislist.dart';
import 'costum_alertdialog.dart';

class CardGridView extends StatelessWidget {
  const CardGridView({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
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
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.all(12.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: whiteOneColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.23),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: purpleFourColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeAnimation(
                    child: ButtonWishlist(
                      product: product,
                      colors: blackOneColor,
                      press: () {},
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  FadeAnimation(
                    child: Center(
                      child: product.galery![0].url.isEmpty
                          ? SizedBox(
                              height: 120,
                              child: Center(
                                child: CircularProgressIndicator.adaptive(
                                  valueColor:
                                      AlwaysStoppedAnimation(purpleOneColor),
                                ),
                              ),
                            )
                          : Transform.rotate(
                              angle: -45 * math.pi / 180,
                              child: Image.network(
                                product.galery![0].url,
                                height: 73,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          child: Text(
                            '${product.category!.name} Shoes'.toUpperCase(),
                            style: secondaryTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: regular,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        FadeAnimation(
                          child: Text(
                            product.name!,
                            style: blackTextStyle.copyWith(
                              fontSize: 16.0,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        FadeAnimation(
                          child: Text(
                            '\$ ${product.price!.toString()}',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16.0,
                              fontWeight: medium,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  FadeAnimation(
                    child: ButtonAdd(
                      press: () {
                        FadeAnimation(
                          child: ButtonAdd(
                            press: () {
                              cart.addCart(product);
                              showSuccessDialog(context);
                            },
                            height: 45,
                            width: 45,
                          ),
                        );
                      },
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showSuccessDialog(ctx) async {
    return showDialog(
      context: ctx,
      builder: (BuildContext context) => SizedBox(
        width: displayWidth(context) - defaultMargin,
        child: CostumAlertDialog(
          press: () {
            Navigator.push(
              context,
              FadeInRoute(
                page: const CartScreens(),
              ),
            );
          },
          icons: 'assets/icons/ic_succes.svg',
          tittle: 'Success',
          subtitle: 'Product added to cart',
          buttontext: 'View Cart',
        ),
      ),
    );
  }
}
