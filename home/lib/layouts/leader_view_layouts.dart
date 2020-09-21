import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:citizenpower/constants.dart';
import 'package:citizenpower/text_styles.dart';

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

Widget leaderDrawer(BuildContext context, FirebaseUser user) {
  return new Drawer(
    child: new ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text("Andrew Wilkie"),
          accountEmail: new Text("andrewwilkie@gmail.com"),
          currentAccountPicture: new CircleAvatar(
            backgroundColor: darkGold,
            child: new Text(
              "AW",
              style: TextStyle(color: Colors.black87),
            ),
          ),
        ),
        new ListTile(
          title: new Text("About me "),
          onTap: () => goContactDetails(context, user),
        ),
        new ListTile(
          title: new Text("Electorate details"),
          onTap: () => goElectorateDetails(context, user),
        ),
      ],
    ),
  );
}
