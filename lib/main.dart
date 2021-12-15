// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:layout_app/pages/drag_page.dart';
import 'package:layout_app/pages/gesture_page.dart';
import 'package:layout_app/pages/home_page.dart';
import 'package:layout_app/pages/login_page.dart';
import 'package:layout_app/pages/scale_page.dart';

import 'common/globals.dart';

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
        'Gesture': (BuildContext context) => Gesture(),
        'Drag': (BuildContext context) => Drag(),
        'Scale': (BuildContext context) => Scale(),
      },
    );
  }
}
