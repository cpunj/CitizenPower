import 'file:///C:/Users/jackl/AndroidStudioProjects/CitizenPower/home/lib/views/settingsView/settings.dart';
import 'file:///C:/Users/jackl/AndroidStudioProjects/CitizenPower/home/lib/views/loginViews/login_page.dart';
import 'package:citizenpower/views/electorateViews/electorate.dart';
import 'package:citizenpower/views/homeViews/aboutView/aboutCitizenWidgets/donate_page.dart';
import 'package:citizenpower/views/homeViews/aboutView/about_citizen.dart';
import 'package:citizenpower/views/homeViews/helpView/help_page.dart';
import 'package:citizenpower/views/homeViews/homeDashboardView/app_home.dart';
import 'package:citizenpower/views/socialViews/eventView/create_new_event.dart';
import 'package:citizenpower/views/socialViews/eventView/event_page.dart';
import 'package:citizenpower/views/socialViews/eventView/event_view.dart';
import 'package:citizenpower/views/socialViews/eventView/finding_events.dart';
import 'package:citizenpower/views/socialViews/groupView/create_new_group.dart';
import 'package:citizenpower/views/socialViews/groupView/group_page.dart';
import 'package:citizenpower/views/socialViews/groupView/group_view.dart';
import 'package:flutter/material.dart';
import 'views/postViews/detail.dart';
import 'views/electorateViews/contact_view.dart';
import 'views/electorateViews/electorate_profile_details.dart';
import 'views/electorateViews/electorate_selector_view.dart';
import 'views/electorateViews/electorate_view.dart';
import 'constants.dart';
import 'models/user.dart';
//Testing Github: Hello I am changing this comment
//This is a change I made in the branch
//This is a change I made in the master

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
          "/h": (BuildContext context) => new ElectorateSelectorView(),
          "/l": (BuildContext context) => new ElectorateView(user: null),
          "/i": (BuildContext context) => new GroupPage(),
          "/j": (BuildContext context) => new EventPage(),
          "/z": (BuildContext context) => new Electorate(
                user: null,
              ),
          "/k": (BuildContext context) => new CreateNewEvent(),
          "/l": (BuildContext context) => new CreateNewGroup(),
          "/m": (BuildContext context) => new FindingEvents(),
          "donate_page": (BuildContext context) => new Donate(),
          "detail": (BuildContext context) => new DettailWidget(),
        },
        theme: new ThemeData(
            primaryColor: brightOrange, accentColor: Color(0xFFFEF9EB)));
  }
}
