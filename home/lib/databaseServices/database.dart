import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  updateUser(String bio, String uID) {
    Firestore.instance
        .collection("users")
        .document(uID)
        .updateData({"bio": bio});
  }
}
