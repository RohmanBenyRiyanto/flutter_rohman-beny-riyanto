import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_2/screens/chat_page.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MyHomePage(),
        theme: const CupertinoThemeData(primaryColor: Colors.blue));
  }
}
