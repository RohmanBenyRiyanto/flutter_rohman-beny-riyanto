import 'package:flutter/material.dart';

import '../themes/theme.dart';

class Heading2 extends StatelessWidget {
  Heading2({
    Key? key,
    this.padding,
    required this.text,
  }) : super(key: key);

  final String text;

  bool? padding = true;

  @override
  Widget build(BuildContext context) {
    return padding ?? true
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Text(
              text,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          )
        : Text(
            text,
            style: blackTextStyle.copyWith(
              fontSize: 22,
              fontWeight: semiBold,
            ),
          );
  }
}
