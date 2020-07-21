import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'settings.dart';
import 'constants.dart';
import 'electorate.dart';
import 'AppHome.dart';
import 'TextStyles.dart';

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

//Button styles
Widget buttonStyle1(String title, Function f) {
  return Container(
    width: 300.00,
    child: RaisedButton(
        onPressed: () {
          f();
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        elevation: 0.0,
        padding: EdgeInsets.all(.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [darkGold, brightOrange]),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 40.0),
            alignment: Alignment.center,
            child: Text(
              "$title",
              style: buttonTextStyle1(),
            ),
          ),
        )),
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

//Leader view header layout
Widget leaderViewHeader(
    {String name, int postNumber, int connectionNumber, int followNumber}) {
  return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [darkGold, brightOrange])),
      child: Container(
        width: double.infinity,
        height: 250.0,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(backgroundImage: AssetImage("assets/Wilkie.jpeg")),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "$name",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              leaderViewDataLayout(postNumber, connectionNumber, followNumber)
            ],
          ),
        ),
      ));
}

//For profile name, change as needed
TextStyle profileNameStyle() {
  return TextStyle(
      color: Colors.black,
      fontSize: 20,
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

//Data card for leader view
Widget leaderViewDataLayout(
    int postNumber, int connectionNumber, int followNumber) {
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
    clipBehavior: Clip.antiAlias,
    color: Colors.white,
    elevation: 5.0,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "Posts",
                  style: textStyleBold(),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "$postNumber",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: darkGold,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "Connection",
                  style: textStyleBold(),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "$connectionNumber",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: darkGold,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "Follow",
                  style: textStyleBold(),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "$followNumber",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: darkGold,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
