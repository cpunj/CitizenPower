import 'package:flutter/material.dart';
import 'loginpage.dart';

void main() => runApp(new MyApp());

const Map<int, Color> color = {
  //Provides transparency parameter for all material colours
  50: Color.fromRGBO(216, 96, 24,
      .1), //RGB values are irrelevant, only transparency (4th) parameter is relevant
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

const MaterialColor brightOrange =
    MaterialColor(0xFFD86018, color); //All style guide colours implemented
const MaterialColor coolGrey =
    MaterialColor(0xFF53565A, color); //Any more colours needed to be added here
const MaterialColor alloyOrange = MaterialColor(0xFFB86125, color);
const MaterialColor darkGold = MaterialColor(0xFFC69214, color);
const MaterialColor ashGrey = MaterialColor(0xFFBABBB1, color);
const MaterialColor moshGreen = MaterialColor(0xFF9B945F, color);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new LoginPage(),
        theme: new ThemeData(primaryColor: brightOrange));
  }
}


