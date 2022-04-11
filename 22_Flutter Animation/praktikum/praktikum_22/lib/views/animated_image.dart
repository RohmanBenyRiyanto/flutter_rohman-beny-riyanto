import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/outline_icon_button.dart';
import '../themes/theme.dart';

class ImageAnimation extends StatefulWidget {
  const ImageAnimation({Key? key}) : super(key: key);

  @override
  _ImageAnimationState createState() => _ImageAnimationState();
}

class _ImageAnimationState extends State<ImageAnimation> {
  bool isTapped = false;

  AppBar _header() {
    return AppBar(
      backgroundColor: whiteColor,
      elevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMarginAppBar),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            OutlineIconsButton(
              icons: 'assets/icons/left_ios_arrow.svg',
              press: () {
                Navigator.pop(context);
              },
            ),
            Text(
              'Animated Image',
              style: headingTextStyle.copyWith(
                fontWeight: bold,
              ),
            ),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _header(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(
              () {
                isTapped = !isTapped;
              },
            );
          },
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 100.0, // soften the shadow
                ),
              ],
            ),
            child: Center(
              child: AnimatedContainer(
                height: isTapped ? 200.0 : 100.0,
                width: isTapped ? 200.0 : 100.0,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/236x/a2/31/01/a2310147775da5802d3e2b5ba458bdd8.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
