import 'package:flutter/material.dart';

import '../themes/theme.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  // ignore: non_constant_identifier_names
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryColor,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: blackColor,
          backgroundColor: transparentColor,
        ),
        onPressed: press as void Function(),
        child: Text(
          text,
          style: headingTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
