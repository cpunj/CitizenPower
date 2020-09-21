import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindingEvents extends StatefulWidget {
  final FirebaseUser user;
  const FindingEvents({Key key, this.user}) : super(key: key);
  @override
  _FindingEventsState createState() => _FindingEventsState();
}

class _FindingEventsState extends State<FindingEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Find Events"),
        elevation: 1.0,
      ),
      body: Column(
        children: <Widget>[
<<<<<<< HEAD
          ExpansionTile(
            title: Text('Events You May Like',
                style: TextStyle(
                    fontSize: 29.0,
                    color: Colors.black),
                textAlign: TextAlign.center),
            trailing: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black),
            children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12),
                  child: Text(
                    'Art Night',
                    style:
                    TextStyle(fontSize: 20.0),
                  )),

              Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 12),
                  child: Text(
                      'Location: 410 Sandy bay Road,'
                          '10 min left')),
             ExpansionTile(

                title: Text('Events Happening right now',
                    style: TextStyle(
                        fontSize: 29.0,
                        color: Colors.black),
                    textAlign: TextAlign.center),
                trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black),
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12),
                      child: Text(
                        'Dark Mofo',
                        style:
                        TextStyle(fontSize: 20.0),
                      )),

                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12),
                      child: Text(
                          'Salamanca 8pm-12am')),
    ],),
              ExpansionTile(
                title: Text('Disover Online Events',
                    style: TextStyle(
                        fontSize: 29.0,
                        color: Colors.black),
                    textAlign: TextAlign.center),
                trailing: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black),
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12),
                      child: Text(
                        'Dark Mofo',
                        style:
                        TextStyle(fontSize: 20.0),
                      )),

                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 12),
                      child: Text(
                          'Salamanca 8pm-12am')),
=======
          Container(
            child: ListTile(
              title: Text("Events You May Like"),
              onTap: () {
                Navigator.of(context).pushNamed("/j");
              },
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
          ),
          Divider(
            height: 15,
            thickness: 1,
          ),
          Container(
            child: ListTile(
              title: Text("Happenning Online Now"),
              onTap: () {
                Navigator.of(context).pushNamed("/j");
              },
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
          ),
          Divider(
            height: 15,
            thickness: 1,
          ),
          Container(
            child: ListTile(
              title: Text("Discover Online Events"),
              onTap: () {
                Navigator.of(context).pushNamed("/j");
              },
              trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                onPressed: () {},
              ),
            ),
          ),
          Divider(
            height: 15,
            thickness: 1,
          ),
>>>>>>> creatingEvents
        ],
      ),
    ],

    )
    ]
    ),

    );
  }
}
