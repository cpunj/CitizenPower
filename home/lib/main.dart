import 'package:citizenpower/home_screen.dart';
import 'package:citizenpower/recent_chat.dart';
import 'package:flutter/material.dart';
import 'AppHome.dart';
import 'chatscreen.dart';
import 'chatscreen.dart';
import 'chatscreen.dart';
import 'contactview.dart';
import 'electorateprofiledetails.dart';
import 'loginpage.dart';
import 'constants.dart';

//Testing Github: Jack Lennard

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),
        routes: <String, WidgetBuilder>{
          "/a": (BuildContext context) => new AboutMe(),
          "/b": (BuildContext context) => new ElectorateDetails(),
          "/c": (BuildContext context) => new HomeScreen(),
          "/x": (BuildContext context) => new AppHome(user: null),
        },
        theme: new ThemeData(
            primaryColor: brightOrange, accentColor: Color(0xFFFEF9EB)));
  }
}
