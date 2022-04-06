// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/home_page.dart';
import 'bloc/contact_bloc.dart';
import 'views/add_contact.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactBloc>(
      create: (context) => ContactBloc(),
      child: MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Contact App',
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/add-contact': (context) => const AddContact(),
        },
      ),
    );
  }
}
