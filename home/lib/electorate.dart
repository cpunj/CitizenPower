import 'package:flutter/material.dart';
import 'ProfilePage.dart';
import 'constants.dart';

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
        appBar: AppBar(
          backgroundColor: brightOrange,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            " Electorate ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Icon(Icons.more_vert),
            ),
          ],
    ),
      body: CustomScrollView(slivers: <Widget>[

        SliverToBoxAdapter(
          child: Padding(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Text("Clark",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          )
        ),

        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(top: 0),
            height: 250,
            child: Column(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Image.asset(
                  "assets/Wilkie.jpeg",
                  height: 230,
                  width: 300,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 0,
              ),
            ]),
          ),
        ),


        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30),
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
            textColor: Colors.black,
            child: Text('Get In Touch'),
            onPressed: (){},
          ),
        ),
      ])
      );
  }
}
