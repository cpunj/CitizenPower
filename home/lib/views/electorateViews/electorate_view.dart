import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:citizenpower/models/electorateModels/leaderItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../text_styles.dart';

class ElectorateView extends StatefulWidget {
  //Transferring user between widgets
  const ElectorateView({Key key, @required this.user, this.electorateSelected}) : super(key: key);

  final FirebaseUser user;
  final String electorateSelected;

  @override
  _ElectorateViewState createState() => _ElectorateViewState();
}

class _ElectorateViewState extends State<ElectorateView> {
  //Sets bottom nav bar to correct highlight
  int currentIndex = 4;

  String _selectedState;


  List<String> _electorates = ['Bass', 'Braddon', 'Clark', 'Franklin', 'Lyons'];
  String _selectedElectorate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Clark",
            style: appBarStyle(),
          ),
        ),


      body: createElectorateView(context, "Clark", widget.user),
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

class BuildElectorateView extends StatefulWidget {
  @override
  _BuildElectorateViewState createState() => _BuildElectorateViewState();
}

class _BuildElectorateViewState extends State<BuildElectorateView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        // Create new class here which updates the view to the current _selectedElectorate
        // This will be passed in as a String value (but really, will access the database)
        );
  }
}

SingleChildScrollView createElectorateView(
    BuildContext context, String electorateName, FirebaseUser user) {
  // Need to put the whole creation of leader lists inside this function call
  // Also had issues with the createleaderlist function (but it's made in this file??)
  // problem with widget.user

  //Hard coded data for now, when profile is downloaded from Firebase these fields will
  //be filled with the relevant data from the leader profiles present in the currently selected electorate
  LeaderItem andrew = LeaderItem(
      picLink: "assets/Wilkie.jpeg",
      name: "Andrew Wilkie",
      house: "Lower House",
      party: "Independent",
      elected: true);

  LeaderItem nick = LeaderItem(
      picLink: "assets/Mckim.png",
      name: "Nick McKim",
      house: "Upper House",
      party: "Greens",
      elected: true);

  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      //Electorate Image Row
      child: Container(
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
              electorateName,
              style: TextStyle(fontSize: 25.0),
            ),
            Row(children: <Widget>[
              Expanded(
                  child: Card(
                      child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                          /*decoration: BoxDecoration(
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                          image: AssetImage('assets/mtwellington.jpg')
                      ),
                    ),*/
                          child: Column(children: <Widget>[
                            Text(
                                "Population: 70k\n"
                                "Area: 292.26 sq km\n"
                                "Consists of: City of Hobart, City of Glenorchy, northen parts of "
                                "Kingborough Council including Taroona\n",
                                style: TextStyle(fontSize: 16.0),
                                textAlign: TextAlign.center),
                            ExpansionTile(
                                title: Text('Details',
                                    style: TextStyle(
                                        fontSize: 29.0, color: Colors.black),
                                    textAlign: TextAlign.center),
                                trailing: Icon(Icons.keyboard_arrow_down,
                                    color: Colors.black),
                                children: <Widget>[
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 12),
                                      child: Text(
                                        'Description of graph',
                                        style: TextStyle(fontSize: 20.0),
                                      )),
                                  Image(
                                      image: AssetImage(
                                          'assets/mtwellington.jpg')),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 6, horizontal: 12),
                                      child: Text(
                                          'Graph source or more description')),
                                ])
                          ]))))
            ]),
            Row(children: <Widget>[
              Text(
                "House of Representatives",
                style: TextStyle(fontSize: 25.0),
              ),
              IconButton(
                  icon: Icon(Icons.info_outline),
                  color: Colors.black,
                  onPressed: () {
                    // Respond to icon toggle
                    /*setState(() {
                      isSelected = !isSelected;
                      icon = isSelected ? Icons.favorite : Icons.favorite_border;*/
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 16),
                                  height: 200,
                                  child: Column(children: <Widget>[
                                    Text("Parliament House Info",
                                        style: TextStyle(fontSize: 25.0),
                                        textAlign: TextAlign.center),
                                    GestureDetector(
                                      onTap: () {
                                        if (canLaunch("https://peo.gov.au/") !=
                                            null) {
                                          launch("https://peo.gov.au/");
                                        }
                                      },
                                      child: Text("Click here to learn more"),
                                    )
                                  ])));
                        });
                  })
            ]),
            GestureDetector(
              onTap: () {
                goElectorate(context, user, "Z0K6QiyRFEKRvRYjyNp5",
                    "CbabG1p2ZDg47qhe4RSn");
              },
              child: Row(
                children: <Widget>[Expanded(child: leaderListItem(andrew))],
              ),
            ),
            Text(
              "Senate",
              style: TextStyle(fontSize: 25.0),
            ),
            GestureDetector(
              onTap: () {
                goElectorate(
                  context,
                  user,
                  "Z0K6QiyRFEKRvRYjyNp5",
                  "CbabG1p2ZDg47qhe4RSn",
                );
              },
              child: Row(
                children: <Widget>[Expanded(child: leaderListItem(nick))],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget leaderListItem(LeaderItem leaderData) {
  //Using container padding instead of sized boxes to make building and abstracting widgets easier
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Card(
      elevation: 2,
      child: new Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new CircleAvatar(
                  backgroundImage: AssetImage(leaderData.picLink),
                ),
                new Padding(padding: EdgeInsets.only(right: 10.0)),
                new Text(
                  leaderData.name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  leaderData.house,
                  style: textStyleListGrey(),
                ),
                Text(
                  leaderData.party,
                  style: textStyleListGrey(),
                ),
                leaderData.elected == true
                    ? Text(
                        "Current MP",
                        style: textStyleListGrey(),
                      )
                    : Text(
                        "Aspiring MP",
                        style: textStyleListGrey(),
                      ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
