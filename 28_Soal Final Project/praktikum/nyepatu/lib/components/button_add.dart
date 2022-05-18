import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/theme.dart';

class ButtonAdd extends StatelessWidget {
  final Function? press;
  final double? height;
  final double? width;

  const ButtonAdd({
    Key? key,
    this.press,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: blackOneColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/ic_add.svg',
            color: whiteOneColor,
          ),
        ),
      ),
    );
  }
}
