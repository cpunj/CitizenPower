import 'package:flutter/material.dart';
import 'package:citizenpower/loginpage.dart';
import 'package:citizenpower/constants.dart';
import 'package:citizenpower/electorate.dart';
import 'package:citizenpower/settings.dart';
import 'package:citizenpower/registration.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 0;
  final _pageOptions = [
    Setting(),
    Electorate(),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),
        theme: new ThemeData(primaryColor: brightOrange));
  }
}
