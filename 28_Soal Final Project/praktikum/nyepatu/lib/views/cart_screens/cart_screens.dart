// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nyepatu/components/button_icon_circle.dart';
import 'package:provider/provider.dart';

import '../../components/card_cart.dart';
import '../../components/primary_button.dart';
import '../../components/primary_button_icons.dart';
import '../../provider/cart_provider.dart';
import '../../themes/theme.dart';
import '../../themes/transitions.dart';
import '../checkout_screens/checkout_screens.dart';
import '../mainpage_screens/main_page.dart';

class CartScreens extends StatelessWidget {
  static const routeName = "/cart";
  const CartScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    AppBar header() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteOneColor,
        titleSpacing: 0,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonIconCircle(
                press: () {
                  Navigator.pop(context);
                },
                icons: 'assets/icons/ic_back.svg',
              ),
              Text(
                'Your Cart',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 40.0,
                width: 40.0,
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: cartProvider.carts
            .map(
              (cart) => CardCart(cart: cart),
            )
            .toList(),
      );
    }

    Widget isEmpty() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/icons/ic_cart_empty.svg',
                color: purpleOneColor,
                height: 70,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Opss! Your Cart is Empty',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Let\'s find your favorite shoes',
                style: secondaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.19,
                ),
                child: PrimaryButton(
                  press: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        FadeInRoute(
                          routeName: MainPage.routeName,
                          page: const MainPage(),
                        ),
                        (route) => false);
                  },
                  text: 'Explore Shoes',
                ),
              ),
              SizedBox(
                height: defaultMargin,
              ),
            ],
          ),
        ),
      );
    }

    Widget bottomNavigationBar() {
      return BottomAppBar(
        color: whiteOneColor,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    '\$ ${cartProvider.totalPrice()}',
                    style: blackTextStyle.copyWith(
                      fontSize: 16.0,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Divider(
                color: grayThreeColor.withOpacity(0.5),
                thickness: 1.5,
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: displayWidth(context),
                child: PrimaryButtonIcon(
                  press: () {
                    Navigator.push(
                      context,
                      FadeInRoute(
                        page: const CheckOut(),
                      ),
                    );
                  },
                  text: 'Continue To Checkout',
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      backgroundColor: whiteOneColor,
      body: content(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
