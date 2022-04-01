// main.dart
import 'package:flutter/material.dart';
import 'package:praktikum_16/views/add_contact.dart';

import '../views/home_page.dart';

void main() {
  runApp(const MyApp());
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
