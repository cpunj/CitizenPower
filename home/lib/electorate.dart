import 'package:citizenpower/Layouts/ElectorateLayouts.dart';
import 'package:citizenpower/Layouts/LeaderViewLayouts.dart';
import 'package:flutter/material.dart';
import 'Layouts/GenericLayouts.dart';
import 'constants.dart';
import 'leader.dart';

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
      drawer: leaderDrawer(context),
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
              child: bioLayout2(
                  'I am an Australian politician and independent federal member for Clark. Before entering politics i was an infantry officer in the Australian Army. I served with the Australian Army from 1980 to 2004',
                  isExpanded)),
        ),
        SliverToBoxAdapter(
          child: electorateInfoLayout(),
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
