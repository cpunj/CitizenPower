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

  loadLeader(String electorateUID, String leaderUID) async {
    profileDatabaseMethods
        .getLeaderByUID(electorateUID: electorateUID, leaderUID: leaderUID)
        .then((val) {
      leaderSnapshot = val;
      leader.name = leaderSnapshot.data["name"];
      leader.electorate = leaderSnapshot.data["electorate"];
      leader.bio = leaderSnapshot.data["bio"];
      leader.party = leaderSnapshot.data["party"];
      leader.power = leaderSnapshot.data["power"];
    });
  }
}
