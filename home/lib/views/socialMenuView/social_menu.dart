import 'file:///C:/Users/jackl/AndroidStudioProjects/CitizenPower/home/lib/views/genericWidgets/generic_layouts.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SocialMenu extends StatefulWidget {
  final FirebaseUser user;
  const SocialMenu({Key key, @required this.user}) : super(key: key);

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
      appBar: topAppBarLayout("Social"),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/event.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: MaterialButton(
                    elevation: 8.0,
                    onPressed: () {
                      goEvent(context, widget.user);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Events",
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //  top: 80.0, left: 120, right: 120, bottom: 40),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/group.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: MaterialButton(
                    elevation: 8.0,
                    onPressed: () {
                      goGroupList(context, widget.user);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Groups",
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/letter.jpg'),
                        fit: BoxFit.cover),
                  ),
                  child: MaterialButton(
                    elevation: 8.0,
                    onPressed: () {
                      goMessage(context, widget.user);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Messages",
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/search.png'),
                        fit: BoxFit.cover),
                  ),
                  child: MaterialButton(
                    elevation: 8.0,
                    onPressed: () {
                      goSearch(context, widget.user);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Search people",
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                    ),
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
              onTap(index, context, widget.user, currentIndex);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
