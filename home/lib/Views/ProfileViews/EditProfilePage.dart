import 'package:citizenpower/TextStyles.dart';
import 'package:citizenpower/controllers/profileController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Layouts/GenericLayouts.dart';

//Handles profile downloading methods and storage
ProfileController profileController = ProfileController();

class ProfilePageEdit extends StatefulWidget {
  const ProfilePageEdit({Key key, @required this.user, this.toggleView})
      : super(key: key);
  final FirebaseUser user;
  final Function toggleView;

  @override
  _ProfilePageEditState createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
  //Used for Bio expansion
  bool isExpanded = true;
  //Used to prevent re-entering same view in bottom nav bar
  int currentIndex = 1;

  final bioController = TextEditingController(text: profileController.getBio());

  @override
  Widget build(BuildContext context) {
    //Gets profile data to fill in ProfilePageEdit View
    profileController.getProfile(widget.user.uid).then((val) {
      //'then()' only runs once FS data has been downloaded
      setState(() {});
    });

    //While profileSnapshot is downloading loading indicator is shown
    return profileController.profileSnapshot != null
        ? Scaffold(
            appBar: topAppBarLayout('Profile'),
            drawer: new Drawer(),
            body: Container(
              child: CustomScrollView(slivers: <Widget>[
                SliverToBoxAdapter(
                  child: topProfileLayoutEdit(
                      context, profileController.getName()),
                ),
                SliverToBoxAdapter(
                  child: Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: TextFormField(
                      minLines: 1,
                      maxLines: 10,
                      decoration: textFormDec(label: 'Bio'),
                      controller: bioController,
                    ),
                  ),
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
                            "Done",
                          ),
                          onPressed: () {
                            profileController.updateBio(
                                widget.user.uid, bioController.text);
                            widget.toggleView();
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
