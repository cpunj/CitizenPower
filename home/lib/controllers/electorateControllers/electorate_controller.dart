import 'package:citizenpower/databaseServices/database.dart';
import 'package:citizenpower/models/electorateModels/electorate_model.dart';
import 'package:citizenpower/navigator/navigator_pushes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

ElectorateDatabaseMethods electorateDatabaseMethods =
    ElectorateDatabaseMethods();
ElectorateModel electorateModel = ElectorateModel();

class ElectorateController {
  String selectedState;
  //Stores electorates when selecting via location data
  QuerySnapshot electoratesSnapshot;
  //Stores the data used for filling electorate view
  DocumentSnapshot electorateSnapshot;
  //Takes the selected electorate string and calls a database function query to download
  downloadElectorate(String stateID, String electorateName) async {
    print(stateID + electorateName);
    electorateDatabaseMethods
        .queryElectorateByName(stateID, electorateName)
        .then((val) {
      print(val.documents[0].data["name"]);
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

  loadElectorateFromLocation(BuildContext context, FirebaseUser user) async {
    String userPostcode;

    getCoordinates().then((val) {
      convertToAddress(val).then((placemark) {
        selectedState =
            convertLocationStateToID(placemark[0].administrativeArea);
        userPostcode = placemark[0].postalCode;
        electorateDatabaseMethods
            .queryElectorateByPostcode(selectedState, userPostcode)
            .then((snapshot) async {
          if (snapshot.documents.length == 1) {
            print("One electorate so let's push");
            goSelectedElectorate(context, user, selectedState,
                snapshot.documents[0].data["name"]);
          } else {
            electoratesSnapshot = snapshot;
            print("more than one electorate");
          }
        });
      });
    });
  }

  getCoordinates() async {
    return await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  convertToAddress(Position userPosition) async {
    return await placemarkFromCoordinates(
        userPosition.latitude, userPosition.longitude);
  }

  String convertLocationStateToID(String locationState) {
    if (locationState == "Tasmania") {
      return "TAS";
    }
    return null;
  }
}
