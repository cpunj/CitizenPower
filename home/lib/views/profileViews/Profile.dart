import 'package:citizenpower/controllers/profile_controller.dart';
import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:citizenpower/views/messageViews/search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../databaseServices/constants.dart';
import '../../databaseServices/database.dart';
import '../../databaseServices/helper_functions.dart';
import '../../text_styles.dart';
import '../create_post_view.dart';

//Handles profile downloading methods and storage
ProfileController profileController = ProfileController();

class ProfileView extends StatefulWidget {
  const ProfileView(
      {Key key, @required this.user, this.toggleView, this.selectedProfileUID})
      : super(key: key);
  final FirebaseUser user;
  final String selectedProfileUID;

  final Function toggleView;
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

FollowUserAndCreateFollowersList(BuildContext context,
    {BuildContext text, String myUserName}) {
  //if username isn't equal to an empty string

  if (myUserName != null) {
    String followRoomId =
        getFollowRoomId(myUserName, profileController.getEmail());
    print("Doing something");
    List<String> user = [myUserName, profileController.getEmail()];

    Map<String, dynamic> followRoomMap = {
      "users": user,
      "followRoomId": followRoomId
    };
    ProfileDatabaseMethods().createFollowRoom(followRoomId, followRoomMap);
  }
}

class _MyProfilePageState extends State<ProfileView> {
  //Used for Bio expansion
  bool isExpanded = true;
  //Used to prevent re-entering same view in bottom nav bar
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    //Gets profile data to fill in ProfilePageEdit View
    profileController.loadProfile(widget.selectedProfileUID).then((val) {
      //'then()' only runs once FS data for view has been downloaded
      setState(() {});
    });
    bool follow = false;
    bool following = false;
    //While profileSnapshot is downloading loading indicator is shown instead, setState reruns to
    //build actual view once data is downloaded
    return profileController.profileSnapshot != null
        ? Scaffold(
            appBar: topAppBarLayout('Profile'),
            body: Container(
              child: CustomScrollView(slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
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
                        MaterialButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.orangeAccent)),
                            color: follow
                                ? Colors.orangeAccent
                                : Colors.orangeAccent,
                            textColor: Colors.white,
                            child:
                                following ? Text("follow") : Text("following"),
                            //    style: TextStyle(fontSize: 14)
                            onPressed: () {
                              print(widget.user);
                              FollowUserAndCreateFollowersList(context,
                                  myUserName: widget.user.email);
                              setState(() {
                                follow = !following;
                                following = !follow;
                              });
                            })
                      ],
                    ),
                  ),
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
                      child:
                          bioLayout2(profileController.getBio(), isExpanded)),
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
                            "Message",
                          ),

                          //Goes to edit view and passes in the currently logged in user, and
                          //The currently downloaded profile
                          onPressed: () {
                            createChatroomAndStartConversation(context,
                                userEmail: profileController.getName());
                          }),
                    ),
                  ],
                )),
                SliverToBoxAdapter(
                  child: Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                ),

                //Need to figure out how to use ListView in SliveredScrollWidget
//                ListView.builder(
//                    shrinkWrap: true,
//                    itemCount:
//                        profileController.postListSnapshot.documents.length,
//                    itemBuilder: (context, index) {
//                      return Image.network(profileController
//                          .postListSnapshot.documents[index].data["picLink"]);
//                    })
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
        //Build progress indicator if there's no data to build view with yet
        : Container(
            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}

getFollowRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}
