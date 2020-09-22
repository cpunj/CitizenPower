import 'package:citizenpower/databaseServices/helper_functions.dart';
import 'package:citizenpower/views/homeViews/homeDashboardView/app_home.dart';
import 'package:citizenpower/views/socialViews/groupView/group_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  QuerySnapshot userSnapshot;

  Future<void> signIn(BuildContext context, GlobalKey<FormState> formKey,
      String email, String password) async {
    final formState = formKey.currentState;
    if (formState.validate()) {
      HelperFunctions.saveUserEmailSharedPreference(email);

      formState.save();
      try {
        databaseMethods.getUserbyUserEmail(email).then((val) {
          userSnapshot = val;
          HelperFunctions.saveUserNameSharedPreference(
              userSnapshot.documents[0].data["name"]);
        });
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        HelperFunctions.saveUserLoggedInSharedPreference(true);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AppHome(user: user)));
        HelperFunctions.saveUserEmailSharedPreference(user.email);
      } catch (e) {
        print(e.message);
      }
    }
  }
}
