import 'package:citizenpower/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';

class PollPage extends StatefulWidget {
  @override
  _PollPageState createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" poll of Top issues "),
        backgroundColor: brightOrange,
      ),
    );
  }
}
