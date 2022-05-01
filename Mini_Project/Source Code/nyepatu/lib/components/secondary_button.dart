import 'package:flutter/material.dart';
import 'package:nyepatu/themes/theme.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
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
        color: purpleFourColor,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: transparentColor,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: secondaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: regular,
          ),
        ),
      ),
    );
  }
}
