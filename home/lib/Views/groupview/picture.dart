import 'package:citizenpower/constants.dart';
import 'package:flutter/material.dart';

class GroupPicture extends StatefulWidget {
  @override
  _GroupPictureState createState() => _GroupPictureState();
}

class _GroupPictureState extends State<GroupPicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage("assets/CitizenLogo.png"), fit: BoxFit.cover),
      ),
    );
  }
}
