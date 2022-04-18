import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

import '../components/input_text.dart';
import '../components/outline_icon_button.dart';
import '../components/primary_button.dart';

import '../models/contact_model.dart';
import '../themes/theme.dart';
import 'view_model/contact_view_model.dart';

class TotalContact extends StatefulWidget {
  const TotalContact({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalContact> createState() => _TotalContactState();
}

class _TotalContactState extends State<TotalContact> {
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
              'Total Contact',
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

  Widget _content(context) {
    final contactProvider = Provider.of<ContactProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMarginBody,
      ),
      child: Center(
        child: Text(
          'Total Contact Saya : ${contactProvider.contacts.length}',
          style: headingTextStyle.copyWith(
            fontSize: 40,
            fontWeight: bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: _header(),
      body: _content(context),
    );
  }
}
