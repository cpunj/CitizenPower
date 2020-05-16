import 'package:citizenpower/main.dart';
import 'package:flutter/material.dart';
import 'package:citizenpower/loginpage.dart';
import 'package:flutter/widgets.dart';
import 'constants.dart';
class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  int selectedIndex = 0;
  final widgetOptions = [
    Text(""),
    Text(""),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: brightOrange,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
      ),
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
                  color: Colors.deepOrange,
                  child: ListTile(
                    onTap: () {
                      //edit profile
                    },
                    title: Text(
                      "Profile settings",
                      style: TextStyle(color: Colors.black87),
                    ),
                    leading: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/grace.jpg"),
                    ),
                    trailing: Icon(Icons.edit),
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
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.lock_outline,
                          color: Colors.deepOrange,
                        ),
                        title: Text("Change password"),
                        trailing: Icon(Icons.keyboard_arrow_right),
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
                          Icons.perm_identity,
                          color: Colors.deepOrange,
                        ),
                        title: Text("Change Name"),
                        trailing: Icon(Icons.keyboard_arrow_right),
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
                          color: Colors.deepOrange,
                        ),
                        title: Text("Notifications"),
                        trailing: Icon(Icons.keyboard_arrow_right),
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
                          color: Colors.deepOrange,
                        ),
                        title: Text("Pages Settings"),
                        trailing: Icon(Icons.keyboard_arrow_right),
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
                      color: Colors.blue),
                ),
                SwitchListTile(
                    activeColor: Colors.deepOrangeAccent,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text("Notification"),
                    onChanged: (val) {}),
                SwitchListTile(
                    activeColor: Colors.deepOrangeAccent,
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text("Location"),
                    onChanged: (val) {}),
                SwitchListTile(
                    activeColor: Colors.deepOrangeAccent,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new MyApp()));
                  }))
        ],
      ),
    );
  }
}

/*

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

 */
