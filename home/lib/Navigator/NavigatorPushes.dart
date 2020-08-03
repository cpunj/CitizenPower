import 'package:citizenpower/Views/MessageViews/home_screen.dart';
import 'package:citizenpower/Views/SocialMenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../AppHome.dart';
import '../Views/ProfileViews/ProfilePage.dart';
import '../Views/ProfileViews/ProfilePageEdit.dart';
import '../Views/ElectorateViews/electorate.dart';
import '../Views/ElectorateViews/electorateprofiledetails.dart';
import '../Views/ProfileViews/profilelist.dart';
import '../Views/settings.dart';

//pushReplacement used for views accessed from bottom nav bar

goHome(BuildContext context, FirebaseUser user) {
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => AppHome(user: user),
      ));
}

goProfile(BuildContext context, FirebaseUser user) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ProfileScreen(user: user)),
  );
}

goElectorate(BuildContext context, FirebaseUser user) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Electorate(user: user)),
  );
}

goSettings(BuildContext context, FirebaseUser user) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Setting(user: user)),
  );
}

goElectorateDetails(BuildContext context, FirebaseUser user) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ElectorateDetails(user: user)),
  );
}

goContactDetails(BuildContext context, FirebaseUser user) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AppHome(user: user)),
  );
}

goProfileList(BuildContext context, FirebaseUser user) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => ProfileList(user: user)));
}

goProfilePageEdit(BuildContext context, FirebaseUser user) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => ProfilePageEdit(user: user)));
}

goSocialMenu(BuildContext context, FirebaseUser user) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => SocialMenu(user: user)));
}

goHomeScreen(BuildContext context, FirebaseUser user) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomeScreen(user: user)));
}
