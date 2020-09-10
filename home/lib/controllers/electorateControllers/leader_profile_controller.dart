import 'package:citizenpower/models/electorateModels/leader.dart';
import 'package:citizenpower/views/profileViews/profile_page_edit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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

  loadLeader(String uID) async {
    profileDatabaseMethods
        .getLeaderByUID("Z0K6QiyRFEKRvRYjyNp5", "CbabG1p2ZDg47qhe4RSn")
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
