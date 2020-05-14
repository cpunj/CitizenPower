import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'constants.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  var profileOptions = ['Edit'];
  var currentItemSelected = 'Edit';

  @override
  Widget build(BuildContext context) {
    var profileOptions = ['Edit'];
    var currentItemSelected = 'Edit';

    void choiceAction(String choice) {
      print('working');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          " Profile ",
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlue),
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
          child: Container(
            margin: EdgeInsets.only(top: 20),
            height: 300,
            child: Column(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                child: Image.asset(
                  "assets/grace.jpg",
                  height: 230,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
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
                      "04",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Posts"),
                  ],
                ),
                Divider(
                  height: 10,
                  color: Colors.black,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "213",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Connections"),
                  ],
                ),
                Divider(
                  height: 10,
                  color: Colors.black,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "1K",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text("Linked To"),
                  ],
                ),
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
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin_circle),
            title: Text('Electorate'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text('Event'),
          ),

          /*OLD NAV BAR CODE
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Dashboard'),
            //backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Group'),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add'),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            title: Text('Event'),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            backgroundColor: Colors.black,
          ),

           */
        ],
      ),
    );
  }
}
