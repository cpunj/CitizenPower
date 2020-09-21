import 'dart:io';
import 'dart:ui';
import 'package:citizenpower/controllers/group_controller.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';

import '../../models/group.dart';
import 'package:citizenpower/models/group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../constants.dart';
import '../profileViews/profile_page_edit.dart';

GroupController groupController = new GroupController();

class CreateNewGroup extends StatefulWidget {
  final FirebaseUser user;

  const CreateNewGroup({Key key, this.user}) : super(key: key);

  @override
  _CreateNewGroupEState createState() => _CreateNewGroupEState();
}

class _CreateNewGroupEState extends State<CreateNewGroup> {
  File eventImage;
  List<bool> isSelected;
  bool privacyController;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    isSelected = [false, true];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      //Stores the file in the profile controller
      //And returns state build to show the selected picture
      setState(() {
        groupController.groupImage = image;
      });
    }

    return Scaffold(
      appBar: new AppBar(
        title: Text("Create Group"),
        elevation: 1.0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText: "Group Name",
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 5),
                labelText: "Group Description",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: 60,
          ),

          // Allows the user to select a new group image by tapping on one that's already uploaded
          groupController.groupImage != null
              ? GestureDetector(
                  onTap: () {
                    print('new group image');
                    getImage();
                  },
                  child: Container(
                      // Stores the image a user has selected
                      padding: EdgeInsets.only(top: 5.0),
                      //Limits the size of the given image
                      height: 200,
                      child: Image.file(groupController.groupImage)),
                )

              // If no image has already been selected then allow the user to upload one
              : OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    getImage();
                    groupController.uploadGroupPic(context);
                  },
                  child: Text("Add group photo"),
                ),

          SizedBox(
            height: 20,
          ),
          Column(children: [
            Container(
                padding: EdgeInsets.only(bottom: 7),
                child: Text("Choose Privacy Level")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Toggle buttons for the boolean privacy value (the group's privacy setting)
                ToggleButtons(
                  selectedBorderColor: darkGold,
                  fillColor: darkGold,
                  selectedColor: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Text(
                        'Public',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Text(
                        'Private',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                      // Here, if the index == 0 then group preference is Public; or if index == 1 it's Private

                      if (index == 0) {
                        // This needs to be integrated into database accessing (somehow)
                        privacyController = true;
                        print('Public');
                      } else {
                        privacyController = false;
                        print('Private');
                      }
                    });
                  },
                  isSelected: isSelected,
                ),
              ],
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(20.0),
              color: darkGold,
              child: new MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  textColor: Colors.white,
                  child: new Text(
                    "Create",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    // When the create button is clicked, the user information is uploaded to the database
                    groupController.uploadGroup(context, nameController.text,
                        descriptionController.text, privacyController);

                    // The user is then returned to the list of groups
                    goGroupList(context, widget.user);
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}
