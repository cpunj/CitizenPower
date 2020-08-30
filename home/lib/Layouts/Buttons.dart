import 'package:flutter/material.dart';

import '../TextStyles.dart';
import '../constants.dart';

//Button style 1
//Parameters include the string that the button will display in the button
//and the function that runs when the button is pressed.

//Currently no uses, but can be used as a foundation for creating a button in new views
Widget buttonStyle1(String title, Function f) {
  return Container(
    width: 300.00,
    child: RaisedButton(
        //Function runs when button is pressed by user
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
