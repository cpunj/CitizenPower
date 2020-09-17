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
        .orderBy("name")
        .snapshots();
  }

  //Returns a stream to build the upper house leader list
  downloadUpperLeaders(String stateUID) async {
    return await Firestore.instance
        .collection("states")
        .document(stateUID)
        .collection("upperLeaders")
        .orderBy("name")
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
    ///ALL STATES HAVE BEEN UPLOADED
    String stateID = "QLD";

    //Converts the post's data to a Map for Firebase document upload.
    Map<String, dynamic> stateMap = {
      "name": "Queensland",
    };

    Firestore.instance.collection("states").document(stateID).setData(stateMap);
  }

  uploadElectorate() {
    String stateID = "TAS";
    String electorateID = "Franklin";
    String consistsOf =
        "The Division of Franklin consists of the Huon Valley, part of Clarence, and part of Kingborough.";
    String area = "10,009 sq km";
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
    String electorateID = "Franklin";

    Map<String, dynamic> leaderMap = {
      "name": electorateID,
      "bio": "Andrew was re-elected with an increased margin in 2013, and then again in 2016, "
          "and continues to be active across a range of issues including health, education and science,"
          " and jobs, as well as the issues that the major parties ignore including "
          "animal welfare, gambling reform, asylum seekers, foreign and security policy and climate change.",
      "electorate": "Franklin - Tasmania",
      "party": "Labour",
      "power": "Since 2007",
      "pic": "https://scontent.fcbr1-1.fna.fbcdn.net/v/t1.0-9/118770623_1778820882281313_5144872235898905306"
          "_n.jpg?_nc_cat=105&_nc_sid=09cbfe&_nc_ohc=-1T268QwYKUAX9h1oMe&_nc_ht=scontent.fcbr1-1.fna&oh=c7222fe5bbe8df3dd75864096356ab80&oe=5F891DAB",
      "isElected": true,
      "upper": false
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
      "name": "Eric Abetz",
      "bio": "Eric was born on 25 January 1958 in Stuttgart, Germany. Coming to Tasmania with his parents and five siblings in 1961 on an assi"
          "sted passage, his father worked alongside many other immigrant Tasmanians on the Hydro Schemes. Eric attended Moonah and"
          " Blackmans Bay Primary Schools, Taroona High School and Hobart Matricu"
          "lation College. He then went on to study Arts and Law at the University of Tasmania.",
      "electorate": "Tasmania",
      "party": "Liberal",
      "power": "Since 1994",
      "pic": "https://scontent.fcbr1-1.fna.fbcdn.net/v/t1.0-9/28684942_2031949983487577_6533127896075448486_n.jpg?_nc"
          "_cat=101&_nc_sid=09cbfe&_nc_ohc=8Sy8t5-xqrYAX_KD8ge&_nc_ht=scontent.fcbr1-1.fna&oh=83fe1206c6e33bc2b561a8935c817a79&oe=5F89695E",
      "isElected": true,
      "upper": true,
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
