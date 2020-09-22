import 'dart:io';

import 'package:citizenpower/models/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../databaseServices/database.dart';
import 'profile_controller.dart';

class EventController {
  Event event = Event();
  DocumentSnapshot eventSnapshot;
  String getEventName() {
    return newEvent.eventname;
  }

  String getdescription() {
    return newEvent.description;
  }

  String getlocation() {
    return newEvent.location;
  }

  List<bool> getprivacylevel() {
    return newEvent.privacylevel;
  }

  //Stores a post for upload or used for view
  Event newEvent = Event();
  //Contains query/add methods
  ProfileDatabaseMethods profileDatabaseMethods = ProfileDatabaseMethods();

  //Stores the file that will be uploaded to FS Storage
  //Uploads the post picture to Firebase Storage and returns the download link

  //Uploads to post to the users profile
  uploadEvent(BuildContext context, String eventname, String description,
      String location, List<bool> privacylevel) {
    //Uploads pic to storage
    //Sets post text from view
    newEvent.eventname = eventname;
    newEvent.description = description;
    newEvent.location = location;
    newEvent.privacylevel = privacylevel;
    //Uploads post with text and file download url
    //TODO: uploadPost needs to wait for uploadPostPic to complete, currently a null picLink is uploaded at 1st attempt
    profileDatabaseMethods.uploadEvent(newEvent);
  }

  getEvents(BuildContext context, String eventname, String description,
      String location) {
    Firestore.instance
        .collection("events")
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        event.eventname = eventSnapshot.data["event"];
        event.description = eventSnapshot.data["description"];
        event.location = eventSnapshot.data["location"];
        result.documentID;
      });
    });
  }
}
