import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nyepatu/provider/category_provider.dart';
import 'package:nyepatu/provider/product_provider.dart';

import '../../components/card_gridview.dart';
import '../../components/cards_populer.dart';
import '../../components/costum_tab.dart';
import '../../components/heading_2.dart';
import '../../provider/auth_provider.dart';
import '../../themes/theme.dart';

class DashBoard extends StatefulWidget {
  static const routeName = "/dashboard";
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<ProductProvider>(context, listen: false)
            .buildListProductByTags();
      },
    );

    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<ProductProvider>(context, listen: false)
            .buildListProduct();
      },
    );

    _tabController = TabController(
        length: Provider.of<CategoryProvider>(context, listen: false)
            .categories
            .length,
        vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget heading() {
      return Consumer<AuthProvider>(
        builder: (context, state, _) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello, ${state.user.username!}',
                  style: blackTextStyle.copyWith(
                    fontSize: 24.0,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Find your favorite shoes',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget category() {
      final categories = Provider.of<CategoryProvider>(context);
      return Padding(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: defaultMargin,
          bottom: defaultMargin,
        ),
        child: TabBar(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.label,
          labelPadding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          isScrollable: true,
          labelColor: whiteOneColor,
          unselectedLabelColor: blackThreeColor,
          indicator: BoxDecoration(
            color: purpleOneColor,
            borderRadius: BorderRadius.circular(12),
          ),
          indicatorWeight: 0,
          onTap: (index) {
            setState(
              () {
                currentIndex = index;
              },
            );
            if (currentIndex != 0) {
              Provider.of<ProductProvider>(context, listen: false)
                  .buildListProductByCategory(index + 1);
            } else {
              Provider.of<ProductProvider>(context, listen: false)
                  .buildListProductByTags();
            }
          },
          tabs: categories.categories.map(
            (label) {
              return CostumTab(
                labels: label.name,
              );
            },
          ).toList(),
        ),
      );
    }

    SliverAppBar header() {
      return SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteOneColor,
        titleSpacing: 0,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(116.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              heading(),
              category(),
            ],
          ),
        ),
      );
    }

    Widget popularShoes() {
      return SizedBox(
        height: 283.00,
        width: displayWidth(context),
        child: Consumer<ProductProvider>(
          builder: (context, state, _) {
            if (state.state == ProductState.Loading) {
              return SizedBox(
                height: 120,
                child: Center(
                  child: CircularProgressIndicator.adaptive(
                    valueColor: AlwaysStoppedAnimation(purpleOneColor),
                  ),
                ),
              );
            } else if (state.state == ProductState.HasData) {
              return Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return CardsPopuler(
                    product: state.productsByTagsPopular[index],
                  );
                },
                itemCount: state.productsByTagsPopular.length,
                viewportFraction: 0.8,
                scale: 0.9,
              );
            } else {
              return SizedBox(
                height: 120,
                child: Center(
                  child: Text(
                    'Data tidak ditemukan',
                    style: blackTextStyle.copyWith(
                      fontSize: 16.0,
                      fontWeight: regular,
                    ),
                  ),
                ),
              );
            }
          },
        ),
      );
    }

    Widget newShoes() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin - 4),
        child: Consumer<ProductProvider>(
          builder: (context, state, _) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 260.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: state.productsByTagsNew.length,
              itemBuilder: (BuildContext context, int index) {
                if (state.state == ProductState.Loading) {
                  return SizedBox(
                    height: 120,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation(purpleOneColor),
                      ),
                    ),
                  );
                } else if (state.state == ProductState.HasData) {
                  return CardGridView(
                    product: state.productsByTagsNew[index],
                  );
                } else {
                  return SizedBox(
                    height: 120,
                    child: Center(
                      child: Text(
                        'Data tidak di temukan',
                        style: blackTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
      );
    }

    Widget allShoes() {
      return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 5.0),
          Heading2(text: 'Popular Shoes'),
          const SizedBox(height: 12.0),
          popularShoes(),
          const SizedBox(height: 16.0),
          Heading2(text: 'New Products'),
          const SizedBox(height: 12.0),
          newShoes(),
          SizedBox(height: defaultMargin)
        ],
      );
    }

    Widget categoryContent() {
      return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Heading2(text: 'For You'),
          const SizedBox(height: 12.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin - 4),
            child: Consumer<ProductProvider>(
              builder: (context, state, _) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 260.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: state.productByCategory.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (state.state == ProductState.Loading) {
                      return SizedBox(
                        height: 120,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation(purpleOneColor),
                          ),
                        ),
                      );
                    } else if (state.state == ProductState.HasData) {
                      return CardGridView(
                        product: state.productByCategory[index],
                      );
                    } else {
                      return SizedBox(
                        height: 120,
                        child: Center(
                          child: Text(
                            'Data tidak di temukan',
                            style: blackTextStyle.copyWith(
                              fontSize: 16.0,
                              fontWeight: regular,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      );
    }

    Widget content() {
      return TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: List.generate(
          Provider.of<CategoryProvider>(context).categories.length,
          (index) => index == 0 ? allShoes() : categoryContent(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteOneColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            header(),
          ];
        },
        body: content(),
      ),
    );
  }
}
