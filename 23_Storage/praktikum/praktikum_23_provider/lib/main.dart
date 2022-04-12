// main.dart
import 'package:flutter/material.dart';
import 'package:praktikum_16/views/add_contact.dart';
import 'package:provider/provider.dart';

import '../views/home_page.dart';
import 'providers/contact_providers.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Contact(),
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
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Contact App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/add-contact': (context) => const AddContact(),
      },
    );
  }
}
