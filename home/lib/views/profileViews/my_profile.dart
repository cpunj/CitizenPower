import 'package:citizenpower/controllers/profile_controller.dart';
import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:citizenpower/views/post_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:time_formatter/time_formatter.dart';
import '../../constants.dart';
import '../../text_styles.dart';
import '../create_post_view.dart';
import '../commentsPage.dart';

import 'package:citizenpower/comments_page.dart';
import 'package:citizenpower/user.dart';

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
  //The stream that the postList widget relies on to build
  Stream postsStream;
  //TODO: Move this function to a higher level file, otherwise this code will be end up being repeated in all dashboard views
  //TODO: Can't scroll using this widget atm, needs fixing
  Widget postList() {
    //StreamBuilder takes a Stream<QuerySnapshot> from a Firebase query to build the widgets as the data is downloaded
    return StreamBuilder(
      stream: postsStream,
      builder: (context, snapshot) {
        //Only build the widget if the data has been downloaded, otherwise return an empty container
        return snapshot.hasData
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                //Prevents the view breaking
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  //TODO: Allow for picLink (and any other parameters) to be null without widget breaking
                  return postWidget(
                    context,
                    snapshot.data.documents[index].data["text"],
                    snapshot.data.documents[index].data["picLink"],
                    snapshot.data.documents[index].data["name"],
                    snapshot.data.documents[index].data["profilePicLink"],
                    formatTime(snapshot.data.documents[index].data["time"]),
                  );
                })
            : Container();
      },
    );
  }

  //Queries Firebase with the curUser's uID for the Stream used to build the post list
  ///Ideally would be implemented in profileController, but not easily movable due to SetState()
  ///Again, this code will repeated in a lot of views due to this
  void initState() {
    profileController.getUserPosts(widget.user.uid).then((value) {
      setState(() {
        postsStream = value;
      });
    });
    super.initState();
  }

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
    return profileController.profileSnapshot != null
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
                            profileController.getName() != null
                                ? Text(
                                    profileController.getName(),
                                    style: profileNameStyle(),
                                  )
                                : Container(),
                            SizedBox(
                              height: 10.0,
                            ),
                            MaterialButton(
                              child: profileController.getName() != null
                                  ? Text(
                                      getFirstWord(
                                              profileController.getName()) +
                                          "'s Community",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(),
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
                            child: profileController.getName() != null
                                ? Text(
                                    "Edit",
                                  )
                                : Text(
                                    "Create",
                                  ),
                            //Goes to edit view and passes in the currently logged in user, and
                            //The currently downloaded profile
                            onPressed: () {
                              //Sets snapshot to null so my profile re downloads the profile data after editing is complete
                              //in profile_page_edit
                              profileController.profileSnapshot = null;
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
                  postList(),
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
