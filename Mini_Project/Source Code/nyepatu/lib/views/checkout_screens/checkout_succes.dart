import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/primary_button.dart';
import '../../components/secondary_button.dart';
import '../../themes/theme.dart';
import '../../themes/transitions.dart';
import '../mainpage_screens/main_page.dart';

class CheckOutSuccess extends StatelessWidget {
  static const routeName = "/checkout-success";
  const CheckOutSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(
                height: 40.0,
                width: 40.0,
              ),
              Text(
                'Checkout Success',
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
                'assets/icons/ic_cart_succes.svg',
                color: purpleOneColor,
                height: 70,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Your order has been placed',
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
                'Stay at home while we\nprepare your dream shoes',
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
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: displayWidth(context) * 0.19,
                ),
                child: SecondaryButton(
                  press: () {},
                  text: 'View My Order',
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

    return Scaffold(
      appBar: header(),
      backgroundColor: whiteOneColor,
      body: isEmpty(),
    );
  }
}
