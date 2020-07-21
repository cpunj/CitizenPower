import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'functions.dart';

class AboutMe extends StatelessWidget {
  final String title;

  const AboutMe({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          leaderViewHeader(
              name: 'Andrew Wilkie',
              postNumber: 142,
              connectionNumber: 6000,
              followNumber: 19),
          bioLayout(
              'Andrew Damien Wilkie is an Australian politician and independent federal member for Clark. Before entering politics Wilkie was an infantry officer in the Australian Army. Wilkie served with the Australian Army from 1980 to 2004.'),
          SizedBox(
            height: 20.0,
          ),
          buttonStyle1("Contact me", null),
        ],
      ),
    );
  }
}
