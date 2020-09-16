import 'package:citizenpower/models/electorateModels/leader.dart';
import 'package:citizenpower/views/profileViews/profile_page_edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Controls the downloading of the leader profile when a
// leader is selected from the electorate view
class LeaderController {
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
  loadLeader(String electorateUID, String leaderUID) async {
    profileDatabaseMethods
        //Give database query function the ID's to download
        .getLeaderByUID(electorateUID: electorateUID, leaderUID: leaderUID)
        //Run once query is complete
        .then((val) {
      //Store the snapshot returned by the query
      //then store the snapshots data in the leader class within the controller
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
