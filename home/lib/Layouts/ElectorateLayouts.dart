import 'package:flutter/material.dart';

Widget electorateInfoLayout({String name, String party, String pop}) {
  return Container(
    margin: EdgeInsets.only(left: 30, right: 30, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "Current MP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text("Andrew Wilkie"),
          ],
        ),
        Divider(
          height: 10,
          color: Colors.black,
        ),
        Column(
          children: <Widget>[
            Text(
              "Party",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text("Independent"),
          ],
        ),
        Divider(
          height: 10,
          color: Colors.black,
        ),
        Column(
          children: <Widget>[
            Text(
              "Population",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text("74K"),
          ],
        ),
      ],
    ),
  );
}
