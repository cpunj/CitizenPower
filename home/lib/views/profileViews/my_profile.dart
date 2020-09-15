import 'package:citizenpower/controllers/profile_controller.dart';
import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../text_styles.dart';
import '../create_post_view.dart';

//Handles profile downloading methods and storage
ProfileController profileController = ProfileController();

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key key, @required this.user, this.toggleView})
      : super(key: key);
  final FirebaseUser user;
  final Function toggleView;

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  //Used for Bio expansion
  bool isExpanded = true;
  //Used to prevent re-entering same view in bottom nav bar
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    //Gets profile data to fill in ProfilePageEdit View
    //only if snapshot has not already been downloaded
    if (profileController.profileSnapshot == null) {
      profileController.loadProfile(widget.user.uid).then((val) {
        //'then()' only runs once FS data for view has been downloaded
        setState(() {});
      });
    }
    //While profileSnapshot is downloading loading indicator is shown instead, setState reruns to
    //build actual view once data is downloaded
    return profileController.postListSnapshot != null
        ? Scaffold(
            appBar: topAppBarLayout('Profile'),
            drawer: new Drawer(),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 110,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: (profileController.getPic() != null)
                                  ? CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage: NetworkImage(
                                          profileController.getPic()),
                                    )
                                  //TODO:Get this widget to actually show when loading the profile pic
                                  : CircularProgressIndicator(),
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
                              profileController.getName(),
                              style: profileNameStyle(),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            MaterialButton(
                              child: Text(
                                getFirstWord(profileController.getName()) +
                                    "'s Community",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              color: darkGold,
                              onPressed: () {
                                goProfileList(context, widget.user);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child:
                          bioLayout2(profileController.getBio(), isExpanded)),
                  SizedBox(height: 9),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: RaisedButton(
                            child: Text(
                              "Edit",
                            ),
                            //Goes to edit view and passes in the currently logged in user, and
                            //The currently downloaded profile
                            onPressed: () {
                              goEditProfile(context, widget.user,
                                  profileController.getProfile());
                            }),
                      ),
                    ],
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
//Need to use a stream builder it would seem
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount:
                          profileController.postListSnapshot.documents.length,
                      itemBuilder: (context, index) {
                        print(profileController.postListSnapshot);
                        return Image.network(
                          profileController.postListSnapshot.documents[index]
                              .data["picLink"],
                        );
                      })
                ]),
              ),
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

        //Build progress indicator if there's no data to build view with yet
        : Container(
            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
