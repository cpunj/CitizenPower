import 'package:flutter/material.dart';
import 'constants.dart';

//Header Text Styles

TextStyle headerStyle1() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: darkGold,
    letterSpacing: 0.5,
    wordSpacing: 1,
  );
}

//Returns a TextStyle() widget, change as desired to change AppBar text design
TextStyle appBarStyle() {
  return TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
}

//Error text styles
TextStyle errorTextStyle1() {
  return TextStyle(
    color: Colors.redAccent,
    fontSize: 15.0,
  );
}

//Button text styles
TextStyle buttonTextStyle1() {
  return TextStyle(
      color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w300);
}

TextStyle buttonTextStyle1Large() {
  return TextStyle(
      color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w300);
}

//Data text styles
TextStyle textStyleBold() {
  return TextStyle(
      color: darkGold, fontSize: 22.0, fontWeight: FontWeight.bold);
}

TextStyle textStyleListGrey() {
  return TextStyle(
    color: Colors.grey,
    fontSize: 15.0,
    fontWeight: FontWeight.bold,
  );
}

TextStyle infoTextStyle1() {
  return TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold);
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

InputDecoration textFormDec({String label, String hint}) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
    hintStyle: TextStyle(color: Colors.white),
    errorStyle: TextStyle(
      color: Colors.redAccent,
      fontSize: 15.0,
    ),
    labelText: '$label',
    hintText: '$hint',
  );
}
