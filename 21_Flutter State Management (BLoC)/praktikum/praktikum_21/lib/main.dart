// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views/home_page.dart';
import 'bloc/add_contact/contact_bloc.dart';
import 'bloc/delete_contact/delete_contact_bloc.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContactBloc>(
          create: (context) => ContactBloc(),
        ),
        BlocProvider<DeleteContactBloc>(
          create: (context) => DeleteContactBloc(),
        ),
      ],
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
