import 'package:citizenpower/Layouts/generic_layouts.dart';
import 'package:citizenpower/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

class GroupView extends StatefulWidget {
  const GroupView({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _GroupViewState createState() => _GroupViewState();
}

class _GroupViewState extends State<GroupView> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("                " "Groups"),
        elevation: 1.0,
        actions: <Widget>[
          CircleAvatar(
            radius: 17,
            backgroundColor: brightOrange,
            child: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          CircleAvatar(
            radius: 17,
            backgroundColor: brightOrange,
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/CitizenLogo.png"),
                  radius: 25,
                ),
                title: Text("Group 1"),
                subtitle: Text("Group description: "),
                onTap: () => Navigator.of(context).pushNamed("/i"),
                trailing: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
              decoration: BoxDecoration(),
            ),
            Divider(
              height: 5,
              thickness: 0.5,
            ),
            Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/CitizenLogo.png"),
                  radius: 25,
                ),
                title: Text("Group 2"),
                subtitle: Text("Group description: "),
                onTap: () {
                  Navigator.of(context).pushNamed("/i");
                },
                trailing: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
            ),
            Divider(
              height: 5,
              thickness: 0.5,
            ),
            Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/CitizenLogo.png"),
                  radius: 25,
                ),
                title: Text("Group 3"),
                subtitle: Text("Group description: "),
                onTap: () {
                  Navigator.of(context).pushNamed("/i");
                },
                trailing: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
            ),
            Divider(
              height: 5,
              thickness: 0.5,
            ),
            Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/CitizenLogo.png"),
                  radius: 25,
                ),
                title: Text("Group 4"),
                subtitle: Text("Group description: "),
                onTap: () {
                  Navigator.of(context).pushNamed("/i");
                },
                trailing: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
            ),
            Divider(
              height: 5,
              thickness: 0.5,
            ),
            Container(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/CitizenLogo.png"),
                  radius: 25,
                ),
                title: Text("Group 5"),
                subtitle: Text("Group description: "),
                onTap: () {
                  Navigator.of(context).pushNamed("/i");
                },
                trailing: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
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
