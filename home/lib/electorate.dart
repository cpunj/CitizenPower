import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'ProfilePage.dart';
import 'settings.dart';
import 'constants.dart';
import 'electorate.dart';
import 'profilelist.dart';
import 'leader.dart';
import 'AppHome.dart';

/*TODO:
- Create a 'Clark' electorate profile
- Change Grace image to picture of 'Local Member: MP Andrew Wilkie'
- Change numbers to electorate statistics, e.g. population number etc
- Put in button to email/get in touch
 */

class Electorate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout('Electorate'),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Text(
            "Clark",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
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
                  Radius.circular(450),
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
          child: Text(
              " Andrew Damien Wilkie is an Australian politician and independent federal member for Clark. Before entering politics Wilkie was an infantry officer in the Australian Army. Wilkie served with the Australian Army from 1980 to 2004. "),
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
                    Text("Population"),
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
            child: Text('Get In Touch'),
            onPressed: () {},
          ),
        ),
        SliverToBoxAdapter(
          child: RaisedButton(
            color: darkGold,
            textColor: Colors.white,
            child: Text('Leaders'),
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
            child: Text('POLLs'),
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
