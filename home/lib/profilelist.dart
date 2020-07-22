import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Layouts/GenericLayouts.dart';

class ProfileList extends StatefulWidget {
  @override
  State<ProfileList> createState() {
    return new AppState();
  }
}

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
      body: new Container(
        child: new ListView.builder(
          reverse: true,
          itemBuilder: (_, int index) => EachList(this.names[index]),
          itemCount: this.names.length,
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
