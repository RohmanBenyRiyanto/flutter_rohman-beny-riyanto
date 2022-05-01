import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/theme.dart';

class CostumAlertDialog extends StatefulWidget {
  const CostumAlertDialog({
    Key? key,
    required this.icons,
    required this.tittle,
    required this.subtitle,
    required this.buttontext,
    required this.press,
  }) : super(key: key);

  final String icons;
  final String tittle;
  final String subtitle;
  final String buttontext;
  final Function press;

  @override
  State<CostumAlertDialog> createState() => _CostumAlertDialogState();
}

class _CostumAlertDialogState extends State<CostumAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: whiteOneColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          defaultMargin,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close_rounded,
                  color: blackOneColor,
                ),
              ),
            ),
            SvgPicture.asset(
              widget.icons,
              color: greenColor,
              width: 100.0,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(
              widget.tittle,
              style: primaryTextStyle.copyWith(
                fontSize: 18.0,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.subtitle,
              style: secondaryTextStyle.copyWith(
                fontSize: 14.0,
                fontWeight: light,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 154,
              height: 44,
              child: TextButton(
                onPressed: widget.press as void Function(),
                style: TextButton.styleFrom(
                  backgroundColor: purpleOneColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  widget.buttontext,
                  style: whiteTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
