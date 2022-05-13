import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../provider/cart_provider.dart';
import '../themes/theme.dart';

class CardCart extends StatelessWidget {
  const CardCart({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(16.0),
      height: 100.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBGColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 68.0,
                  width: 68.0,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: purpleOneColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Center(
                    child: Image.network(
                      cart.product.galery![0].url,
                      // fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cart.product.name!,
                        style: blackTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: semiBold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 1,
                      ),
                      Text(
                        '${cart.product.category!.name} Shoes'.toUpperCase(),
                        style: secondaryTextStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        '\$ ${cart.product.price!.toString()}',
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  cartProvider.addQuantity(cart.id);
                },
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  height: 18.0,
                  width: 18.0,
                  decoration: BoxDecoration(
                    color: purpleOneColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/icons/ic_add.svg'),
                  ),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                cart.quantity.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              GestureDetector(
                onTap: () {
                  cartProvider.reduceQuantity(cart.id);
                },
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  height: 18.0,
                  width: 18.0,
                  decoration: BoxDecoration(
                    color: grayOneColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/icons/ic_min.svg'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
