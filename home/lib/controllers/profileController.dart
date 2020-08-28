import 'package:citizenpower/Models/profile.dart';
import 'package:citizenpower/databaseServices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController {
  //Profile for for storing FS data
  //Holds Firestore Snapshot once it is downloaded
  QuerySnapshot profileSnapshot;

  Profile profile = Profile();

  String getName() {
    return profile.name;
  }

  //Class containing methods for downloading from FS
  ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();
  //Used to get profile data, async to allow setState in view
  getProfile(String email) async {
    profileDatabaseMethods
        //Downloads profile based on the email stored in user from login, uses string to search
        //TODO: Having the same email in "users" collection will cause issues, downlaod by id?
        .getUserByEmail(email)
        //getUBE() returns a Future (main thread continues), 'then' only runs once Future is downloaded
        //Once QuerySnapshot is downloaded snapshot is stored in profileSnapshot and widget is rebuilt
        .then((val) {
      profileSnapshot = val;
      profile.name = profileSnapshot.documents[0].data["name"];
    });
  }
}
