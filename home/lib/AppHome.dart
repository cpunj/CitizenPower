import 'package:citizenpower/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Layouts/GenericLayouts.dart';
import 'ProfilePage.dart';
import 'electorate.dart';
import 'leaderslist.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  _onTap(int index) {
    //This acts as a navigator for the Nav Bar

    if (index == 0) {
      BuildContext context;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppHome()),
      );
    } else if (index == 1) {
      //Need to implement home page, AppHome()
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Electorate()),
      );
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LeadersList()),
      );
    } else if (index == 5) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Setting()),
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout('Home'),
      body: ListView(
          physics: AlwaysScrollableScrollPhysics(), children: <Widget>[]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: bottomNavBarItems(),
          onTap: (index) {
            setState(() {
              onTap(index, context);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
