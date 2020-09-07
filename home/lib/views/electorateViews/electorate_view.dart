import 'package:citizenpower/Layouts/generic_layouts.dart';
import 'package:citizenpower/Navigator/navigator_pushes.dart';
import 'package:citizenpower/views/create_post_view.dart';
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

  List<String> _states = ['ACT','NSW','NT','QLD','TAS', 'VIC', 'WA']; // Option 2
  String _selectedState;
  bool _stateSelected;

  List<String> _electorates = ['Bass','Braddon','Clark','Franklin','Lyons'];
  String _selectedElectorate;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:
          AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                DropdownButton(
                    hint:
                    Text(
                      'Select State',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),

                    value: _selectedState,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedState = newValue;
                        _stateSelected = true;
                      });
                    },

                    items: _states.map((location) {
                      return DropdownMenuItem(
                        child: new Text(
                          location,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        value: location,
                      );
                    }).toList(),
                  ),

                SizedBox(
                  width: 10,
                ),

                DropdownButton(
                  hint:
                  Text(
                    'Electorate',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                  ),

                  value: _selectedElectorate,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedElectorate = newValue;
                      BuildElectorateView();
                    });
                  },

                  items: _electorates.map((location) {
                    return _stateSelected != null
                        ?
                    DropdownMenuItem(
                      child: new Text(
                          location,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        value: location,
                      ): DropdownMenuItem(child: Container());

                  }).toList(),
                ),
              ],
            ),

            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Icon(Icons.more_vert),
              ),
            ],
          ),



      body: createElectorateView(context, "Clark"),

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

SingleChildScrollView createElectorateView(BuildContext context, String electorateName){

  // Need to put the whole creation of leader lists inside this function call
  // Also had issues with the createleaderlist function (but it's made in this file??)
  // problem with widget.user

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
                "House of Representatives",
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                 // goElectorate(context, widget.user);
                  Navigator.pushNamed(context, "/z");
                },
                child: Row(
                  children: <Widget>[
                    leaderListItem()
                  ],
                ),
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
                 //goElectorate(context, widget.user);
                  Navigator.pushNamed(context, "/z");
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
  );
}

Card leaderListItem (){
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

