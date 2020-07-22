import 'package:citizenpower/Navigator/NavigatorPushes.dart';
import 'package:flutter/material.dart';
import '../TextStyles.dart';
import '../constants.dart';

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

//2nd bio layout (can be expanded)
//Needs a GestureDetector

Widget bioLayout2(String info, bool expanded) {
  return Card(
    elevation: 2.5,
    margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
    child: Column(
      children: <Widget>[
        Text(
          'Bio:',
        ),
        Padding(padding: EdgeInsets.only(top: 0)),
        Text(
          '$info',
          overflow: TextOverflow.ellipsis,
          maxLines: expanded ? null : 100,
        ),
      ],
    ),
  );
}

//This acts as a navigator for the bottom Nav Bar
void onTap(int index, BuildContext context) {
  if (index == 0) {
    goHome(context);
  } else if (index == 1) {
    goProfile(context);
  } else if (index == 2) {
    goElectorate(context);
  } else if (index == 4) {
  } else if (index == 5) {
    goSettings(context);
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
