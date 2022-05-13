import 'package:flutter/material.dart';
import 'package:nyepatu/components/heading_2.dart';
import 'package:provider/provider.dart';

import '../../components/button_icon_circle.dart';
import '../../components/card_item_checkout.dart';
import '../../components/loading_button.dart';
import '../../components/primary_button.dart';
import '../../provider/auth_provider.dart';
import '../../provider/cart_provider.dart';
import '../../provider/transaction_provider.dart';
import '../../themes/theme.dart';

class CheckOut extends StatefulWidget {
  static const routeName = '/checkout';
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

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
                'Checkout Details',
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
        children: [
          SizedBox(height: defaultMargin),
          Heading2(text: 'List Items'),
          const SizedBox(height: 14.0),

          Column(
            children: cartProvider.carts
                .map(
                  (cart) => CardItemCheckout(
                    cart: cart,
                  ),
                )
                .toList(),
          ),
          SizedBox(height: defaultMargin),

          // NOTE : Address Details
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.all(16.0),
            width: displayWidth(context),
            decoration: BoxDecoration(
              color: cardBGColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: blackOneColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.store,
                          color: purpleOneColor,
                          size: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Store Location',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: regular,
                            ),
                          ),
                          const SizedBox(height: 1.0),
                          Text(
                            'Jl. Raya Kebon Jeruk No.1',
                            style: blackTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultMargin),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        color: blackOneColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.location_on_rounded,
                          color: purpleOneColor,
                          size: 20.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Address',
                            style: secondaryTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: regular,
                            ),
                          ),
                          const SizedBox(height: 1.0),
                          Text(
                            'Pekalongan',
                            style: blackTextStyle.copyWith(
                              fontSize: 14.0,
                              fontWeight: semiBold,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: defaultMargin),

          // NOTE : Payment Method

          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: const EdgeInsets.all(16.0),
            width: displayWidth(context),
            decoration: BoxDecoration(
              color: cardBGColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: regular,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItems()} Items',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: regular,
                      ),
                    ),
                    Text(
                      '\$ ${cartProvider.totalPrice()}',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Fee 11& & Delivery',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: regular,
                      ),
                    ),
                    Text(
                      '\$ 10',
                      style: blackTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14.0),
                Divider(
                  color: grayTwoColor,
                  height: 1,
                ),
                const SizedBox(height: 14.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: primaryTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: semiBold,
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
              ],
            ),
          ),
          SizedBox(height: defaultMargin),
        ],
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
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fee 11% & Delivery',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: regular,
                    ),
                  ),
                  Text(
                    '\$ 10',
                    style: blackTextStyle.copyWith(
                      fontSize: 16.0,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
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
                child:
                    Consumer<TransactionProvider>(builder: (context, state, _) {
                  if (state.state == TransactionStatus.loading) {
                    return const LoadingButton();
                  } else if (state.state == TransactionStatus.success) {
                    return PrimaryButton(
                      press: () {
                        transactionProvider.handleCheckout(
                          authProvider.user.token!,
                          cartProvider.carts,
                          cartProvider.totalPrice(),
                          context,
                        );
                      },
                      text: 'Checkout Now',
                    );
                  } else {
                    PrimaryButton(
                      press: () {
                        state.isLoading == false;
                      },
                      text: 'Checkout Now',
                    );
                  }
                  return PrimaryButton(
                    press: () {
                      transactionProvider.handleCheckout(
                        authProvider.user.token!,
                        cartProvider.carts,
                        cartProvider.totalPrice(),
                        context,
                      );
                    },
                    text: 'Checkout Now',
                  );
                }),
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
