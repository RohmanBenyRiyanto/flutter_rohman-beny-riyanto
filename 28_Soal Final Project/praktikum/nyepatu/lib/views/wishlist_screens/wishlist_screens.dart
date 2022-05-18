import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nyepatu/components/card_whislist.dart';
import 'package:nyepatu/provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

import '../../animation/fade_animation.dart';
import '../../components/heading_2.dart';
import '../../components/primary_button.dart';
import '../../models/product_model.dart';
import '../../themes/theme.dart';
import '../../themes/transitions.dart';
import '../mainpage_screens/main_page.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  // @override
  // void initState() {
  //   Provider.of<WishlistProvider>(context, listen: false).loadData();
  //   super.initState();
  // }

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
                'Wishlist',
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
                'assets/icons/ic_love.svg',
                color: purpleOneColor,
                height: 70,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                ' You don\'t have dream shoes?',
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
              SizedBox(
                height: displayHeight(context) * 0.1,
              ),
            ],
          ),
        ),
      );
    }

    Widget content(List<ProductModel> product) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading2(text: 'Your Wishlist'),
          const SizedBox(
            height: 8.0,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: product.length,
            itemBuilder: (BuildContext context, int index) => FadeAnimation(
              child: CardWishlist(
                product: product[index],
              ),
            ),
          ),
          SizedBox(
            height: defaultMargin + 12,
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: whiteOneColor,
      appBar: header(),
      body: Consumer<WishlistProvider>(
        builder: (context, state, _) => state.state == FavoriteState.NoData
            ? isEmpty()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: content(
                  state.favoritesProduct,
                ),
              ),
      ),
    );
  }
}
