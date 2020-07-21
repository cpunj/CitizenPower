import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'ProfilePage.dart';
import 'settings.dart';
import 'constants.dart';
import 'electorate.dart';
import 'profilelist.dart';
import 'leader.dart';
import 'AppHome.dart';
import 'functions.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  var profileOptions = ['Edit'];
  var currentItemSelected = 'Edit';
  bool isExpanded = true;

  //Layout function for top of profile page
  Widget topProfileLayout() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/grace.jpg'),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              MaterialButton(
                child: Text(
                  "Grace's Community",
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
            ],
          ),
          //Needs to link to a profile list
          Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Grace Williams",
                style: profileNameStyle(),
              ),
              SizedBox(
                height: 10.0,
              ),
              MaterialButton(
                child: Text(
                  "Connect with Grace",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: darkGold,
                onPressed: () {},
              ),
              SizedBox(
                height: 18.0,
              ),
              MaterialButton(
                  child: Text(
                    "Message Grace",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: darkGold,
                  onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var profileOptions = ['Edit'];
    var currentItemSelected = 'Edit';
    void choiceAction(String choice) {
      print('working');
    }

    return Scaffold(
      appBar: topAppBarLayout('Profile'),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: topProfileLayout(),
        ),
        SliverToBoxAdapter(
          child: Divider(
            height: 10,
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
              elevation: 2.5,
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'About Me',
                  ),
                  Text(
                    'I am the director and founder of Citizen Tasmania. I live in Tasmania where I run Citizen Tasmania',
                    overflow: TextOverflow.ellipsis,
                    maxLines: isExpanded ? null : 100,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 1.0),
        ),
        SliverToBoxAdapter(
          child: Divider(
            height: 10,
            color: Colors.black,
          ),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: bottomNavBarItems(),
          onTap: (index) {
            setState(() {
              onTap(index, context);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
