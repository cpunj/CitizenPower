import 'package:citizenpower/Navigator/NavigatorPushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../TextStyles.dart';
import '../constants.dart';
import '../Views/ProfileViews/profilelist.dart';

//Top app bar layout, returns an appbar to the Appbar: parameter of a scaffold

//title parameter will be the text displayed within the app bar
Widget topAppBarLayout(String title) {
  return AppBar(
    //Text() displays the text given in the title parameter
    title: new Text(
      title,
      //Text style given by appBarStyle() to maintain design consistency
      style: appBarStyle(),
    ),
    actions: <Widget>[
      //TODO: Not every view is going to need 'More Options'. Need to remove.
      Container(
        margin: EdgeInsets.only(left: 10),
        child: Icon(Icons.more_vert),
      ),
    ],
  );
}

//Layout function for top of profile page
//Parameters include the BuildContext to allow navigation pushes
//And the logged in FirebaseUser to pass into any navigation pushes
Widget topProfileLayout(BuildContext context, FirebaseUser user) {
  //Container to hold all other widgets and providing padding between widgets and edge of screen
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: 160,
    //Presents all widgets horizontally across the view
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        //Column presents profile pic and Community button vertically
        Column(
          children: <Widget>[
            //Padding() provides padding between left edge of screen
            Padding(
              padding: const EdgeInsets.only(left: 20),
              //CircleAvatar() provides the selected profile's profile pic in a circle design
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/grace.jpg'),
              ),
            ),
            //Provides padding between the widgets within the column
            SizedBox(
              height: 10.0,
            ),
            //Button to allow for navigation
            MaterialButton(
              child: Text(
                "Grace's Community",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: darkGold,
              onPressed: () {
                goProfile(context, user);
              },
            ),
          ],
        ),
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
              onPressed: () {},
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileList(user: null)));
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
    goNewPost(context, user);
  } else if (index == 3 && currentIndex != 3) {
    goSocialMenu(context, user);
  } else if (index == 4 && currentIndex != 4) {
    goElectorateView(context, user);
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
