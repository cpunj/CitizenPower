import 'package:citizenpower/Navigator/navigator_pushes.dart';
import 'package:citizenpower/Views/ProfileViews/profile_list.dart';
import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../controllers/electorateControllers/leader_profile_controller.dart';
import '../../text_styles.dart';
import '../../constants.dart';

/*TODO:
- Create a 'Clark' electorate profile
- Change Grace image to picture of 'Local Member: MP Andrew Wilkie'
- Change numbers to electorate statistics, e.g. population number etc
- Put in button to email/get in touch
 */

LeaderController leaderController = LeaderController();

class Electorate extends StatefulWidget {
  const Electorate({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _ElectorateState createState() => _ElectorateState();
}

class _ElectorateState extends State<Electorate> {
  bool isExpanded = true;
  String issues;
  List<String> _locations = ['Poverty', 'Pollution', 'Homeless'];
  //Used for bottom nav bar functions
  int currentIndex = 4;
  @override
  Widget build(BuildContext context) {
    leaderController.loadLeader('uID', 'uID').then((val) {
      setState(() {});
    });

    return leaderController.leaderSnapshot != null
        ? Scaffold(
            appBar: topAppBarLayout('Leader'),
            drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    accountName: new Text(leaderController.getName()),
                    accountEmail: new Text("andrewwilkie@gmail.com"),
                    currentAccountPicture: new CircleAvatar(
                      backgroundColor: darkGold,
                      child: new Text(
                        "AW",
                        style: TextStyle(color: Colors.black87),
                      ),
                    ),
                  ),
                  new ListTile(
                    title: new Text("About me "),
                    onTap: () => Navigator.of(context).pushNamed("/a"),
                  ),
                  new ListTile(
                    title: new Text("Electorate details"),
                    onTap: () => Navigator.of(context).pushNamed("/b"),
                  )
                ],
              ),
            ),
            body: CustomScrollView(slivers: <Widget>[
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FlatButton(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('assets/Wilkie.jpeg'),
                            ),
                          ),
                          onPressed: () {
                            //TODO:Edit function for current logged in user's profile picture
                          },
                        ),
                      ],
                    ),
                    //Needs to link to a profile list
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          leaderController.getName(),
                          style: profileNameStyle(),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        MaterialButton(
                          child: Text(
                            "Follow Andrew",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: darkGold,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProfileList(user: null)));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  height: 15,
                  color: Colors.black,
                ),
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Card(
                    elevation: 2,
                    margin:
                        EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Bio:',
                        ),
                        Padding(padding: EdgeInsets.only(top: 0, bottom: 0)),
                        Text(
                          leaderController.getBio(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: isExpanded ? null : 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "Electorate",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(leaderController.getElectorate()),
                        ],
                      ),
                      Divider(
                        height: 10,
                        color: Colors.black,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "Party",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(leaderController.getParty()),
                        ],
                      ),
                      Divider(
                        height: 10,
                        color: Colors.black,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "In Power",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(leaderController.getPower()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: RaisedButton(
                  color: darkGold,
                  textColor: Colors.white,
                  child: Text('Connect with me'),
                  onPressed: () {
                    goMessage(context, widget.user);
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: RaisedButton(
                  color: darkGold,
                  textColor: Colors.white,
                  child: Text('Electorate'),
                  onPressed: () {},
                ),
              ),
              SliverToBoxAdapter(
                child: DropdownButton(
                  hint: Text(
                    "Top issues",
                    style: TextStyle(color: darkGold),
                  ),
                  value: issues,
                  onChanged: (newValue) {
                    // ignore: missing_return
                    setState(() {
                      issues = newValue;
                      if (issues == "Issue 1") {
                        print(Text(
                            "This has been a major issue for this company"));
                        return Column(children: <Widget>[
                          Text(" This has been a major issue for this company")
                        ]);
                      }
                      if (issues == "Issue 2") {
                        return Column(children: <Widget>[Text("This")]);
                      }

                      if (issues == "Issue 3") {
                        return Column(children: <Widget>[Text("is")]);
                      }
                    });
                  },
                  items: _locations.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
              ),
            ]),
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
