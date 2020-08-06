
import 'package:citizenpower/Views/SocialMenu.dart';
import 'package:citizenpower/Views/aboutcitzen/aboutcitizen.dart';
import 'package:citizenpower/Views/settings.dart';

import 'package:citizenpower/loginpage.dart';

import 'package:flutter/material.dart';
import 'AppHome.dart';
import 'Views/ElectorateViews/contactview.dart';
import 'Views/ElectorateViews/electorateprofiledetails.dart';
import 'constants.dart';

//Testing Github: Hello I am changing this comment

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),
        routes: <String, WidgetBuilder>{
          "/a": (BuildContext context) => new AboutMe(),
          "/b": (BuildContext context) => new ElectorateDetails(
                user: null,
              ),
          "/e": (BuildContext context) => new AboutCitizenInfo(),
          "/x": (BuildContext context) => new AppHome(user: null),
          "/d": (BuildContext context) => new Setting(user: null),
        },
        theme: new ThemeData(
            primaryColor: brightOrange, accentColor: Color(0xFFFEF9EB)));
  }
}
