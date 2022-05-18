import 'package:flutter/material.dart';
import 'package:nyepatu/themes/theme.dart';

class TextButtons extends StatelessWidget {
  const TextButtons({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: Text(
        text,
        style: primaryTextStyle.copyWith(
          fontSize: 14.0,
          fontWeight: regular,
        ),
      ),
    );
  }
}
