import 'package:citizenpower/Navigator/NavigatorPushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../Layouts/GenericLayouts.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  State<ProfileList> createState() {
    return new AppState();
  }
}

//TODO: How to move FirebaseUser into stateless widget???
//The only broken function in master branch ^^^^
class AppState extends State<ProfileList> {
  List<String> names = [
    'Harry Fawcett',
    'Salman Md Farsy',
    'Ejaz Ahmed',
    'Jianyi Li',
    'Khern',
    'Chandan Punj',
    'Jack Lennard',
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: topAppBarLayout('Connections'),
      //Trying to push to the edit profile page, user class not transferring properly
      body: GestureDetector(
        onTap: () {
          goProfile(context, widget.user);
        },
        child: new Container(
          child: new ListView.builder(
            reverse: true,
            itemBuilder: (_, int index) => EachList(this.names[index]),
            itemCount: this.names.length,
          ),
        ),
      ),
    );
  }
}

class EachList extends StatelessWidget {
  final String name;
  EachList(this.name);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            new CircleAvatar(
              child: new Text(name[0]),
            ),
            new Padding(padding: EdgeInsets.only(right: 10.0)),
            new Text(
              name,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
