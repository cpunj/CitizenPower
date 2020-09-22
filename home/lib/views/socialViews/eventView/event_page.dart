import 'package:citizenpower/views/socialViews/groupView/picture.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class EventPage extends StatefulWidget {
  final FirebaseUser user;
  const EventPage({Key key, this.user}) : super(key: key);
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("              Events  "),
        elevation: 1.1,
        actions: <Widget>[
          Container(
            color: brightOrange,
            child: CircleAvatar(
              backgroundColor: brightOrange,
              child: IconButton(icon: Icon(Icons.delete), onPressed: () {}),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Divider(
            height: 10,
          ),
          Container(
            child: ListTile(
              title: Text("The Games Night"),
              subtitle: Text("Location: Hobart CBD"
                  "                                                                   "
                  "Event Description: This event is ....... "),
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
          ),
          GroupPicture(),
          const Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Row(
            children: <Widget>[
              FlatButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.star_border,
                    color: Colors.orangeAccent,
                  ),
                  label: Text(" 200 ")),
              const VerticalDivider(
                width: 5,
              ),
              FlatButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check_circle,
                    color: Colors.greenAccent,
                  ),
                  label: Text("588")),
              const VerticalDivider(
                width: 5,
              ),
              FlatButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: darkGold,
                  ),
                  label: Text("Share")),
            ],
          ),
        ],
      ),
    );
  }
}
