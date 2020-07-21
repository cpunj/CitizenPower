import 'package:flutter/material.dart';

//Provides transparency parameter for all material colours
//RGB values are irrelevant, only transparency (4th) parameter is relevant
const Map<int, Color> color = {
  50: Color.fromRGBO(216, 96, 24, .1),
  100: Color.fromRGBO(216, 96, 24, .2),
  200: Color.fromRGBO(216, 96, 24, .3),
  300: Color.fromRGBO(216, 96, 24, .4),
  400: Color.fromRGBO(216, 96, 24, .5),
  500: Color.fromRGBO(216, 96, 24, .6),
  600: Color.fromRGBO(216, 96, 24, .7),
  700: Color.fromRGBO(216, 96, 24, .8),
  800: Color.fromRGBO(216, 96, 24, .9),
  900: Color.fromRGBO(216, 96, 24, 1),
};
//All style guide colours implemented
//Any more colours needed to be added here
const MaterialColor brightOrange = MaterialColor(0xFFD86018, color);
const MaterialColor coolGrey = MaterialColor(0xFF53565A, color);
const MaterialColor alloyOrange = MaterialColor(0xFFB86125, color);
const MaterialColor darkGold = MaterialColor(0xFFC69214, color);
const MaterialColor ashGrey = MaterialColor(0xFFBABBB1, color);
const MaterialColor moshGreen = MaterialColor(0xFF9B945F, color);

//ProfileOptions
class ProfileOptions {
  static const String Edit = 'Edit';
  static const String Settings = 'Settings';

  static const List<String> choices = <String>[
    Edit,
    Settings,
  ];
}
