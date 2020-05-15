import 'package:flutter/material.dart';
import 'package:citizenpower/loginpage.dart';
import 'package:flutter/widgets.dart';

class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int selectedIndex = 0;
  final widgetOptions = [
    Text("profile settings"),
    Text("Group settings"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Settings"),
      ),
      body: Center(
        //child: widgetOptions.elementAt(selectedIndex),
      child:
        RaisedButton( // This button is simple directs the user back to the login page, and is not a logout
          child: Text('Logout'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
