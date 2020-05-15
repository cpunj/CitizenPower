import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'constants.dart';

//Starting Electorate page which needs to be linked to the NavBar
class Electorate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
      backgroundColor: Colors.orangeAccent,
      // iconTheme: IconThemeData(color: Colors.black),
      title: new Text(
        " Electorate ",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlue),
      ),
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Icon(Icons.more_vert),
        ),
      ],
    ));
  }
}
