import 'package:citizenpower/views/genericWidgets/generic_layouts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtherProfileScreen extends StatefulWidget {
  const OtherProfileScreen({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  State createState() => new OtherProfileScreenState();
}

class OtherProfileScreenState extends State<OtherProfileScreen> {
  var profileOptions = ['Edit'];
  var currentItemSelected = 'Edit';
  bool isExpanded = true;
  //Used to decide with buttons function on bottom nav bar, 5 = all functional
  int currentIndex = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBarLayout('Profile'),
      drawer: new Drawer(),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: topProfileLayout(context, widget.user),
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
              child: bioLayout2(
                  'I am the director and founder of Citizen Tasmania. I live in Tasmania where I run the company.',
                  isExpanded)),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 9),
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
              onTap(index, context, widget.user, currentIndex);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
