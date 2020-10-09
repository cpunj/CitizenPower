import 'package:citizenpower/controllers/profile_controller.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/views/genericWidgets/generic_layouts.dart';
import 'package:citizenpower/models/profile.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../text_styles.dart';

FirebaseStorage storage = FirebaseStorage();
ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();

//Handles profile downloading methods and storage
ProfileController editProfileController = ProfileController();

class ProfilePageEdit extends StatefulWidget {
  const ProfilePageEdit(
      {Key key, @required this.user, this.toggleView, this.profile})
      : super(key: key);
  final FirebaseUser user;
  //Needs removal
  final Function toggleView;
  //Takes the profile downloaded in the previous view
  final Profile profile;

  @override
  _ProfilePageEditState createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
  //Used for Bio expansion
  bool isExpanded = true;
  //Used to prevent re-entering same view in bottom nav bar
  int currentIndex = 1;
  //Keeps track of whether the user has updated their picture
  bool changedPic = false;
  //Determines when to rebuild the edit screen with a loading indicator rather than
  //the normal button, only really relevant for profile pic upload
  bool uploadingChanges = false;

  final bioCtr = TextEditingController();
  final nameCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Used profile downloaded in my_profile.dart to fill text
    // controllers with the users current information as well as the current profile pic
    bioCtr.text = widget.profile.bio;
    nameCtr.text = widget.profile.name;
    if (changedPic != true) {
      editProfileController.profile.picLink = widget.profile.picLink;
    }
    //Should probably be in database methods but it's here for now
    //Takes data external to the app (device gallery)so returns a Future through the use of 'async' function marker
    //This allows the main program thread to continue running and stops breaking from null errors and such
    Future getImage() async {
      print("start GetImage");
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      //Stores the file in the profile controller
      //And reruns state build to show the selected picture
      setState(() {
        editProfileController.profileImage = image;
        changedPic = true;
      });
      print("end GetImage");
    }

    return Scaffold(
      appBar: topAppBarLayout('Profile'),
      drawer: new Drawer(),
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
                      FlatButton(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: CircleAvatar(
                            radius: 50.0,
                            //Has the user selected a profile pic from gallery since entering the edit view?
                            // Then show that.
                            backgroundImage: (editProfileController.profileImage !=
                                    null)
                                ? FileImage(editProfileController.profileImage)
                                //User has not selected a pic, do the already have a profile pic uploaded?
                                //Then show that.
                                : (editProfileController.getPic() != null)
                                    ? NetworkImage(editProfileController.getPic())
                                    //User does not currently have any pic selected OR downloaded?
                                    //Show placeholder
                                    : AssetImage('pentagramBW.png'),
                          ),
                        ),
                        onPressed: () {

                          getImage().then((completeFunc) {
                            setState(() {
                              uploadingChanges = true;
                            });
                            editProfileController.uploadProfilePic(widget.user, context, changedPic).whenComplete (() {
                              setState(() {
                                uploadingChanges = false;
                                changedPic = true;
                              });
                            });
                          });
                        },
                      ),
                    ],
                  ),
                  //Needs to link to a profile list
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                          height: 50,
                          width: 200,
                          child: TextFormField(
                            minLines: 1,
                            decoration: textFormDec(label: 'Name'),
                            controller: nameCtr,
                          ))
                    ],
                  ),
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
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: TextFormField(
                minLines: 1,
                maxLines: 10,
                decoration: textFormDec(label: 'Bio'),
                controller: bioCtr,
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
                    child: uploadingChanges == false
                        ? Text(
                            "Done",
                          )
                        : Container(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.black,
                            ),
                          ),
                    //Upload all the data the is currently present in the edit view
                    //Add more functions if profile view fields are expanded
                    onPressed: () {
                      print("profile's link is");
                      editProfileController.updateEditedProfile(widget.user.uid, nameCtr.text, bioCtr.text).then((funcComplete) {
                        goMyProfilePage(context, widget.user);
                      });
                      //Keeps Form Field looking the same during loading
                      widget.profile.name = nameCtr.text;
                      widget.profile.bio = bioCtr.text;
                      setState(() {
                        //Shows loading icon while profile data is uploaded
                        uploadingChanges = true;
                      });
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
    );
  }
}
