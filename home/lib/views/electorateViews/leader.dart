import 'package:flutter/material.dart';
import '../../constants.dart';

class Leader extends StatefulWidget {
  @override
  _LeaderState createState() => _LeaderState();
}

class _LeaderState extends State<Leader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: brightOrange,
        title: Text("Leaders View"), // change the name of the title page
      ),
    );
  }
}
