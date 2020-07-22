import 'package:flutter/material.dart';
import 'Layouts/GenericLayouts.dart';
import 'constants.dart';
import 'leader.dart';
import 'contactview.dart';
import 'electorateprofiledetails.dart';

/*TODO:
- Create a 'Clark' electorate profile
- Change Grace image to picture of 'Local Member: MP Andrew Wilkie'
- Change numbers to electorate statistics, e.g. population number etc
- Put in button to email/get in touch
 */

class Electorate extends StatefulWidget {
  @override
  _ElectorateState createState() => _ElectorateState();
}

class _ElectorateState extends State<Electorate> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout('Leader'),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Andrew Wilkie"),
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
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutMe()),
              ),
            ),
            new ListTile(
              title: new Text("Electorate details"),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ElectorateDetails()),
              ),
            )
          ],
        ),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: new Text(
            "Clark",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: coolGrey,
            ),
            textAlign: TextAlign.center,
          ),
        )),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 175,
            child: Column(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(550),
                ),
                child: Image.asset(
                  "assets/Wilkie.jpeg",
                  height: 150,
                  width: 200,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ]),
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
              elevation: 2.5,
              margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Bio:',
                  ),
                  Padding(padding: EdgeInsets.only(top: 0)),
                  Text(
                    'I am an Australian politician and independent federal member for Clark. Before entering politics i was an infantry officer in the Australian Army. I served with the Australian Army from 1980 to 2004',
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
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Current MP",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Andrew Wilkie"),
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
                    Text("Independent"),
                  ],
                ),
                Divider(
                  height: 10,
                  color: Colors.black,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "74K",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text("population"),
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
            onPressed: () {},
          ),
        ),
        SliverToBoxAdapter(
          child: RaisedButton(
            color: darkGold,
            textColor: Colors.white,
            child: Text('Electorate'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Leader()));
            },
          ),
        ),
        SliverToBoxAdapter(
          child: RaisedButton(
            color: darkGold,
            textColor: Colors.white,
            child: Text('Issues'),
            onPressed: () {
              /*  Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PollPage()));*/
            },
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: bottomNavBarItems(),
          onTap: (index) {
            onTap(index, context);
          }
          //onTap: _onTap,
          ),
    );
  }
}
