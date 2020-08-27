import 'package:citizenpower/Models/profile.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController {
  ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();

  QuerySnapshot searchSnapshot;
  Profile curProfile = Profile();

  String getName() {
    return curProfile.name;
  }

  setName(String name) {
    curProfile.name = name;
  }

  downloadProfile(String name) async {
    await profileDatabaseMethods.getUsersByUsername(name).then((val) {
      searchSnapshot = val;
      setName(searchSnapshot.documents[0].data["name"]);
    });
  }
}
