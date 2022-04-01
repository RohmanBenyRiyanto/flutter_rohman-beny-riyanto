import 'package:flutter/material.dart';

import '../themes/theme.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  // ignore: non_constant_identifier_names
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        gradient: LinearGradient(
          colors: [
            primaryColor,
            secondaryColor,
          ],
        ),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: transparentColor,
        ),
        onPressed: press as void Function()?,
        child: const SizedBox(
          height: 25.0,
          width: 25.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }
}
