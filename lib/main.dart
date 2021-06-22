import 'package:flutter/material.dart';
import 'package:parking/FirstActivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: FirstActivity(),
    );
  }
}
