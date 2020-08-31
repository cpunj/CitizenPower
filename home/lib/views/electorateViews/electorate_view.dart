import 'package:citizenpower/Layouts/generic_layouts.dart';
import 'package:citizenpower/Navigator/navigator_pushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../text_styles.dart';

class ElectorateView extends StatefulWidget {
  //Transferring user between widgets
  const ElectorateView({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _ElectorateViewState createState() => _ElectorateViewState();
}

class _ElectorateViewState extends State<ElectorateView> {
  //Sets bottom nav bar to correct highlight
  int currentIndex = 4;

  Widget leaderListItem() {
    return Card(
      elevation: 2,
      child: new Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: AssetImage("assets/Wilkie.jpeg"),
                ),
                new Padding(padding: EdgeInsets.only(right: 10.0)),
                new Text(
                  "Andrew Wilkie",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Lower House",
                  style: textStyleListGrey(),
                ),
                Text(
                  "Independent",
                  style: textStyleListGrey(),
                ),
                Text(
                  "Current MP",
                  style: textStyleListGrey(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //D
      appBar: topAppBarLayout('Clark\'s Leaders'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          //Electorate Image Row
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    //Pushes to ImageView() for user to inspect electorate map
                    //ImageView requires image reference
                    onTap: () {
                      goImageView(context, 'assets/TasFinalImage.png');
                    },
                    child: Card(
                      elevation: 3,
                      child: Image.asset(
                        'assets/TasFinalImage.png',
                        height: 200,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                  GestureDetector(
                    //Pushes to ImageView() for user to inspect electorate map
                    //ImageView requires image reference
                    onTap: () {
                      goImageView(context, 'assets/ClarkFinal.png');
                    },
                    child: Card(
                      elevation: 3,
                      child: Image.asset(
                        'assets/ClarkFinal.png',
                        height: 200,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "House of Representatives",
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  goElectorate(context, widget.user);
                },
                child: leaderListItem(),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Senate",
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  goElectorate(context, widget.user);
                },
                child: Card(
                  elevation: 2,
                  child: new Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new CircleAvatar(
                              backgroundImage: AssetImage("assets/Mckim.png"),
                            ),
                            new Padding(padding: EdgeInsets.only(right: 10.0)),
                            new Text(
                              "Nick McKim",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Upper House",
                              style: textStyleListGrey(),
                            ),
                            Text(
                              "Greens",
                              style: textStyleListGrey(),
                            ),
                            Text(
                              "Current Senator",
                              style: textStyleListGrey(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
