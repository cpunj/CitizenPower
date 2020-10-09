import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import '../navigator/navigator_pushes.dart';
import '../navigator/navigator_pushes.dart';

class ProfileController {
  //Holds FS Snapshot once it is downloaded from FS
  DocumentSnapshot profileSnapshot;
  //Holds the current logged in user
  //The profile that will be loaded into profile View
  Profile profile = Profile();
  //Class containing methods for downloading from FS
  ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();
  File profileImage;

  //get name of downloaded profile
  String getName() {
    return profile.name;
  }

  //get bio of downloaded profile
  String getBio() {
    return profile.bio;
  }

  //get pic URL of downloaded profile
  String getPic() {
    return profile.picLink;
  }

  //get full downloaded profile
  Profile getProfile() {
    return profile;
  }

  updateBio(String uID, String bio) async {
    if (bio != null) {
      return await profileDatabaseMethods.updateUserBio(bio, uID);
    }
    print("update bio complete");
  }

  //uploads the given name to the document with the corresponding uID
  updateName(String uID, String name) async {
    if (name != null) {
      await profileDatabaseMethods.updateUserName(name, uID);
    }
    print("update name complete");
  }

  updatePicLink(String uID) async {
    await profileDatabaseMethods.updatePicLink(profile.picLink, uID);
    print("update piclink complete");
  }

  updateEditedProfile(String uID, String name, String bio) async {
    print(profile.picLink);
    await updateName(uID, name);
    await updateBio(uID, bio);
    await updatePicLink(uID);
    print("end of updateEditedProfile");
  }

  uploadProfilePic(FirebaseUser user, BuildContext context, bool changedPic) async {
    print("start uploadProfilePic");
    //Only runs the the function if the the user has actually updated their profile picture to prevent storage waste
    if (changedPic == true) {
      await profileDatabaseMethods.uploadPic(context, profileImage).then((dlURL) {
        profile.picLink = dlURL;
      });
    }
    print("end uploadProfilePic");
  }

  //Takes the UID of a user and returns a Stream<QuerySnapshot> to build a list of post widgets
  //based on how many posts are present in the users post collection
  getUserPosts(String uID) async {
    return profileDatabaseMethods.getUserPostsByUID(uID);
  }

  //Used to get profile data, async to allow setState use in view
  loadProfile(String uID) async {
    profileDatabaseMethods
        //Downloads profile based on the UID stored in user from app login
        .getUserByUID(uID)
        //getUserByUID() returns a Future (main program thread continues),
        // 'then()' only runs once Future is actually downloaded and becomes a DocumentSnapshot
        //Once DocumentSnapshot is downloaded snapshot is stored in profileSnapshot and
        // widget is rebuilt in view using SetState()
        .then((val) {
      profileSnapshot = val;
      profile.name = profileSnapshot.data["name"];
      profile.bio = profileSnapshot.data["bio"];
      profile.picLink = profileSnapshot.data["picLink"];
    });
  }

  String getEmail() {
    return profile.email;
  }
}
