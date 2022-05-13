import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/product_model.dart';
import '../themes/theme.dart';
import '../themes/transitions.dart';
import '../views/detail_screens/detail_screens.dart';

class CardSearch extends StatelessWidget {
  const CardSearch({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

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
                        product.galery![0].url,
                        fit: BoxFit.scaleDown,
                      
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
                          product.name!,
                          style: blackTextStyle.copyWith(
                            fontSize: 16.0,
                            fontWeight: semiBold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),
                        Text(
                          '${product.category!.name} Shoes'.toUpperCase(),
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12.0,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          '\$ ${product.price!.toString()}',
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
            SizedBox(
              width: 20.0,
              child: SvgPicture.asset('assets/icons/ic_arrow_left.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
