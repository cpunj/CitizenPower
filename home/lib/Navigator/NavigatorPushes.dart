import 'file:///C:/Users/jackl/AndroidStudioProjects/CitizenPower/home/lib/Views/contactview.dart';
import 'package:flutter/material.dart';
import '../AppHome.dart';
import '../Views/ProfileViews/ProfilePage.dart';
import '../Views/ProfileViews/ProfilePageEdit.dart';
import '../Views/ElectorateViews/electorate.dart';
import '../Views/ElectorateViews/electorateprofiledetails.dart';
import '../Views/ProfileViews/profilelist.dart';
import '../Views/settings.dart';

goHome(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AppHome()),
  );
}

goProfile(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfileScreen()),
  );
}

goElectorate(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Electorate()),
  );
}

goSettings(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Setting()),
  );
}

goElectorateDetails(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ElectorateDetails()),
  );
}

goContactDetails(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AboutMe()),
  );
}

goProfileList(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProfileList()));
}

goProfilePageEdit(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProfilePageEdit()));
}
