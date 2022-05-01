import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nyepatu/components/card_search.dart';
import 'package:nyepatu/components/primary_button.dart';
import 'package:nyepatu/provider/product_provider.dart';
import 'package:nyepatu/provider/search_provider.dart';
import 'package:provider/provider.dart';

import '../../animation/fade_animation.dart';
import '../../components/heading_2.dart';
import '../../themes/theme.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  var focusNode = FocusNode();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SearchProvider searchProvider = Provider.of<SearchProvider>(context);
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context);
    Widget search() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        margin: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                focusNode: focusNode,
                maxLines: 1,
                controller: _searchController,
                keyboardType: TextInputType.text,
                style: blackTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: medium,
                ),
                decoration: InputDecoration(
                  fillColor: cardBGColor,
                  filled: true,
                  hintStyle: blackTwoTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: regular,
                  ),
                  errorStyle: redTextStyle.copyWith(
                    fontSize: 12.0,
                    fontWeight: regular,
                  ),
                  hintText: 'Search . . .',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
                onChanged: (value) {
                  searchProvider.searchContact(value, productProvider.products);
                },
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            GestureDetector(
              onTap: () {
                searchProvider.searchContact(
                    _searchController.text, productProvider.products);
              },
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: purpleOneColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(
                  'assets/icons/ic_search.svg',
                  fit: BoxFit.scaleDown,
                  color: whiteOneColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

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
                'Search',
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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(
            90.0,
          ),
          child: search(),
        ),
      );
    }

    Widget isEmpty() {
      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                SvgPicture.asset(
                  'assets/icons/ic_search_2.svg',
                  color: purpleOneColor,
                  height: 70,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Opss! The shoes you are\nlooking for do not exist',
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
                  'Let\'s find your other favorite shoes',
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
                      FocusScope.of(context).requestFocus(focusNode);
                    },
                    text: 'Find Another Shoes',
                  ),
                ),
                SizedBox(
                  height: defaultMargin,
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading2(text: 'For You'),
          const SizedBox(
            height: 8.0,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: searchProvider.productsOnSearch.length,
            itemBuilder: (BuildContext context, int index) => FadeAnimation(
              child: CardSearch(
                product: searchProvider.productsOnSearch[index],
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
      body: searchProvider.productsOnSearch.isEmpty
          ? isEmpty()
          : _searchController.text.isNotEmpty &&
                  searchProvider.productsOnSearch.isEmpty
              ? isEmpty()
              : ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    content(),
                  ],
                ),
    );
  }
}
