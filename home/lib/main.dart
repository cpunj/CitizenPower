import 'package:flutter/material.dart';
import 'AppHome.dart';
import 'Views/ElectorateViews/contactview.dart';
import 'Views/ElectorateViews/electorateprofiledetails.dart';
import 'loginpage.dart';
import 'constants.dart';

//I am going to write the electorate view in this branch - Jack

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),
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
