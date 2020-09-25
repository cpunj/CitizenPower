import 'package:citizenpower/views/loginViews/login_page.dart';
import 'package:citizenpower/views/homeViews/aboutView/aboutCitizenWidgets/donate_page.dart';
import 'package:citizenpower/views/homeViews/aboutView/about_citizen.dart';
import 'package:citizenpower/views/homeViews/helpView/help_page.dart';
import 'package:citizenpower/views/homeViews/settingsView/settings.dart';
import 'package:citizenpower/views/socialViews/eventView/finding_events.dart';
import 'package:flutter/material.dart';
import 'views/postViews/detail.dart';
import 'constants.dart';
import 'models/user.dart';

void main() => runApp(new MyApp());
User currentUserModel;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //All Widgets are contained within a 'Material App'P
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new LoginPage(),
        //Secondary method for pushing between State Widgets
        ///These methods will need to be changed to navigator_pushes.dart method
        routes: <String, WidgetBuilder>{
          "/e": (BuildContext context) => new AboutCitizenInfo(),
          "/c": (BuildContext context) => new HelpView(),
          "/d": (BuildContext context) => new Setting(user: null),
          "/m": (BuildContext context) => new FindingEvents(),
          "donate_page": (BuildContext context) => new Donate(),
          "detail": (BuildContext context) => new DettailWidget(),
        },
        theme: new ThemeData(
            primaryColor: brightOrange, accentColor: Color(0xFFFEF9EB)));
  }
}
