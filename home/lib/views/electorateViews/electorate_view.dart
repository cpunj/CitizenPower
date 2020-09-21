import 'package:citizenpower/controllers/electorateControllers/electorate_controller.dart';
import 'file:///C:/Users/jackl/AndroidStudioProjects/CitizenPower/home/lib/views/genericWidgets/generic_layouts.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:citizenpower/models/electorateModels/leaderItem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../text_styles.dart';

ElectorateController electorateController = ElectorateController();

class ElectorateView extends StatefulWidget {
  //Transferring user between widgets
  const ElectorateView(
      {Key key,
      @required this.user,
      this.stateSelected,
      this.electorateSelected})
      : super(key: key);

  final FirebaseUser user;
  final String stateSelected;
  final String electorateSelected;

  @override
  _ElectorateViewState createState() => _ElectorateViewState();
}

class _ElectorateViewState extends State<ElectorateView> {
  //Sets bottom nav bar to correct highlight and block unneccessary navigation
  int currentIndex = 4;
  Stream lowerStream;
  Stream upperStream;

  Widget lowerLeaderList(String stateSelected, String electorateSelected) {
    electorateController
        .getLowerLeaders(stateSelected, electorateSelected)
        .then((value) {
      lowerStream = value;
    });
    //StreamBuilder takes a Stream<QuerySnapshot> from a Firebase query to build the widgets as the data is downloaded
    return StreamBuilder(
      stream: lowerStream,
      builder: (context, snapshot) {
        //Only build the widget if the data has been downloaded, otherwise return an empty container
        return snapshot.hasData
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                //Prevents the view breaking
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  //TODO: Allow for picLink (and any other parameters) to be null without widget breaking
                  return GestureDetector(
                    onTap: () {
                      goElectorate(
                          context,
                          widget.user,
                          widget.stateSelected,
                          electorateController.electorateSnapshot.documentID,
                          snapshot.data.documents[index].documentID,
                          snapshot.data.documents[index].data["upper"]);
                    },
                    child: leaderListItem(
                      isElected:
                          snapshot.data.documents[index].data["isElected"],
                      party: snapshot.data.documents[index].data["party"],
                      house: snapshot.data.documents[index].data["house"],
                      profilePic: snapshot.data.documents[index].data["pic"],
                      name: snapshot.data.documents[index].data["name"],
                      upper: snapshot.data.documents[index].data["upper"],
                    ),
                  );
                })
            : Container();
      },
    );
  }

  Widget upperLeaderList(String stateSelected) {
    electorateController.getUpperLeaders(stateSelected).then((value) {
      setState(() {
        upperStream = value;
      });
    });
    //StreamBuilder takes a Stream<QuerySnapshot> from a Firebase query to build the widgets as the data is downloaded
    return StreamBuilder(
      stream: upperStream,
      builder: (context, snapshot) {
        //Only build the widget if the data has been downloaded, otherwise return an empty container
        return snapshot.hasData
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                //Prevents the view breaking
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      goElectorate(
                          context,
                          widget.user,
                          stateSelected,
                          null,
                          snapshot.data.documents[index].documentID,
                          snapshot.data.documents[index].data["upper"]);
                    },
                    child: leaderListItem(
                      isElected:
                          snapshot.data.documents[index].data["isElected"],
                      party: snapshot.data.documents[index].data["party"],
                      house: snapshot.data.documents[index].data["house"],
                      profilePic: snapshot.data.documents[index].data["pic"],
                      name: snapshot.data.documents[index].data["name"],
                      upper: snapshot.data.documents[index].data["upper"],
                    ),
                  );
                })
            : Container();
      },
    );
  }

  Widget leaderListItem(
      {String profilePic,
      String name,
      String house,
      String party,
      bool isElected,
      bool upper}) {
    //Using container padding instead of sized boxes to make building and abstracting widgets easier
    return Container(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 2,
        child: new Container(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new CircleAvatar(
                    backgroundImage: NetworkImage(profilePic),
                  ),
                  new Padding(padding: EdgeInsets.only(right: 10.0)),
                  new Text(
                    name,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  upper == false
                      ? Text(
                          "Lower House",
                          style: textStyleListGrey(),
                        )
                      : Text(
                          "Upper House",
                          style: textStyleListGrey(),
                        ),
                  Text(
                    party,
                    style: textStyleListGrey(),
                  ),
                  isElected == true
                      ? upper == false
                          ? Text(
                              "Current MP",
                              style: textStyleListGrey(),
                            )
                          : Text(
                              "Current Senator",
                              style: textStyleListGrey(),
                            )
                      : upper == false
                          ? Text(
                              "Aspiring MP",
                              style: textStyleListGrey(),
                            )
                          : Text(
                              "Aspiring Senator",
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

  @override
  Widget build(BuildContext context) {
    if (electorateController.electorateSnapshot == null ||
        widget.electorateSelected != electorateController.getName()) {
      electorateController
          .downloadElectorate(widget.stateSelected, widget.electorateSelected)
          .then((val) {
        //'then()' only runs once FS data for view has been downloaded
        setState(() {});
      });
    }
    return (electorateController.electorateSnapshot != null)
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                electorateController.getName(),
                style: appBarStyle(),
              ),
            ),
            body: SingleChildScrollView(
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
                        electorateController.getName(),
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Row(children: <Widget>[
                        Expanded(
                            child: Card(
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 12),
                                    child: Column(children: <Widget>[
                                      Text(
                                          "Population: " +
                                              electorateController.getPop() +
                                              "\n"
                                                  "Area: " +
                                              electorateController.getArea() +
                                              "\n"
                                                  "Consists of: " +
                                              electorateController
                                                  .getConsistsOf(),
                                          style: TextStyle(fontSize: 16.0),
                                          textAlign: TextAlign.center),
                                      ExpansionTile(
                                          title: Text('Details',
                                              style: TextStyle(
                                                  fontSize: 29.0,
                                                  color: Colors.black),
                                              textAlign: TextAlign.center),
                                          trailing: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: Colors.black),
                                          children: <Widget>[
                                            Container(
                                              child: Image(
                                                  image: AssetImage("assets/age.png")
                                              ),
                                            ),
                                            Container(
                                                padding: EdgeInsets.fromLTRB(12.0, 1.0, 12.0, 40.0),
                                                child:Text("Tasmania's gender ratio is almost even, with 49.5% male and 50.5% female.\n"
                                                    "There are significantly less people in the 80+ age group, compare to other age groups.")
                                            ),
                                            Container(
                                              child: Image(
                                                  image: AssetImage("assets/employment.png")
                                              ),
                                            ),
                                            Container(
                                                padding: EdgeInsets.fromLTRB(12.0, 1.0, 12.0, 40.0),
                                                child:Text("An example of a chart to show the employment rate. Image found on Google.")
                                            ),
                                            Container(
                                              child: Image(
                                                  image: AssetImage("assets/income.png")
                                              ),
                                            ),
                                            Container(
                                                padding: EdgeInsets.fromLTRB(12.0, 1.0, 12.0, 20.0),
                                                child:Text("An example of a chart to show the income of people. This is only a made up data.")
                                            ),
                                          ])
                                    ]))))
                      ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "House of Representatives",
                              style: TextStyle(fontSize: 25.0),
                            ),
                            IconButton(
                                icon: Icon(Icons.info_outline),
                                color: Colors.black,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                            child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 16,
                                                    horizontal: 16),
                                                height: 200,
                                                child:
                                                    Column(children: <Widget>[
                                                  Text("Parliament House Info",
                                                      style: TextStyle(
                                                          fontSize: 25.0),
                                                      textAlign:
                                                          TextAlign.center),
                                                  GestureDetector(
                                                    onTap: () {
                                                      if (canLaunch(
                                                              "https://peo.gov.au/") !=
                                                          null) {
                                                        launch(
                                                            "https://peo.gov.au/");
                                                      }
                                                    },
                                                    child: Text(
                                                        "Click here to learn more"),
                                                  )
                                                ])));
                                      });
                                })
                          ]),
                      lowerLeaderList(
                          widget.stateSelected, widget.electorateSelected),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Senate",
                          style: TextStyle(fontSize: 25.0),
                        ),
                      ),
                      upperLeaderList(widget.stateSelected),
                    ],
                  ),
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
          )
        : Container(
            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
