import 'package:flutter/material.dart';
import '../AppHome.dart';
import '../ProfilePage.dart';
import '../TextStyles.dart';
import '../constants.dart';
import '../electorate.dart';
import '../settings.dart';

//Top app bar layout
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

//About me/bio layouts

Widget bioLayout(String info) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Bio:",
            style: TextStyle(
                color: darkGold, fontStyle: FontStyle.normal, fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '$info',
            style: TextStyle(
              fontSize: 14.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: 2.0,
            ),
          ),
        ],
      ),
    ),
  );
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
