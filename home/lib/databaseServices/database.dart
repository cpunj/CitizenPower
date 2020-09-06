import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'dart:io';

class ProfileDatabaseMethods {
  //Used for uploading user data to FS when an Auth account is made in registration
  //Uses map to upload registration data and user to keep consistent UID
  uploadRegistrationInfo(Map userMap, FirebaseUser user) {
    Firestore.instance.collection("users").document(user.uid).setData(userMap);
  }

//Used for downloading Snapshot for profile views
  getUserByUID(String uID) async {
    return await Firestore.instance.collection("users").document(uID).get();
  }

  updateUserBio(String bio, String uID) {
    Firestore.instance
        .collection("users")
        .document(uID)
        .updateData({"bio": bio});
    print('This just ran`');
  }

  updateUserName(String name, String uID) {
    Firestore.instance
        .collection("users")
        .document(uID)
        .updateData({"name": name});
  }

  updatePicLink(String picLink, String uID) {
    Firestore.instance
        .collection("users")
        .document(uID)
        .updateData({"picLink": picLink});
  }

  Future uploadPic(BuildContext context, File image) async {
    String fileName = basename(image.path);
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    return taskSnapshot.ref.getDownloadURL();
  }
}
