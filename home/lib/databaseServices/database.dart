import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDatabaseMethods {
  uploadRegistrationInfo(Map userMap) {
    Firestore.instance.collection("users").add(userMap);
  }

  getUsersByUsername(String username) async {
    return await Firestore.instance
        .collection("users")
        .where("email", isEqualTo: username)
        .getDocuments();
  }
}
