import 'package:citizenpower/Views/ProfileViews/ProfilePage.dart';
import 'package:citizenpower/Views/aboutcitzen/aboutcitizen.dart';
import 'Views/eventview/eventpage.dart';
import 'package:citizenpower/Views/eventview/eventview.dart';
import 'package:citizenpower/Views/groupview/GroupPage.dart';
import 'package:citizenpower/Views/groupview/groupview.dart';
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
          "/g": (BuildContext context) => new GroupView(
                user: null,
              ),
          "/f": (BuildContext context) => new EventView(),
          "/i": (BuildContext context) => new GroupPage(),
          "/j": (BuildContext context) => new EventPage(),
          "/p": (BuildContext context) => new ProfileScreen(user: null),
        },
        theme: new ThemeData(
            primaryColor: brightOrange, accentColor: Color(0xFFFEF9EB)));
  }
}
