import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'ProfilePage.dart';
import 'settings.dart';
import 'constants.dart';
import 'electorate.dart';
import 'profilelist.dart';
import 'leader.dart';
import 'AppHome.dart';

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

//This acts as a navigator for the bottom Nav Bar
void onTap(int index, BuildContext context) {
  if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AppHome()),
    );
  } else if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  } else if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Electorate()),
    );
  } else if (index == 4) {
  } else if (index == 5) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Setting()),
    );
  }
}

//Returns all bottom nav bar items
List<BottomNavigationBarItem> bottomNavBarItems() {
  return [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text("Home"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('Profile'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_pin_circle),
      title: Text('Electorate'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.event),
      title: Text('Event'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.perm_identity),
      title: Text('leader'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      title: Text('Settings'),
    ),
  ];
}
