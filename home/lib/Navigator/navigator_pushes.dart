import 'package:citizenpower/Views/ElectorateViews/electorate_profile_details.dart';
import 'package:citizenpower/Views/ElectorateViews/electorate_view.dart';
import 'package:citizenpower/Views/ElectorateViews/image_view.dart';
import 'package:citizenpower/Views/MessageViews/home_screen.dart';
import 'package:citizenpower/Views/create_post_view.dart';
import 'package:citizenpower/Views/profileViews/my_profile.dart';
import 'package:citizenpower/Views/profileViews/profile_page.dart';
import 'package:citizenpower/Views/profileViews/profile_page_edit.dart';
import 'package:citizenpower/Views/social_menu.dart';
import 'package:citizenpower/models/profile.dart';
import 'package:citizenpower/views/profileViews/profile_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/settings.dart';
import '../app_home.dart';

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
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ProfileList()));
}

goProfilePage(BuildContext context, FirebaseUser user) {
  Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => MyProfilePage(user: user)));
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

goEditProfile(BuildContext context, FirebaseUser user, Profile myProfile) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => ProfilePageEdit(
              user: user,
              profile: myProfile,
            )),
  );
}
