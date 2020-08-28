import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDatabaseMethods {
  //Used for uploading user data to Firestore when an Auth account is made in registration
  uploadRegistrationInfo(Map userMap) {
    Firestore.instance.collection("users").add(userMap);
  }

//Used for downloading Snapshot for profile views
  getUserByEmail(String email) async {
    return await Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();
  }
}
