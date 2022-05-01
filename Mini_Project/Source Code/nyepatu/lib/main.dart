import 'package:flutter/material.dart';
import 'package:nyepatu/provider/search_provider.dart';
import 'package:nyepatu/provider/wishlist_provider.dart';
import 'package:nyepatu/views/mainpage_screens/main_page.dart';
import 'package:provider/provider.dart';

import 'provider/auth_provider.dart';
import 'provider/category_provider.dart';
import 'provider/preference_provider.dart';
import 'provider/product_provider.dart';
import 'views/dashboard_screens/dashboard_screens.dart';
import 'views/sign_screens/sign_in_screens/sign_in_screens.dart';
import 'views/sign_screens/sign_up_screens/sign_up_screens.dart';
import 'views/splash_screens/splash_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WishlistProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          SignIn.routeName: (context) => const SplashScreen(),
          SignUp.routeName: (context) => const SplashScreen(),
          MainPage.routeName: (context) => const MainPage(),
          DashBoard.routeName: (context) => const DashBoard(),
        },
      ),
    );
  }
}
