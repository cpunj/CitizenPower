import 'package:citizenpower/controllers/profileController.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Layouts/GenericLayouts.dart';

class ProfilePageEdit extends StatefulWidget {
  const ProfilePageEdit({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _ProfilePageEditState createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
  var profileOptions = ['Edit'];
  var currentItemSelected = 'Edit';
  bool isExpanded = true;

  //Used to prevent re-entering same view in bottom nav bar
  int currentIndex = 1;

  ProfileController profileController = ProfileController();
  ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();

  QuerySnapshot searchSnapshot;

  initiateSearch() {
    profileDatabaseMethods
        .getUsersByUsername(widget.user.email.toString())
        .then((val) {
      setState(() {
        searchSnapshot = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    initiateSearch();
    return searchSnapshot != null
        ? Scaffold(
            appBar: topAppBarLayout('Profile'),
            drawer: new Drawer(),
            body: Container(
              child: CustomScrollView(slivers: <Widget>[
                SliverToBoxAdapter(
                  child: topProfileLayoutEdit(
                      context, searchSnapshot.documents[0].data["name"]),
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
                currentIndex: 1,
                type: BottomNavigationBarType.fixed,
                items: bottomNavBarItems(),
                onTap: (index) {
                  setState(() {
                    onTap(index, context, widget.user, currentIndex);
                  });
                }
                //onTap: _onTap,
                ),
          )
        : Container(
            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
