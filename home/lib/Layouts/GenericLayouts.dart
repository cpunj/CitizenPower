import 'package:citizenpower/Navigator/NavigatorPushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../TextStyles.dart';
import '../constants.dart';
import '../Views/ProfileViews/profilelist.dart';
import '../database.dart';

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

//Layout function for top of profile page
Widget topProfileLayout(BuildContext context,FirebaseUser user) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: 160,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/grace.jpg'),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            MaterialButton(
              child: Text(
                "Grace's Community",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: darkGold,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileList(user:user)));
              },
            ),
          ],
        ),
        //Needs to link to a profile list
        Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(
              "${user.email}",
              style: profileNameStyle(),
            ),
            SizedBox(
              height: 10.0,
            ),
            MaterialButton(
              child: Text(
                "Connect with Grace",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: darkGold,
              onPressed: () {},
            ),
            SizedBox(
              height: 18.0,
            ),
            MaterialButton(
                child: Text(
                  "Message Grace",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: darkGold,
                onPressed: () {}),
          ],
        ),
      ],
    ),
  );
}

//Allows for profile picture editing

Widget topProfileLayoutEdit(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: 110,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            FlatButton(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/grace.jpg'),
                ),
              ),
              onPressed: () {
                //TODO:Edit function for current logged in user's profile picture
              },
            ),
          ],
        ),
        //Needs to link to a profile list
        Column(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Grace Williams",
              style: profileNameStyle(),
            ),
            SizedBox(
              height: 10.0,
            ),
            MaterialButton(
              child: Text(
                "Grace's Community",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: darkGold,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileList()));
              },
            ),
          ],
        ),
      ],
    ),
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
void onTap(
    int index, BuildContext context, FirebaseUser user, int currentIndex) {
  if (index == 0 && currentIndex != 0) {
    goHome(context, user);
  } else if (index == 1 && currentIndex != 1) {
    goProfilePageEdit(context, user);
  } else if (index == 2) {
  } else if (index == 3 && currentIndex != 3) {
    goSocialMenu(context, user);
  } else if (index == 4 && currentIndex != 4) {
    goElectorate(context, user);
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
      icon: Icon(Icons.plus_one),
      title: Text('New Post'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      title: Text('Social'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_pin_circle),
      title: Text('Electorate'),
    ),
  ];
}
