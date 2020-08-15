import 'package:citizenpower/Layouts/GenericLayouts.dart';
import 'package:citizenpower/Navigator/NavigatorPushes.dart';
import 'package:citizenpower/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Navigator/NavigatorPushes.dart';

class SocialMenu extends StatefulWidget {
  const SocialMenu({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _SocialMenuState createState() => _SocialMenuState();
}

//TODO: Find background pictures for buttons

class _SocialMenuState extends State<SocialMenu> {
  //used to prevent re-entering the same view in bottom nav bar
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.brown,
      appBar: topAppBarLayout("Social"),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: darkGold,
                      blurRadius: 5.0, // soften the shadow
                      //extend the shadow
                    )
                  ],
                ),
                child: MaterialButton(
                  padding: EdgeInsets.only(
                      top: 80.0, left: 120, right: 120, bottom: 40),
                  textColor: darkGold,
                  splashColor: Colors.orangeAccent,
                  elevation: 8.0,
                  child: Container(
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent,
                          blurRadius: 5,
                        ),
                      ],
                      image: DecorationImage(
                          image: AssetImage(''), fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "EVENTS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  // ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/n");
                  },
                ),
              ),

              //  top: 80.0, left: 120, right: 120, bottom: 40),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: darkGold,
                      blurRadius: 5.0, // soften the shadow
                      //extend the shadow
                    )
                  ],
                ),
                child: MaterialButton(
                  padding: EdgeInsets.only(
                      top: 80.0, left: 120, right: 120, bottom: 40),
                  textColor: darkGold,
                  splashColor: Colors.orangeAccent,
                  elevation: 8.0,
                  child: Container(
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent,
                          blurRadius: 5,
                        ),
                      ],
                      image: DecorationImage(
                          image: AssetImage(''), fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "  GROUPS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  // ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/g");
                  },
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                decoration: new BoxDecoration(
                  boxShadow: [
                    //background color of box
                    BoxShadow(
                      color: darkGold,
                      blurRadius: 5.0, // soften the shadow
                      //extend the shadow
                    )
                  ],
                ),
                child: MaterialButton(
                  padding: EdgeInsets.only(
                      top: 80.0, left: 120, right: 120, bottom: 40),
                  textColor: darkGold,
                  splashColor: Colors.orangeAccent,
                  elevation: 8.0,
                  child: Container(
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent,
                          blurRadius: 5,
                        ),
                      ],
                      image: DecorationImage(
                          image: AssetImage(''), fit: BoxFit.cover),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Messages",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  // ),
                  onPressed: () {
                    goMessage(context, widget.user);
                  },
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
              onTap(index, context, widget.user, currentIndex);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
