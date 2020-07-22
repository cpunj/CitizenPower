import 'package:flutter/material.dart';
import 'constants.dart';

//App bar text styles
TextStyle appBarStyle() {
  return TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
}

//Button text styles
TextStyle buttonTextStyle1() {
  return TextStyle(
      color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w300);
}

//Data text styles
TextStyle textStyleBold() {
  return TextStyle(
      color: darkGold, fontSize: 22.0, fontWeight: FontWeight.bold);
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
