import 'package:citizenpower/Views/ElectorateViews/electorateview.dart';
import 'package:citizenpower/Views/ElectorateViews/imageview.dart';
import 'package:citizenpower/Views/ProfileViews/switchedit.dart';
import 'package:citizenpower/Views/SocialMenu.dart';
import 'package:citizenpower/Views/createpostview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../AppHome.dart';
import '../Views/MessageViews/home_screen.dart';
import '../Views/ProfileViews/ProfilePage.dart';
import '../Views/ProfileViews/MyProfilePage.dart';
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

goNewPost(BuildContext context, FirebaseUser user) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewPost(),
      ));
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

goProfilePage(BuildContext context, FirebaseUser user) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => EditSwitch(user: user)));
}

goSocialMenu(BuildContext context, FirebaseUser user) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => SocialMenu(user: user)));
}

goMessage(BuildContext context, FirebaseUser user) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomeScreen(user: user)));
}

goElectorateView(BuildContext context, FirebaseUser user) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => ElectorateView(user: user)));
}

goImageView(BuildContext context, String image) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ImageView(image: image)),
  );
}
