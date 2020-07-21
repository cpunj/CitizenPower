import 'package:citizenpower/AppHome.dart';
import 'package:citizenpower/contactview.dart';
import 'package:citizenpower/electorateprofiledetails.dart';
import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'constants.dart';
import 'electorate.dart';

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
          "/x": (BuildContext context) => new AppHome(user: null),
        },
        theme: new ThemeData(primaryColor: brightOrange));
  }
}
