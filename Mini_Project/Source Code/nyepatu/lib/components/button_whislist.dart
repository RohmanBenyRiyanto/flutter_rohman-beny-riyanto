import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nyepatu/provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../themes/theme.dart';

class ButtonWishlist extends StatelessWidget {
  final Function? press;
  final Color? colors;
  final double? height;
  final double? width;
  final ProductModel product;

  const ButtonWishlist(
      {Key? key,
      this.press,
      this.colors,
      this.height,
      this.width,
      required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WishlistProvider>(
      builder: (context, state, _) {
        final isFavorited = state.isFavorited(product);
        return GestureDetector(
          onTap: () {
            state.setFavorite(product);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: isFavorited ? redColor : greenColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                content: Text(
                  isFavorited
                      ? "Has been removed from the Wishlist"
                      : "Has been added to the Wishlist",
                  style: whiteTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
          child: Container(
            height: height ?? 28,
            width: width ?? 28,
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: isFavorited ? purpleOneColor : blackOneColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/ic_love.svg',
                color: whiteOneColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
