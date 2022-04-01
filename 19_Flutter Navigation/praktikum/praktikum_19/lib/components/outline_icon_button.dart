import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/theme.dart';

class OutlineIconsButton extends StatelessWidget {
  final String? icons;
  final Function? press;

  const OutlineIconsButton({
    Key? key,
    required this.icons,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      padding: const EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        border: Border.all(
          color: silverColor,
          width: 1.0,
        ),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        splashColor: transparentColor,
        highlightColor: transparentColor,
        icon: SvgPicture.asset(
          icons!,
          color: blackColor,
        ),
        onPressed: press as void Function()?,
      ),
    );
  }
}
