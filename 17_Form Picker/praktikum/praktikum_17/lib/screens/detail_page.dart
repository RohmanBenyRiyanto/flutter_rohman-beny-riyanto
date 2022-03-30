import 'dart:io';

import 'package:flutter/material.dart';
import 'package:praktikum_17/themes/theme.dart';

import '../components/app_bar_sapace.dart';
import '../components/outline_icon_button.dart';

class DetailScreen extends StatefulWidget {
  final File imageFile;
  final DateTime date;
  final Color color;
  final String caption;
  const DetailScreen({
    Key? key,
    required this.imageFile,
    required this.date,
    required this.color,
    required this.caption,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  AppBar _header(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMarginAppBar),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OutlineIconsButton(
              icons: 'assets/icons/left_ios_arrow.svg',
              press: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Detail Screen',
              style: headingTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
            const AppBarSpace()
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMarginBody),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: displayHeight(context) * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: transparentColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.file(
                      widget.imageFile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: defaultMarginSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Publish At :  ${widget.date.day} / ${widget.date.month} / ${widget.date.year}',
                      style: headingTextStyle.copyWith(
                        fontSize: 16.0,
                        fontWeight: semiBold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: widget.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: defaultMarginSpace),
                Text(
                  'Caption :',
                  style: headingTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  widget.caption,
                  style: titleTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
