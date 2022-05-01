import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nyepatu/components/primary_button.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import 'package:nyepatu/components/button_whislist.dart';
import 'package:nyepatu/components/heading_2.dart';
import 'package:nyepatu/models/product_model.dart';

import '../../components/button_icon_circle.dart';
import '../../components/card_familiar_shoses.dart';
import '../../provider/product_provider.dart';
import '../../themes/theme.dart';

class DetailScreen extends StatefulWidget {
  static const String routeName = '/detail-screens';
  const DetailScreen({
    Key? key,
    required this.product,
    required this.id,
  }) : super(key: key);

  final ProductModel product;
  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentIndex = 0;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<ProductProvider>(context, listen: false)
            .buildListProductByCategory(widget.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cardBGColor,
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
                'Detail Shoes',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              ButtonIconCircle(
                press: () {
                  Navigator.pop(context);
                },
                icons: 'assets/icons/ic_cart.svg',
              ),
            ],
          ),
        ),
      );
    }

    Widget dots(int index) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0),
        width: currentIndex == index ? 16.0 : 4,
        height: 4.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: currentIndex == index ? purpleOneColor : grayOneColor,
        ),
      );
    }

    Widget content() {
      int index = -1;
      return ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              Container(
                height: 280,
                width: displayWidth(context),
                color: cardBGColor,
                child: Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250,
                        // autoPlay: true,
                        // autoPlayInterval: const Duration(seconds: 3),
                        // autoPlayAnimationDuration:
                        //     const Duration(milliseconds: 800),
                        // autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(
                            () {
                              currentIndex = index;
                            },
                          );
                        },
                      ),
                      items: widget.product.galery?.map(
                        (image) {
                          return image.url.isEmpty
                              ? SizedBox(
                                  height: 120,
                                  child: Center(
                                    child: CircularProgressIndicator.adaptive(
                                      valueColor: AlwaysStoppedAnimation(
                                          purpleOneColor),
                                    ),
                                  ),
                                )
                              : Container(
                                  width: displayWidth(context),
                                  height: 140.0,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Image.network(
                                    image.url,
                                    fit: BoxFit.contain,
                                  ),
                                );
                        },
                      ).toList(),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.product.galery!.map(
                        (e) {
                          index++;
                          return dots(index);
                        },
                      ).toList(),
                    ),
                  ],
                ),
              ),
              Container(
                width: displayHeight(context),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                decoration: BoxDecoration(
                  color: whiteOneColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),

                // Note : Name, Brand Name Wishlist
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: defaultMargin,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.product.name}',
                              style: blackTextStyle.copyWith(
                                fontSize: 20.0,
                                fontWeight: semiBold,
                              ),
                            ),
                            Text(
                              widget.product.category!.name,
                              style: secondaryTextStyle.copyWith(
                                fontSize: 18.0,
                                fontWeight: regular,
                              ),
                            ),
                          ],
                        ),
                        ButtonWishlist(
                          product: widget.product,
                          height: 46.0,
                          width: 46.0,
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

                    // Note : Description
                    Heading2(
                      text: 'Description',
                      padding: false,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    ReadMoreText(
                      '${widget.product.description}',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: regular,
                      ),
                      trimLines: 3,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: primaryTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: defaultMargin,
                    ),

                    // Note Familiar Shoes
                    Heading2(
                      text: 'Familiar Shoes',
                      padding: false,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      height: 54,
                      margin: EdgeInsets.only(
                        top: 12,
                        bottom: defaultMargin,
                      ),
                      child: Consumer<ProductProvider>(
                        builder: (context, state, _) {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              final fimilar = state.products[index];
                              if (fimilar.category!.name
                                  .contains(widget.product.category!.name)) {
                                return GestureDetector(
                                  onTap: () {},
                                  child: FamiliarShoes(
                                    margins: index == 7 ? 0 : 16,
                                    product: fimilar,
                                  ),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget bottomNavigationBar() {
      return BottomAppBar(
        color: whiteOneColor,
        elevation: 0,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${widget.product.price}',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                width: displayWidth(context) * 0.5,
                child: PrimaryButton(
                  press: () {},
                  text: 'Add to Cart',
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
      bottomNavigationBar: bottomNavigationBar(),
      body: content(),
    );
  }
}
