import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nyepatu/themes/theme.dart';

class PrimaryButtonIcon extends StatelessWidget {
  const PrimaryButtonIcon({
    Key? key,
    this.text,
    required this.press,
  }) : super(key: key);
  final String? text;
  // ignore: non_constant_identifier_names
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: purpleOneColor,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: transparentColor,
        ),
        onPressed: press as void Function()?,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text!,
              style: whiteTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SvgPicture.asset(
              'assets/icons/ic_arrow_right.svg',
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
