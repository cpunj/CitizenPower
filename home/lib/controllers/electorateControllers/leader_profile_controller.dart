import 'package:citizenpower/views/electorateViews/leader.dart';
import 'package:citizenpower/views/profileViews/profile_page_edit.dart';
import 'package:flutter/material.dart';

//Controls the downloading of the leader profile when a
// leader is selected from the electorate view
class LeaderController {
  Leader leader = Leader();

  loadLeader(String uID) async {
    profileDatabaseMethods.getLeaderByUID(
        "Z0K6QiyRFEKRvRYjyNp5", "CbabG1p2ZDg47qhe4RSn");
  }
}
