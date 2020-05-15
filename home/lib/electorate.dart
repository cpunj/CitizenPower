import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'constants.dart';

//Starting Electorate page which needs to be linked to the NavBar
class Electorate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
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
