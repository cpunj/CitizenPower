import 'package:citizenpower/Views/ProfileViews/EditProfilePage.dart';
import 'package:citizenpower/Views/ProfileViews/MyProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditSwitch extends StatefulWidget {
  const EditSwitch({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _EditSwitchState createState() => _EditSwitchState();
}

class _EditSwitchState extends State<EditSwitch> {
  bool showNoEdit = true;

  void toggleView() {
    setState(() {
      showNoEdit = !showNoEdit;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showNoEdit) {
      return MyProfilePage(user: widget.user, toggleView: toggleView);
    } else {
      return ProfilePageEdit(user: widget.user, toggleView: toggleView);
    }
  }
}
