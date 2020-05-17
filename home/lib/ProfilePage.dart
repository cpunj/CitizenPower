import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'settings.dart';
import 'constants.dart';
import 'electorate.dart';
import 'profilelist.dart';
import 'AppHome.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  var profileOptions = ['Edit'];
  var currentItemSelected = 'Edit';

  _onTap(int index) {
    //This acts as a navigator for the Nav Bar

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppHome()),
      );
    } else if (index == 1) {
      //Need to implement home page, AppHome()
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Electorate()),
      );
    } else if (index == 3) {
      /*
       Navigator.push(

         context,
         MaterialPageRoute(
             builder: (context) => Electorate()),
       ); */
    } else if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Setting()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var profileOptions = ['Edit'];
    var currentItemSelected = 'Edit';
    void choiceAction(String choice) {
      print('working');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: brightOrange,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          " Profile ",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
          ),

          //Going to be used to access edit page

          /*PopupMenuButton<String>(
              onSelected: choiceAction, itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {

                })
          })*/
        ],
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          //Container for profile image
          child: Container(
            margin: EdgeInsets.only(top: 20),
            height: 160,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage: AssetImage('assets/grace.jpg'),
                  ),
                ),
                //Needs to link to a profile list

                MaterialButton(
                  child: Text(
                    "Community",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: darkGold,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfileList()));
                  },
                ),
                Text(
                    "With Grace",
                    style: TextStyle(
                      color: Colors.black,
                        fontSize: 18,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        height: 1.2,
                        fontWeight: FontWeight.w600
                    )
                )
              ],

            ),

          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: <Widget>[
              Divider(
                height: 10,
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.only(left: 100, right: 100, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //Below code removed and replaced with flat button for electorate

                    Icon(Icons.grid_on),
                    //Icon(Icons.list),
                    Icon(Icons.person_pin_circle),
                  ],
                ),
              ),
              Divider(
                height: 10,
                color: Colors.black,
              ),

            ],
          ),
        ),
        SliverStaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            staggeredTiles: [
              StaggeredTile.count(1, 2),
              StaggeredTile.count(1, 1),
              StaggeredTile.count(1, 1),
            ],
            children: <Widget>[
              ClipRect(
                child: Image.asset("assets/img.png", fit: BoxFit.cover),
              ),
              ClipRect(
                child: Image.asset("assets/img.png", fit: BoxFit.cover),
              ),
              ClipRect(
                child: Image.asset("assets/img.png", fit: BoxFit.cover),
              ),
            ])
      ]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin_circle),
              title: Text('Electorate'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              title: Text('Event'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
          onTap: (index) {
            setState(() {
              _onTap(index);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
