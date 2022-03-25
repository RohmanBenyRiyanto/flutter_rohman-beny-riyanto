import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:praktikum_15/model.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';

import '../theme/theme.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  final List<String>? imageList;
  const HomeScreen({
    Key? key,
    this.imageList,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<String> imageList = [
    'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
    'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
  ];

  final List<ImageModel> ImageUrl = List.generate(
      imageList.length, (index) => ImageModel(imageUrl: imageList[index]));

  final controller = ScrollController();

  PreferredSize header() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(190.0),
      child: ScrollAppBar(
        backgroundColor: blackColor,
        controller: controller,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gallery',
                  style: whiteTextStyle.copyWith(
                    fontSize: 28,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Definisi/arti kata \'galeri\' di Kamus Besar Bahasa Indonesia (KBBI) adalah n ruangan atau gedung tempat memamerkan benda atau karya seni dan sebagainya.',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Container(
        margin: EdgeInsets.only(top: 20.0, left: defaultMargin),
        child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          itemCount: ImageUrl.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      DetailScreen(imageModel: ImageUrl[index])));
            },
            child: Image.network(
              ImageUrl[index].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ));
  }

  // Widget content() {
  //   return GestureDetector(
  //     onTap: () {},
  //     child: Container(
  //         margin: EdgeInsets.only(top: 20.0, left: defaultMargin),
  //         child: StaggeredGridView.countBuilder(
  //           shrinkWrap: true,
  //           physics: const NeverScrollableScrollPhysics(),
  //           crossAxisCount: 4,
  //           itemCount: data == null ? 0 : data!.length,
  //           itemBuilder: (BuildContext context, int index) => Image.network(
  //             data![index]['urls']['small'],
  //             fit: BoxFit.cover,
  //           ),
  //           staggeredTileBuilder: (int index) =>
  //               StaggeredTile.count(2, index.isEven ? 2 : 1),
  //           mainAxisSpacing: 4.0,
  //           crossAxisSpacing: 4.0,
  //         )),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        controller: controller,
        child: SafeArea(
          child: content(),
        ),
      ),
    );
  }
}
