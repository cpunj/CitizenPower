import 'package:citizenpower/contactview.dart';
import 'package:flutter/material.dart';
import '../AppHome.dart';
import '../ProfilePage.dart';
import '../ProfilePageEdit.dart';
import '../electorate.dart';
import '../electorateprofiledetails.dart';
import '../profilelist.dart';
import '../settings.dart';

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
