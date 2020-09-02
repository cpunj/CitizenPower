import 'package:citizenpower/Views/ProfileViews/profile_page.dart';
import 'package:citizenpower/views/aboutCitizen/about_citizen.dart';
import 'Views/eventview/event_page.dart';
import 'package:citizenpower/Views/eventview/event_view.dart';
import 'package:citizenpower/Views/groupview/group_page.dart';
import 'package:citizenpower/Views/groupview/group_view.dart';
import 'package:citizenpower/Views/settings.dart';

import 'package:citizenpower/login_page.dart';

import 'package:flutter/material.dart';
import 'app_home.dart';
import 'Views/ElectorateViews/contact_view.dart';
import 'Views/ElectorateViews/electorate_profile_details.dart';
import 'constants.dart';
//Testing Github: Hello I am changing this comment again

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //All Widgets are contained within a 'Material App'
    return new MaterialApp(
        home: new LoginPage(),
        //Secondary method for pushing between State Widgets
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
