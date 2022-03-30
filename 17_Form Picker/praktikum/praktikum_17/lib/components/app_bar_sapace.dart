
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/theme.dart';

class AppBarSpace extends StatelessWidget {
  const AppBarSpace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      padding: const EdgeInsets.all(1.5),
      child: IconButton(
        splashColor: transparentColor,
        highlightColor: transparentColor,
        icon: SvgPicture.asset(
          'assets/icons/add.svg',
          color: transparentColor,
        ),
        onPressed: () {},
      ),
    );
  }
}
