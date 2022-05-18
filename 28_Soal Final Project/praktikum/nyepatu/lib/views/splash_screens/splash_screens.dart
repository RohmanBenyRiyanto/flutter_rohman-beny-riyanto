import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../animation/fade_animation.dart';
import '../../provider/auth_provider.dart';
import '../../provider/category_provider.dart';
import '../../provider/preference_provider.dart';
import '../../themes/theme.dart';
import '../../themes/transitions.dart';
import '../mainpage_screens/main_page.dart';
import '../sign_screens/sign_in_screens/sign_in_screens.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future(
      () async {
        // await Future.delayed(const Duration(seconds: 3));
        await Provider.of<CategoryProvider>(context, listen: false)
            .getCategories();
        Provider.of<PreferencesProvider>(context, listen: false).getUser().then(
          (value) async {
            if (await Provider.of<AuthProvider>(context, listen: false)
                .currentUser(value.token!)) {
              Navigator.pushAndRemoveUntil(
                  context,
                  FadeInRoute(
                    routeName: MainPage.routeName,
                    page: const MainPage(),
                  ),
                  (route) => false);
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  FadeInRoute(
                    routeName: SignIn.routeName,
                    page: const SignIn(),
                  ),
                  (route) => false);
            }
          },
        );
      },
    );
  }

  Widget content() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeAnimation(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              height: 90,
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          FadeAnimation(
            child: SvgPicture.asset(
              'assets/images/logo_tittle.svg',
              width: 150,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          FadeAnimation(
            child: Text(
              'Your daily shoes shop',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleOneColor,
      body: content(),
    );
  }
}
