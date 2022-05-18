import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/theme.dart';

class ButtonIconCircle extends StatelessWidget {
  final String? icons;
  final Function? press;
  final Color? color;

  const ButtonIconCircle({
    Key? key,
    this.icons,
    this.press,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: Container(
        height: 38,
        width: 38,
        padding: const EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: cardBGColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            icons!,
            color: color ?? blackOneColor,
          ),
        ),
      ),
    );
  }
}
