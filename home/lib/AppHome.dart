import 'package:flutter/material.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Dashboard ",
          style:
        TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(Icons.more_vert),
          ),
        ],


      ) ,
    );
  }
}
