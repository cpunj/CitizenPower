import 'package:citizenpower/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutMe extends StatelessWidget {
  final String title;

  const AboutMe({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [darkGold, brightOrange])),
              child: Container(
                width: double.infinity,
                height: 250.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                          backgroundImage: AssetImage("assets/Wilkie.jpeg")),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Andrew Wilkie",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Posts",
                                      style: TextStyle(
                                        color: darkGold,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "142",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: darkGold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Connection",
                                      style: TextStyle(
                                        color: darkGold,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "6.5K",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: darkGold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Follow",
                                      style: TextStyle(
                                        color: darkGold,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "19",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: darkGold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "About Andrew :",
                    style: TextStyle(
                        color: darkGold,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Andrew Damien Wilkie is an Australian politician and independent federal member for Clark. Before entering politics Wilkie was an infantry officer in the Australian Army. Wilkie served with the Australian Army from 1980 to 2004.',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 380,
            child: new Text("Email : andrewwilkie@gmail.com",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          Container(
            width: 380,
            child: new Text(
              "Phone : 045953455600 ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Container(
            width: 380,
            child: new Text("Address : 188 Collins Street Hobart, TAS, 7001",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            width: 300.00,
            child: RaisedButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [darkGold, brightOrange]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 40.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Contact Andrew",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
