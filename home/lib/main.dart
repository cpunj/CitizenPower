import 'package:citizenpower/Views/settings.dart';

import 'package:citizenpower/login_page.dart';
import 'package:citizenpower/views/electorateViews/electorate.dart';

import 'package:flutter/material.dart';
import 'Views/aboutCitizen/about_citizen.dart';
import 'Views/eventView/create_new_event.dart';
import 'Views/eventView/event_page.dart';
import 'Views/eventView/event_view.dart';
import 'Views/groupview/group_page.dart';
import 'Views/groupview/group_view.dart';
import 'Views/helpView/help_page.dart';
import 'app_home.dart';
import 'views/electorateViews/contact_view.dart';
import 'views/electorateViews/electorate_profile_details.dart';
import 'constants.dart';
import 'user.dart';
//Testing Github: Hello I am changing this comment
//Testing Github: Hello I am changing this comment again

void main() => runApp(new MyApp());
User currentUserModel;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //All Widgets are contained within a 'Material App'P
    return new MaterialApp(
        home: new LoginPage(),
        //Secondary method for pushing between State Widgets
        routes: <String, WidgetBuilder>{
          "/a": (BuildContext context) => new AboutMe(),
          "/b": (BuildContext context) => new ElectorateDetails(
                user: null,
              ),
          "/e": (BuildContext context) => new AboutCitizenInfo(),
          "/c": (BuildContext context) => new HelpView(),
          "/x": (BuildContext context) => new AppHome(user: null),
          "/d": (BuildContext context) => new Setting(user: null),
          "/g": (BuildContext context) => new GroupView(
                user: null,
              ),
          "/f": (BuildContext context) => new EventView(),
          "/i": (BuildContext context) => new GroupPage(),
          "/j": (BuildContext context) => new EventPage(),
          "/z": (BuildContext context) => new Electorate(
                user: null,
              ),
          "/k": (BuildContext context) => new CreateNewEvent(),
        },
        theme: new ThemeData(
            primaryColor: brightOrange, accentColor: Color(0xFFFEF9EB)));
  }
}
