import 'package:citizenpower/controllers/profile_controller.dart';
import 'package:citizenpower/layouts/generic_layouts.dart';
import 'package:citizenpower/models/profile.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../text_styles.dart';

FirebaseStorage storage = FirebaseStorage();

//Handles profile downloading methods and storage
ProfileController profileController = ProfileController();

class ProfilePageEdit extends StatefulWidget {
  const ProfilePageEdit(
      {Key key, @required this.user, this.toggleView, this.profile})
      : super(key: key);
  final FirebaseUser user;
  final Function toggleView;
  final Profile profile;

  @override
  _ProfilePageEditState createState() => _ProfilePageEditState();
}

class _ProfilePageEditState extends State<ProfilePageEdit> {
  //Used for Bio expansion
  bool isExpanded = true;
  //Used to prevent re-entering same view in bottom nav bar
  int currentIndex = 1;

  final bioController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Used profile downloaded in my_profile.dart to fill text controllers with the users current information
    bioController.text = widget.profile.bio;
    nameController.text = widget.profile.name;

    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        profileController.profileImage = image;
      });
    }

    Future uploadPic(BuildContext context) async {
      String fileName = basename(profileController.profileImage.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask =
          firebaseStorageRef.putFile(profileController.profileImage);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
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
                            child: ClipOval(
                              child: SizedBox(
                                  width: 180.0,
                                  height: 180.0,
                                  child:
                                      (profileController.profileImage != null)
                                          ? Image.file(
                                              profileController.profileImage,
                                            )
                                          : Expanded(
                                              child: Icon(
                                              Icons.person,
                                              size: 80,
                                            ))),
                            ),
                          ),
                        ),
                        onPressed: () {
                          getImage();
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
                            controller: nameController,
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
                      profileController.updateName(
                          widget.user.uid, nameController.text);
                      profileController.updateBio(
                          widget.user.uid, bioController.text);
                      uploadPic(context);
                      goProfilePage(context, widget.user);
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
//        : Container(
////            color: Colors.black,
////            child: Center(
////              child: CircularProgressIndicator(),
////            ),
////          )
        ;
  }
}
