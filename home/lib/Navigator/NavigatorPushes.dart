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
import '../loginpage.dart';



goHome(BuildContext context, FirebaseUser user) {
    Navigator.push(
      
      context,
      MaterialPageRoute(builder: (context) => AppHome(user:null),
    ));
  }
  

goProfile(BuildContext context, FirebaseUser user) {
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

goElectorateDetails(BuildContext context, FirebaseUser user) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ElectorateDetails()),
  );
}

goContactDetails(BuildContext context, FirebaseUser user) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AppHome()),
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

goSocialMenu(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => SocialMenu()));
}
