
import 'package:flutter/material.dart';
import 'AppHome.dart';
import 'Views/MessageViews/chatscreen.dart';
import 'Views/MessageViews/chatscreen.dart';
import 'Views/MessageViews/chatscreen.dart';
import 'Views/ElectorateViews/contactview.dart';
import 'Views/ElectorateViews/electorateprofiledetails.dart';
import 'loginpage.dart';
import 'constants.dart';

//Testing Github: Jack Lennard

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),//PLayingwith github
        routes: <String, WidgetBuilder>{
          "/a": (BuildContext context) => new AboutMe(),
          "/b": (BuildContext context) => new ElectorateDetails(),
          "/c": (BuildContext context) => new AppHome(),
          "/x": (BuildContext context) => new AppHome(user: null),
        },
        theme: new ThemeData(
            primaryColor: brightOrange, accentColor: Color(0xFFFEF9EB)));
  }
}
