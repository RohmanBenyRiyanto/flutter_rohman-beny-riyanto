import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMarginAppBar = 12.0;
double defaultMarginBody = 24.0;
double defaultMarginSpace = 20.0;

Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}

Color primaryColor = const Color(0xFF468eff);
Color secondaryColor = const Color(0xFF63a0ff);
Color blackColor = const Color(0xFF333333);
Color tittleColor = const Color(0xFF5E5F5F);
Color greyColor = const Color(0xFFA0A5AC);
Color redColor = const Color(0xffe66456);
Color greenColor = const Color(0xFF69F0AE);
Color silverColor = const Color(0xFFF2F2FB);
Color cardColor = Color.fromARGB(255, 246, 246, 251);
Color whiteColor = const Color(0xffFFFFFF);
Color subtitleColor = const Color.fromARGB(255, 189, 189, 189);
Color transparentColor = Colors.transparent;

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);

TextStyle headingTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

TextStyle titleTextStyle = GoogleFonts.poppins(
  color: tittleColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  color: greyColor,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: subtitleColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteColor,
);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
