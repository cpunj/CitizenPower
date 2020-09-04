import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/models/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController {
  //Holds FS Snapshot once it is downloaded
  DocumentSnapshot profileSnapshot;
  //Holds the current logged in user
  //The profile that will be loaded into profile View
  Profile profile = Profile();
  //Class containing methods for downloading from FS
  ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();

  //get name of downloaded profile
  String getName() {
    return profile.name;
  }

  //get bio of downloaded profile
  String getBio() {
    return profile.bio;
  }

  updateBio(String uID, String bio) {
    if (bio != null) {
      profileDatabaseMethods.updateUserBio(bio, uID);
    }
  }

  updateName(String uID, String name) {
    if (name != null) {
      profileDatabaseMethods.updateUserName(name, uID);
    }
  }

  //Used to get profile data, async to allow setState use in view
  getProfile(String uID) async {
    profileDatabaseMethods
        //Downloads profile based on the UID stored in user from app login
        .getUserByUID(uID)
        //getUserByUID() returns a Future (main program thread continues), 'then()' only runs once Future is actually downloaded as a DocumentSnapshot
        //Once DocumentSnapshot is downloaded snapshot is stored in profileSnapshot and widget is rebuilt in view using SetState
        .then((val) {
      profileSnapshot = val;
      profile.name = profileSnapshot.data["name"];
      profile.bio = profileSnapshot.data["bio"];
    });
  }
}
