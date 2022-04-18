import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/add_contact.dart';
import 'views/home_screen.dart';
import 'views/total_contact.dart';
import 'views/view_model/contact_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ContactProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/add-contact': (context) => const AddContact(),
        '/total-contact': (context) => const TotalContact(),
      },
    );
  }
}
