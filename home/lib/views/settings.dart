import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:citizenpower/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

ElectorateDatabaseMethods electorateDatabaseMethods =
    ElectorateDatabaseMethods();

class Setting extends StatefulWidget {
  const Setting({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> logOut() async {
    FirebaseUser user = auth.signOut() as FirebaseUser;
  }

  int selectedIndex = 0;
  final widgetOptions = [
    Text(""),
    Text(""),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: topAppBarLayout('Settings'),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 12.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  margin: const EdgeInsets.all(8.0),
                  color: darkGold,
                  child: ListTile(
                    onTap: () {
                      //edit profile
                    },
                    title: Text(
                      "Profile settings",
                      style: TextStyle(color: Colors.white),
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/grace.jpg"),
                    ),
                    trailing: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const SizedBox(height: 10.0),
                Card(
                  elevation: 5.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 30.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: darkGold,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Change password",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                        onTap: () {
                          //change password
                          electorateDatabaseMethods.uploadUpperLeader();
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade300,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Change Name",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Colors.white),
                        onTap: () {
                          //change password
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade300,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Notifications",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                        onTap: () {
                          //change password
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(),
                        width: double.infinity,
                        height: 1.0,
                        color: Colors.grey.shade300,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Pages Settings",
                          style: TextStyle(color: Colors.white),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                        onTap: () {
                          //change password
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "App Settings",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SwitchListTile(
                    activeColor: darkGold,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Notification"),
                    onChanged: (val) {}),
                SwitchListTile(
                    activeColor: darkGold,
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text("Location"),
                    onChanged: (val) {}),
                SwitchListTile(
                    activeColor: darkGold,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Recieve App update"),
                    onChanged: (val) {}),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 10,
              child: RaisedButton(
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    logOut();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => new MyApp()));
                  }))
        ],
      ),
    );
  }
}
