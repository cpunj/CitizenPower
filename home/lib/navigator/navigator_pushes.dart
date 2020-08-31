import 'package:citizenpower/Views/ElectorateViews/electorate_view.dart';
import 'package:citizenpower/Views/ElectorateViews/image_view.dart';
import 'package:citizenpower/Views/ProfileViews/profile_page_edit.dart';
import 'package:citizenpower/Views/social_menu.dart';
import 'package:citizenpower/Views/create_post_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../app_home.dart';
import '../Views/MessageViews/home_screen.dart';
import '../Views/ProfileViews/profile_page.dart';
import '../Views/ElectorateViews/electorate.dart';
import '../Views/ElectorateViews/electorate_profile_details.dart';
import '../Views/ProfileViews/profile_list.dart';
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

goProfilePageEdit(BuildContext context, FirebaseUser user) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => ProfilePageEdit(user: user)));
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
