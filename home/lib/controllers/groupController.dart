import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/models/group.dart';
import 'package:firebase_auth/firebase_auth.dart';


class GroupController {

  ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();
  Group newGroup = Group();
  String name;
  File groupImage;

  //Upload group pic function
  // Take code from post_controller


  // Uploads the picture to the database, and returns the URL of the link
  uploadGroupPic(BuildContext context) {
    profileDatabaseMethods.uploadPic(context, groupImage).then((val) {
      newGroup.imagelink = val;
    });
  }


  //    uploadPostPic(context);

  uploadGroup(BuildContext context, String groupName, String groupDescription, bool privacyLevel) {

    // Calls the above function
    uploadGroupPic(context);
    print(groupImage);


    // Below statements take the text input from the create group view
    // NB: privacy is a bool value
    newGroup.groupname = groupName;
    print(groupName);
    newGroup.groupdescription = groupDescription;
    print(groupDescription);
    newGroup.privacylevel = privacyLevel;
    print(privacyLevel);


    // NOW NEED TO CREATE AN UPLOAD GROUP CLASS
    //    profileDatabaseMethods.uploadPost(newPost, uID);
  }
}