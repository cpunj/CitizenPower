import 'package:citizenpower/leaderslist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'ProfilePage.dart';
import 'settings.dart';
import 'constants.dart';
import 'electorate.dart';
import 'profilelist.dart';
import 'leader.dart';
import 'AppHome.dart';

//For top app bar, change as needed
TextStyle appBarStyle() {
  return TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
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
