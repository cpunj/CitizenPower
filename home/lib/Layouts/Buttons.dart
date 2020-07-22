import 'package:flutter/material.dart';

import '../TextStyles.dart';
import '../constants.dart';

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