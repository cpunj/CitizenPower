import 'package:citizenpower/Layouts/GenericLayouts.dart';
import 'package:citizenpower/Navigator/NavigatorPushes.dart';
import 'package:citizenpower/TextStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SocialMenu extends StatefulWidget {
  const SocialMenu({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _SocialMenuState createState() => _SocialMenuState();
}

//TODO: Find background pictures for buttons

Widget socialButton(String title, BuildContext context, Function f) {
  return Expanded(
    child: FlatButton(
      color: Colors.blueAccent,
      onPressed: () {},
      child: Text(
        "$title",
        style: buttonTextStyle1Large(),
      ),
    ),
  );
}

class _SocialMenuState extends State<SocialMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout("Social"),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  color: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    "Events",
                    style: buttonTextStyle1Large(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    "Groups",
                    style: buttonTextStyle1Large(),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: FlatButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    goHome(context, widget.user);
                  },
                  child: Text(
                    "Messages",
                    style: buttonTextStyle1Large(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 3,
          type: BottomNavigationBarType.fixed,
          items: bottomNavBarItems(),
          onTap: (index) {
            setState(() {
              onTap(index, context, widget.user);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
