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

  //Used for downloading a lead profile for the leader profile view
  getLeaderByUID({String electorateUID, String leaderUID}) async {
    return await Firestore.instance
        .collection("electorates")
        .document(electorateUID)
        .collection("leaders")
        .document(leaderUID)
        .get();
  }

  //Updates the user doc bio field of the given UID with the given bio
  updateUserBio(String bio, String uID) {
    Firestore.instance
        .collection("users")
        .document(uID)
        .updateData({"bio": bio});
  }

  //Updates the user doc name field of the given UID with the given name
  updateUserName(String name, String uID) {
    Firestore.instance
        .collection("users")
        .document(uID)
        .updateData({"name": name});
  }

  //Updates the picLink doc bio field of the given UID with the given picLink
  updatePicLink(String picLink, String uID) {
    Firestore.instance
        .collection("users")
        .document(uID)
        .updateData({"picLink": picLink});
  }

  createChatRoom(String chatRoomId, chatRoomMap) {
    Firestore.instance
        .collection("ChatRoom")
        .document(chatRoomId)
        .setData(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserbyUsername(String username) async {
    return await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: username)
        .getDocuments();
  }

  getUserbyUserEmail(String userEmail) async {
    return await Firestore.instance
        .collection("users")
        .where("name", isEqualTo: userEmail)
        .getDocuments();
  }

  addConversationMessages(String chatroomId, messageMap) {
    Firestore.instance
        .collection("ChatRoom")
        .document(chatroomId)
        .collection("chats")
        .add(messageMap);
  }

  getConversationMessages(String chatroomId) async {
    return await Firestore.instance
        .collection("ChatRoom")
        .document(chatroomId)
        .collection("chats")
        .orderBy("time", descending: false)
        .snapshots();
  }

  getChatRooms(String userEmail) async {
    return await Firestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userEmail)
        .snapshots();
  }

  //Takes a file and uploads it to Firebase Storage (Same function could be used for more than just profile pic!)
  //Returns a Future class as the DownloadURL string make be loaded first
  Future uploadPic(BuildContext context, File image) async {
    //Changes the file name to the original name on the device when uploaded to FB Storage
    String fileName = basename(image.path);
    //Uses ref().child(fileName) to create a reference necessary for upload
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(fileName);
    //Takes reference created above and stores in it a StorageUploadTask for upload to FB Storage
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
    //Now uploads the file to Storage, await used so main run thread can continue
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    //once uploadTask.onComplete is complete return the string downloadURL for upload to profile's
    //picLink field
    return taskSnapshot.ref.getDownloadURL();
  }
}
