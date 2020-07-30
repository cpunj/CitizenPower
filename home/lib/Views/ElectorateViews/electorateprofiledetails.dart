import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class ElectorateDetails extends StatelessWidget {
  const ElectorateDetails({Key key, @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
      title: new Text("Electorate details view "),
    ));
  }
}
