// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:layout_app/common/globals.dart';
import 'package:layout_app/routes/home_page.dart';
import 'package:layout_app/routes/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: Login(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Home(),
      },
    );
  }
}
