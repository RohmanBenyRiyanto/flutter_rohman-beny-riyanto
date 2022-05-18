import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/theme.dart';

class ButtonDrawer extends StatelessWidget {
  const ButtonDrawer({
    Key? key,
    this.icons,
    this.tittle,
    this.press,
    this.height,
    this.width,
  }) : super(key: key);

  final String? icons;
  final String? tittle;
  final Function? press;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: SizedBox(
        height: 50.0,
        child: Row(
          children: [
            SvgPicture.asset(
              icons!,
              color: blackOneColor,
              height: height,
              width: width,
            ),
            const SizedBox(width: 14.0),
            Text(
              tittle!,
              style: blackTextStyle.copyWith(
                fontSize: 16.0,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
