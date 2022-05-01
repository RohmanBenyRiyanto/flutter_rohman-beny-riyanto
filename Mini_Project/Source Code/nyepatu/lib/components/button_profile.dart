// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/theme.dart';

class Buttonprofile extends StatelessWidget {
  Buttonprofile({
    Key? key,
    required this.icons,
    required this.text,
    required this.surfix,
    required this.press,
  }) : super(key: key);
  String icons;
  String text;
  String surfix;
  Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: Container(
        height: 55.0,
        padding: const EdgeInsets.all(16.0),
        width: displayWidth(context),
        decoration: BoxDecoration(
          color: cardBGColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icons,
                  color: blackOneColor,
                  width: 20.0,
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Text(
                  text,
                  style: blackTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              surfix,
              color: blackOneColor,
              height: 16.0,
              width: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
