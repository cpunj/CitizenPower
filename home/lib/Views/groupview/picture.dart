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
      height: 185,
      width: 200,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Image(
          image: AssetImage("assets/CitizenLogo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
