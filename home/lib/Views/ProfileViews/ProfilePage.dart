import 'package:flutter/material.dart';
import '../../Layouts/GenericLayouts.dart';
import '../../constants.dart';
import 'profilelist.dart';
import '../../TextStyles.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  var profileOptions = ['Edit'];
  var currentItemSelected = 'Edit';
  bool isExpanded = true;



  @override
  Widget build(BuildContext context) {
    var profileOptions = ['Edit'];
    var currentItemSelected = 'Edit';
    void choiceAction(String choice) {
      print('working');
    }

    return Scaffold(
      appBar: topAppBarLayout('Profile'),
      drawer: new Drawer(),
      body: CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(
          child: topProfileLayout(context),
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
              onTap(index, context);
            });
          }
          //onTap: _onTap,
          ),
    );
  }
}
