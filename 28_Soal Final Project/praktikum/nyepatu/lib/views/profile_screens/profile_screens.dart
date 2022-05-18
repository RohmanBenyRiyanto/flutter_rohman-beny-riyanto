import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../components/button_profile.dart';
import '../../components/costum_dialog_bottom.dart';
import '../../provider/auth_provider.dart';
import '../../themes/theme.dart';
import '../../themes/transitions.dart';
import '../edit_profile_screens/edit_profile_screens.dart';

class Profile extends StatelessWidget {
  static const routeName = "/profile";
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: purpleOneColor,
        titleSpacing: 0,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 40.0,
                width: 40.0,
              ),
              Text(
                'Search',
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 40.0,
                width: 40.0,
              ),
            ],
          ),
        ),
      );
    }

    Widget subHead() {
      return Consumer<AuthProvider>(builder: (context, state, _) {
        return SizedBox(
          height: 155.0,
          child: Stack(
            children: [
              Container(
                height: 130.0,
                width: displayWidth(context),
                decoration: BoxDecoration(
                  color: purpleOneColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/il_header.png',
                    ),
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 100,
                  child: DottedBorder(
                    borderType: BorderType.Circle,
                    radius: const Radius.circular(100),
                    dashPattern: const [10, 10],
                    color: whiteOneColor,
                    strokeWidth: 2,
                    child: Center(
                      child: state.user.profilePhoto == null
                          ? SvgPicture.asset(
                              'assets/images/profile_default.svg',
                              height: 90.0,
                              width: 90.0,
                            )
                          : Container(
                              height: 90.0,
                              width: 90.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    state.user.profilePhoto!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      });
    }

    Widget content() {
      return Consumer<AuthProvider>(
        builder: (context, state, _) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  state.user.name ?? 'Your name',
                  style: blackTextStyle.copyWith(
                    fontSize: 18.0,
                    fontWeight: semiBold,
                  ),
                ),
                Text(
                  '@${state.user.username ?? 'Your username'}',
                  style: secondaryTextStyle.copyWith(
                    fontSize: 14.0,
                    fontWeight: regular,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: defaultMargin,
                    ),
                    Buttonprofile(
                      press: () {
                        Navigator.push(
                          context,
                          FadeInRoute(
                            routeName: EditProfile.routeName,
                            page: const EditProfile(),
                          ),
                        );
                      },
                      icons: 'assets/icons/ic_profile.svg',
                      text: 'Edit Profile',
                      surfix: 'assets/icons/ic_arrow_left.svg',
                    ),
                    SizedBox(
                      height: defaultMargin,
                    ),
                    Buttonprofile(
                      press: () {},
                      icons: 'assets/icons/ic_shiping.svg',
                      text: 'Tracking Order',
                      surfix: 'assets/icons/ic_arrow_left.svg',
                    ),
                    SizedBox(
                      height: defaultMargin,
                    ),
                    Buttonprofile(
                      press: () {},
                      icons: 'assets/icons/ic_your_order.svg',
                      text: 'Your Order',
                      surfix: 'assets/icons/ic_arrow_left.svg',
                    ),
                    SizedBox(
                      height: defaultMargin,
                    ),
                    Buttonprofile(
                      press: () {},
                      icons: 'assets/icons/ic_faq.svg',
                      text: 'FAQs',
                      surfix: 'assets/icons/ic_arrow_left.svg',
                    ),
                    SizedBox(
                      height: defaultMargin,
                    ),
                    SizedBox(
                      height: 50.0,
                      child: TextButton.icon(
                        onPressed: () async {
                          _showDialogBottom(context);
                        },
                        style: TextButton.styleFrom(
                          padding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          elevation: 0,
                          shadowColor: transparentColor,
                          backgroundColor: purpleFourColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        icon: SvgPicture.asset(
                          'assets/icons/ic_log_out.svg',
                          color: purpleOneColor,
                          height: 20.0,
                          width: 20.0,
                        ),
                        label: Text(
                          'Logout',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16.0,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: whiteOneColor,
      appBar: header(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          subHead(),
          content(),
        ],
      ),
    );
  }

  Future<dynamic> _showDialogBottom(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: transparentColor,
      builder: (context) {
        return const CostumDialogBottom();
      },
    );
  }
}
