import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'ProfilePage.dart';
import 'settings.dart';
import 'constants.dart';
import 'electorate.dart';
import 'profilelist.dart';
import 'leader.dart';
import 'AppHome.dart';

//Layout of standard top app bar

Widget topAppBarLayout(String title) {
  return AppBar(
    title: new Text(
      title,
      style: appBarStyle(),
    ),
    actions: <Widget>[
      Container(
        margin: EdgeInsets.only(left: 10),
        child: Icon(Icons.more_vert),
      ),
    ],
  );
}

//For top app bar, change as needed
TextStyle appBarStyle() {
  return TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
}

//For profile name, change as needed
TextStyle profileNameStyle() {
  return TextStyle(
      color: Colors.black,
      fontSize: 25,
      letterSpacing: 1,
      wordSpacing: 2,
      height: 1.2,
      fontWeight: FontWeight.w600);
}

//This acts as a navigator for the bottom Nav Bar
void onTap(int index, BuildContext context) {
  if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AppHome()),
    );
  } else if (index == 1) {
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
  } else if (index == 5) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Setting()),
    );
  }
}

//Returns all bottom nav bar items
List<BottomNavigationBarItem> bottomNavBarItems() {
  return [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("Home"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('Profile'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_pin_circle),
      title: Text('Electorate'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.event),
      title: Text('Event'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.perm_identity),
      title: Text('leader'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text('Settings'),
    ),
  ];
}
