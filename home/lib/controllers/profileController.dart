import 'package:citizenpower/Models/profile.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController {
  //Holds Firestore Snapshot once it is downloaded
  QuerySnapshot profileSnapshot;

  //The profile that will be loaded into profile View
  Profile profile = Profile();
  //Class containing methods for downloading from FS
  ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();

  //get name of downloaded profile
  String getName() {
    return profile.name;
  }

  //Used to get profile data, async to allow setState use in view
  getProfile(String email) async {
    profileDatabaseMethods
        //Downloads profile based on the email stored in user from app login, uses the given string to search
        //TODO: Having the same email in "users" collection will cause issues, download by id?
        .getUserByEmail(email)
        //getUserByEmail() returns a Future (main program thread continues), 'then' only runs once Future is actually downloaded
        //Once QuerySnapshot is downloaded snapshot is stored in profileSnapshot and widget is rebuilt in view
        .then((val) {
      profileSnapshot = val;
      profile.name = profileSnapshot.documents[0].data["name"];
    });
  }
}
