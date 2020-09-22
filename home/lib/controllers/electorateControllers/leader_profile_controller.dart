import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/models/electorateModels/leader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Controls the downloading of the leader profile when a
// leader is selected from the electorate view
class LeaderController {
  ElectorateDatabaseMethods electorateDatabaseMethods =
      ElectorateDatabaseMethods();
  DocumentSnapshot leaderSnapshot;

  LeaderModel leader = LeaderModel();

  String getName() {
    return leader.name;
  }

  String getBio() {
    return leader.bio;
  }

  String getElectorate() {
    return leader.electorate;
  }

  String getParty() {
    return leader.party;
  }

  String getPower() {
    return leader.power;
  }

  String getPicLink() {
    return leader.picLink;
  }

  //Takes the electorate ID and leader ID for the leader that is intended to be loaded
  //marked as async because set state() needs to be run after function is complete
  loadLowerLeader(
      String stateUID, String electorateUID, String leaderUID) async {
    electorateDatabaseMethods
        //Give database query function the ID's to download
        .getLowerLeaderByUID(
            stateUID: stateUID,
            electorateUID: electorateUID,
            leaderUID: leaderUID)
        //Run once query is complete
        .then((val) {
      //Store the snapshot returned by the query
      //then store the snapshots data in the leader class within the controller
      print(val);
      leaderSnapshot = val;
      leader.name = leaderSnapshot.data["name"];
      leader.electorate = leaderSnapshot.data["electorate"];
      leader.bio = leaderSnapshot.data["bio"];
      leader.party = leaderSnapshot.data["party"];
      leader.power = leaderSnapshot.data["power"];
      leader.picLink = leaderSnapshot.data["pic"];
    });
  }

  loadUpperLeader(String stateUID, String leaderUID) async {
    electorateDatabaseMethods
        //Give database query function the ID's to download
        .getUpperLeaderByUID(stateUID: stateUID, leaderUID: leaderUID)
        //Run once query is complete
        .then((val) {
      //Store the snapshot returned by the query
      //then store the snapshots data in the leader class within the controller
      print(val);
      leaderSnapshot = val;
      leader.name = leaderSnapshot.data["name"];
      leader.electorate = leaderSnapshot.data["electorate"];
      leader.bio = leaderSnapshot.data["bio"];
      leader.party = leaderSnapshot.data["party"];
      leader.power = leaderSnapshot.data["power"];
      leader.picLink = leaderSnapshot.data["pic"];
    });
  }
}
