import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/models/electorateModels/electorate_model.dart';
import 'package:citizenpower/views/electorateViews/electorate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:citizenpower/database.dart';

ElectorateDatabaseMethods electorateDatabaseMethods =
    ElectorateDatabaseMethods();
ElectorateModel electorateModel = ElectorateModel();

class ElectorateController {
  DocumentSnapshot electorateSnapshot;
  //Takes the selected electorate string and calls a database function query to download
  downloadElectorate(String stateID, String electorateName) async {
    electorateDatabaseMethods
        .queryElectorateByName(stateID, electorateName)
        .then((val) {
      electorateSnapshot = val.documents[0];
      electorateModel.name = electorateSnapshot.data["name"];
      electorateModel.area = electorateSnapshot.data["area"];
      electorateModel.consistsOf = electorateSnapshot.data["consistsOf"];
      electorateModel.pop = electorateSnapshot.data["pop"];
    });
  }

  String getName() {
    return electorateModel.name;
  }

  String getArea() {
    return electorateModel.area;
  }

  String getConsistsOf() {
    return electorateModel.consistsOf;
  }

  String getPop() {
    return electorateModel.pop;
  }

  //Returns a stream used to build a list of lower house leaders
  getLowerLeaders(String stateUID, String electorateUID) async {
    return await electorateDatabaseMethods.downloadLowerLeaders(
        stateUID, electorateUID);
  }

  //Returns a stream used to build a list of upper house leaders
  getUpperLeaders(String stateUID) async {
    return await electorateDatabaseMethods.downloadUpperLeaders(stateUID);
  }
}
