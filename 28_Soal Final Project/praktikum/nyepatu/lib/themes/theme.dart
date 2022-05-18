import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;

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

Color purpleOneColor = const Color(0xff8649FC);
Color purpleTwoColor = const Color(0xffA67DFD);
Color purpleThreeColor = const Color(0xffD1C2FD);
Color purpleFourColor = const Color(0xffF3EFFF);
Color grayOneColor = const Color(0xff979797);
Color grayTwoColor = const Color(0xffB2B3B5);
Color grayThreeColor = const Color(0xffD5D8DD);
Color grayFourColor = const Color(0xffDCDCDC);
Color grayFiveColor = const Color(0xffB2B5C6);
Color yellowOneColor = const Color(0xffFFCA26);
Color yellowTwoColor = const Color(0xffFAD666);
Color yellowThreeColor = const Color(0xffF5E6BB);
Color blackOneColor = const Color(0xff1F2243);
Color blackTwoColor = const Color(0xff5D617C);
Color blackThreeColor = const Color(0xffB2B5C7);
Color whiteOneColor = const Color(0xffFFFFFF);
Color whiteTwoColor = const Color(0xffFBFCFE);
Color whiteThreeColor = const Color(0xffF7F8FD);

Color cardBGColor = const Color(0xffF6F6F6);
Color redColor = const Color(0xffE31D20);
Color greenColor = const Color(0xff4CB050);
Color transparentColor = Colors.transparent;

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: purpleOneColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: grayOneColor,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: grayTwoColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: whiteOneColor,
);

TextStyle blackTextStyle = GoogleFonts.poppins(
  color: blackOneColor,
);

TextStyle blackTwoTextStyle = GoogleFonts.poppins(
  color: blackTwoColor,
);

TextStyle redTextStyle = GoogleFonts.poppins(
  color: redColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
