import 'package:flutter/material.dart';

import 'myPageView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuoteMyApp',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black),
        )
      ),
      home: MyPageView(),
    );
  }
}