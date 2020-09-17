import 'package:citizenpower/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'dart:io';

class ElectorateDatabaseMethods {
  queryElectorateByName(String stateID, String name) async {
    return await Firestore.instance
        .collection("states")
        .document(stateID)
        .collection("electorates")
        .where("name", isEqualTo: name)
        .getDocuments();
  }

  //Returns a stream to build the lower house leader list
  downloadLowerLeaders(String stateUID, String electorateUID) async {
    return await Firestore.instance
        .collection("states")
        .document(stateUID)
        .collection("electorates")
        .document(electorateUID)
        .collection("lowerLeaders")
        .snapshots();
  }

  //Returns a stream to build the upper house leader list
  downloadUpperLeaders(String stateUID) async {
    return await Firestore.instance
        .collection("states")
        .document(stateUID)
        .collection("upperLeaders")
        .snapshots();
  }

  //Used for querying FS for a leader profile
  //Download function so marked as async
  //return await needed for all queries to allow main thread to continue
  getLowerLeaderByUID(
      {String stateUID, String electorateUID, String leaderUID}) async {
    return await Firestore.instance
        .collection("states")
        .document(stateUID)
        .collection("electorates")
        .document(electorateUID)
        .collection("lowerLeaders")
        .document(leaderUID)
        .get();
  }

  getUpperLeaderByUID({String stateUID, String leaderUID}) async {
    return await Firestore.instance
        .collection("states")
        .document(stateUID)
        .collection("upperLeaders")
        .document(leaderUID)
        .get();
  }

  uploadState() {
    String stateID = "QLD";

    //Converts the post's data to a Map for Firebase document upload.
    Map<String, dynamic> stateMap = {
      "name": "Queensland",
    };

    Firestore.instance.collection("states").document(stateID).setData(stateMap);
  }

  uploadElectorate() {
    String stateID = "TAS";
    String electorateID = "Clark";
    String consistsOf = "Greater Hobart, Kingborough, Moonah and Glenorchy";
    String area = "300sqkm";
    String pop = "70k";

    Map<String, dynamic> electorateMap = {
      "name": electorateID,
      "consistsOf": consistsOf,
      "area": area,
      "pop": pop,
    };

    Firestore.instance
        .collection("states")
        .document(stateID)
        .collection("electorates")
        .document(electorateID)
        .setData(electorateMap);
  }

  uploadLowerLeader() {
    String stateID = "TAS";
    String electorateID = "Clark";

    Map<String, dynamic> leaderMap = {
      "name": electorateID,
      "bio": "Andrew was re-elected with an increased margin in 2013, and then again in 2016, "
          "and continues to be active across a range of issues including health, education and science,"
          " and jobs, as well as the issues that the major parties ignore including "
          "animal welfare, gambling reform, asylum seekers, foreign and security policy and climate change.",
      "electorate": "Clark - Tasmania",
      "party": "Independent",
      "power": "Since 2010",
      "pic": "https://scontent.fcbr1-1.fna.fbcdn.net/v/t1.0-9/12347869_1316569355023609_31285353"
          "6532998424_n.png?_nc_cat=105&_nc_sid=09cbfe&_nc_ohc=MKsLsQmJ4C0AX-npKvR&_nc_ht=scontent.fcbr1-1.fna&oh=6ec238d092d68534addaf3e038a42a97&oe=5F88E7EB",
    };

    Firestore.instance
        .collection("states")
        .document(stateID)
        .collection("electorates")
        .document(electorateID)
        .collection("lowerLeaders")
        .document()
        .setData(leaderMap);
  }

  uploadUpperLeader() {
    String stateID = "TAS";

    Map<String, dynamic> leaderMap = {
      "name": "Nick McKim",
      "bio":
          "Nick is a staunch and proud Tasmanian, and an unapologetic defender of the things that make his home state different from the rest of the world.",
      "electorate": "Tasmania",
      "party": "Greens",
      "power": "Since 2015",
      "pic": "https://scontent.fcbr1-1.fna.fbcdn.net/v/t1.0-9/53803656_10155893611627056_2225838651936342016_o.jpg?_nc_cat=111&_nc_sid=09cbfe&_"
          "nc_ohc=GvqBxEaqOQEAX98xZCp&_nc_ht=scontent.fcbr1-1.fna&oh=b375c2d2bbcb4edb57b93a06cc02067c&oe=5F875FEC",
    };

    Firestore.instance
        .collection("states")
        .document(stateID)
        .collection("upperLeaders")
        .document()
        .setData(leaderMap);
  }
}

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

  //Get a Stream<QuerySnapshot> for building post lists
  getUserPostsByUID(String uID) async {
    return await Firestore.instance
        .collection("users")
        .document(uID)
        .collection("posts")
        .snapshots();
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

  getProfilebyUsername(String username) async {
    return await Firestore.instance
        .collection('users')
        .orderBy('name')
        .where('name',
            isGreaterThanOrEqualTo: username, isLessThan: username + 'z')
        .getDocuments();
  }

  getChatRooms(String userEmail) async {
    return await Firestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userEmail)
        .snapshots();
  }

  ///GENERIC, can be used for any functionality that needs to upload an image to Firebase Storage
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

  uploadPost(Post newPost, String uID) {
    //Converts the post's data to a Map for Firebase document upload.
    Map<String, dynamic> postMap = {
      "text": newPost.postText,
      "picLink": newPost.imageLink,
      "time": DateTime.now().millisecondsSinceEpoch,
      "name": newPost.name,
      "profilePicLink": newPost.profilePicLink,
    };

    print(uID);
    //Uploads the post data as a map within the current user's list of posts in their profile
    Firestore.instance
        .collection("users")
        .document(uID)
        .collection("posts")
        .add(postMap);
  }
}
