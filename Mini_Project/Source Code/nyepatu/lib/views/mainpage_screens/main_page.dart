import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nyepatu/themes/theme.dart';
import 'package:nyepatu/views/dashboard_screens/dashboard_screens.dart';
import 'package:nyepatu/views/detail_screens/detail_screens.dart';
import 'package:nyepatu/views/profile_screens/profile_screens.dart';
import 'package:nyepatu/views/search_screens/search_screens.dart';
import 'package:nyepatu/views/wishlist_screens/wishlist_screens.dart';
import 'package:provider/provider.dart';

import '../../animation/fade_animation.dart';
import '../../components/button_drawer.dart';
import '../../components/button_icon_circle.dart';
import '../../components/costum_dialog_bottom.dart';
import '../../provider/auth_provider.dart';

import '../../themes/transitions.dart';
import 'fixfloatingbutton/fixfloatingbutton.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/mainpage';
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey();
  int currentIndex = 0;

  final List<Widget> body = [
    const DashBoard(),
    const Search(),
    const WishList(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        backgroundColor: purpleOneColor,
        child: SvgPicture.asset(
          'assets/icons/ic_cart.svg',
          color: whiteOneColor,
          width: 20.0,
        ),
      );
    }

    // ignore: non_constant_identifier_names
    Widget CustomBottomNav() {
      // ignore: unused_local_variable
      final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
      return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(defaultMargin)),
          child: BottomAppBar(
            elevation: 0,
            color: transparentColor,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10.0,
            clipBehavior: Clip.antiAlias,
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                elevation: 0,
                backgroundColor: whiteOneColor,
                currentIndex: currentIndex,
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                    // ignore: avoid_print
                    print(value);
                  });
                },
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/ic_home.svg',
                      width: 21,
                      color: currentIndex == 0 ? purpleOneColor : grayTwoColor,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 45.0),
                      child: SvgPicture.asset(
                        'assets/icons/ic_search.svg',
                        width: 20,
                        color:
                            currentIndex == 1 ? purpleOneColor : grayTwoColor,
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 45.0),
                      child: SvgPicture.asset(
                        'assets/icons/ic_love_outline.svg',
                        width: 20,
                        color:
                            currentIndex == 2 ? purpleOneColor : grayTwoColor,
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icons/ic_profile.svg',
                      width: 18,
                      color: currentIndex == 3 ? purpleOneColor : grayTwoColor,
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    AppBar header() {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteOneColor,
        titleSpacing: 0,
        elevation: 0,
        title: Consumer<AuthProvider>(
          builder: (context, state, _) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonIconCircle(
                    icons: 'assets/icons/ic_drawer.svg',
                    press: () {
                      globalScaffoldKey.currentState!.openDrawer();
                    },
                  ),
                  SvgPicture.asset(
                    'assets/images/logo_app_bar.svg',
                    fit: BoxFit.scaleDown,
                    height: 30.0,
                  ),
                  if (state.user.profilePhoto!.isNotEmpty)
                    Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            state.user.profilePhoto!,
                          ),
                        ),
                      ),
                    )
                  else
                    FadeAnimation(
                      child: SvgPicture.asset(
                        'assets/images/profile_default.svg',
                        fit: BoxFit.scaleDown,
                        height: 40.0,
                        width: 40.0,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      );
    }

    Widget drawerContent() {
      return Consumer<AuthProvider>(
        builder: (context, state, _) {
          return SafeArea(
            child: Drawer(
              backgroundColor: whiteOneColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 26.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (state.user.profilePhoto!.isNotEmpty)
                                Container(
                                  height: 65.0,
                                  width: 65.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        state.user.profilePhoto!,
                                      ),
                                    ),
                                  ),
                                )
                              else
                                FadeAnimation(
                                  child: SvgPicture.asset(
                                    'assets/images/profile_default.svg',
                                    fit: BoxFit.cover,
                                    height: 65.0,
                                    width: 65.0,
                                  ),
                                ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.user.name!,
                                      style: blackTextStyle.copyWith(
                                          fontSize: 18.0,
                                          fontWeight: semiBold,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                    ),
                                    Text(
                                      state.user.email!,
                                      style: secondaryTextStyle.copyWith(
                                          fontSize: 14.0,
                                          fontWeight: regular,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35.0),
                        Divider(
                          color: grayThreeColor.withOpacity(0.7),
                          thickness: 1.5,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        ButtonDrawer(
                          icons: 'assets/icons/ic_profile.svg',
                          tittle: 'Profile',
                          width: 18,
                          press: () {},
                        ),
                        ButtonDrawer(
                          icons: 'assets/icons/ic_love_outline.svg',
                          tittle: 'Wishlist',
                          width: 18,
                          press: () {},
                        ),
                        ButtonDrawer(
                          icons: 'assets/icons/ic_your_order.svg',
                          tittle: 'Order Status',
                          width: 18,
                          press: () {},
                        ),
                        ButtonDrawer(
                          icons: 'assets/icons/ic_setting.svg',
                          tittle: 'Settings',
                          width: 18,
                          press: () {},
                        ),
                        SizedBox(height: defaultMargin),
                        ButtonDrawer(
                          icons: 'assets/icons/ic_log_out.svg',
                          tittle: 'Log Out',
                          width: 18,
                          press: () async {
                            _showDialogBottom(context);
                          },
                        ),
                      ],
                    ),
                    Text(
                      'nye - patu version 1',
                      style: subtitleTextStyle.copyWith(
                        fontSize: 12.0,
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      key: globalScaffoldKey,
      appBar: currentIndex == 0 ? header() : null,
      drawer: drawerContent(),
      extendBody: true,
      backgroundColor: whiteOneColor,
      body: currentIndex != 3
          ? SafeArea(
              child: body[currentIndex],
              bottom: false,
            )
          : body[currentIndex],
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: const FixedCenterDockedFabLocation(),
      bottomNavigationBar: CustomBottomNav(),
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
