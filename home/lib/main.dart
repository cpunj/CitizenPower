import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'constants.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),
        theme: new ThemeData(primaryColor: brightOrange));
  }
}
