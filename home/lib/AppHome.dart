import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Layouts/GenericLayouts.dart';
import 'Views/ProfileViews/ProfilePage.dart';
import 'Views/ElectorateViews/electorate.dart';
import 'Views/ElectorateViews/leaderslist.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout('Home ${widget.user.email}'),
      body: ListView(
          physics: AlwaysScrollableScrollPhysics(), children: <Widget>[]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: bottomNavBarItems(),
          onTap: (index) {
            setState(() {
              onTap(index, context, widget.user, currentIndex);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
