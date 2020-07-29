import 'package:citizenpower/Navigator/NavigatorPushes.dart';
import 'package:flutter/material.dart';
import '../../Layouts/GenericLayouts.dart';
import '../../constants.dart';
import 'profilelist.dart';
import '../../TextStyles.dart';

class ProfilePageEdit extends StatefulWidget {
  @override
  _ProfilePageEditState createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
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
      body: Container(
        child: CustomScrollView(slivers: <Widget>[
          SliverToBoxAdapter(
            child: topProfileLayoutEdit(context),
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
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RaisedButton(
                    child: Text(
                      "Edit",
                    ),
                    onPressed: () {
                      //TODO: Function to edit current logged in user's bio
                    }),
              ),
            ],
          )),
          SliverToBoxAdapter(
            child: Divider(
              height: 10,
              color: Colors.black,
            ),
          )
        ]),
      ),
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
